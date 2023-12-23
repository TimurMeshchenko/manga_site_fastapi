from fastapi import APIRouter, Depends, Request, Response
from fastapi.templating import Jinja2Templates
from fastapi.responses import RedirectResponse
from typing import Annotated
from sqlalchemy.orm import Session
import aio_pika

from . import utils, models, schemas, dependencies, exceptions
from database import engine
from config import get_db, use_rabbitmq

models.Base.metadata.create_all(bind=engine)

router = APIRouter(tags=["auth"])

templates = Jinja2Templates(directory="../templates")

Current_user = Annotated[schemas.User, Depends(dependencies.get_current_user)]

channel = queue = None

async def connect_rabbitmq():
    global channel, queue

    connection = await aio_pika.connect_robust(host='localhost')
    channel = await connection.channel()
    queue = await channel.declare_queue('email_queue')

@router.get("/signin", name="remanga:signin")
async def signin(request: Request, current_user: Current_user):
    if current_user: return RedirectResponse(url="/", status_code=303)
    
    context = {"request": request}
    response = utils.set_context_and_cookie_csrf_token(templates, context, "signin.html")

    return response

@router.post("/api/signin")
async def api_signin(request: Request, response: Response, form_data: schemas.UserSignin, db: Session = Depends(get_db)):
    utils.validate_csrf(request)

    user = utils.authenticate_user(db, form_data.username, form_data.password)
    jwt_data = {"sub": user.username}
    access_token = utils.create_access_token(jwt_data)

    response.set_cookie(key="jwt_token", value=access_token, httponly=True, samesite="Strict")
    
    return {"message": "Logged in successfully"}

@router.get("/signup", name="remanga:signup")
async def signup(request: Request, current_user: Current_user):
    if current_user: return RedirectResponse(url="/", status_code=303)

    context = {"request": request}
    response = utils.set_context_and_cookie_csrf_token(templates, context, "signup.html")

    return response

@router.post("/api/signup")
async def api_signup(request: Request, user: schemas.UserSignup, db: Session = Depends(get_db)):
    utils.validate_csrf(request)

    utils.validate_registration_form(db, user)
    
    utils.create_user(db, user)

    return {"message": "Signup successfully"}

@router.post("/api/check_email") 
async def check_email(request: Request, email_dict: dict, db: Session = Depends(get_db)):
    utils.validate_csrf(request)

    if utils.is_not_email_exists(db, email_dict["email"]): exceptions.email_not_exists()
    
    return {"message": "Sent to email"}

@router.post("/api/reset_password_email") 
async def reset_password_email(request: Request, email_dict: dict, db: Session = Depends(get_db)):
    utils.validate_csrf(request)

    email = email_dict["email"]

    if utils.is_not_email_exists(db, email): exceptions.email_not_exists()
    
    token_data = {"sub": email}
    password_reset_token = utils.create_access_token(token_data)

    if (use_rabbitmq):
        await utils.send_reset_password_email_rabbitmq(email, password_reset_token, channel, queue)
    else:
        await utils.send_reset_password_email(email, password_reset_token)

    return {"message": "Sent to email"}

@router.get("/reset_password") 
async def reset_password(request: Request, token: str = "", db: Session = Depends(get_db)):
    context = {"request": request}
    response = utils.set_context_and_cookie_csrf_token(templates, context, "reset_password.html")

    utils.get_user_by_email_token(db, token)

    return response    

@router.post("/api/reset_password/")
def api_reset_password(
    request: Request,
    user_data: dict,
    db: Session = Depends(get_db),
):
    utils.validate_csrf(request)
    
    new_password = user_data["new_password"]

    utils.is_invalid_passwords(new_password, user_data["new_password2"])
    
    user = utils.get_user_by_email_token(db, user_data["token"])
    
    hashed_password = utils.get_password_hash(new_password)
    user.password = hashed_password
    
    db.commit()

    return {"message": "Password updated successfully"}