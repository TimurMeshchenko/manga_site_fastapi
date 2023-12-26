from fastapi import APIRouter, Depends, Request, Response
from fastapi.templating import Jinja2Templates
from fastapi.responses import RedirectResponse
from sqlalchemy.orm import Session
from asyncio import get_event_loop

from . import utils, schemas, dependencies, exceptions
from database import get_db
from config import Config

router = APIRouter(tags=["auth"])

templates = Jinja2Templates(directory="../templates")

@router.get("/signin", name="remanga:signin")
async def signin(request: Request, current_user: schemas.User = Depends(dependencies.get_current_user)):
    if current_user: return RedirectResponse(url="/", status_code=303)
    
    context = {"request": request}
    response = utils.set_context_and_cookie_csrf_token(templates, context, "signin.html")

    return response

@router.post("/api/signin")
async def api_signin(response: Response, form_data: schemas.UserSignin, db: Session = Depends(get_db)) -> dict[str, str]:
    user = utils.authenticate_user(db, form_data.username, form_data.password)
    jwt_data = {"sub": user.username}
    access_token = utils.create_access_token(jwt_data)

    response.set_cookie(key="jwt_token", value=access_token, httponly=True, samesite="Strict")
    
    return {"message": "Logged in successfully"}

@router.get("/signup", name="remanga:signup")
async def signup(request: Request, current_user: schemas.User = Depends(dependencies.get_current_user)):
    if current_user: return RedirectResponse(url="/", status_code=303)

    context = {"request": request}
    response = utils.set_context_and_cookie_csrf_token(templates, context, "signup.html")

    return response

@router.post("/api/signup")
async def api_signup(user: schemas.UserSignup, db: Session = Depends(get_db)) -> dict[str, str]:
    utils.validate_registration_form(db, user)
    
    utils.create_user(db, user)

    return {"message": "Signup successfully"}

@router.post("/api/reset_password_email") 
async def reset_password_email(email_dict: dict, db: Session = Depends(get_db)) -> dict[str, str]:
    email = email_dict["email"]

    if utils.is_not_email_exists(db, email): exceptions.email_not_exists()
    
    token_data = {"sub": email}
    password_reset_token = utils.create_access_token(token_data)

    loop = get_event_loop()
            
    if (Config.use_rabbitmq):
        loop.create_task(utils.send_reset_password_email_rabbitmq(email, password_reset_token))
    else:
        loop.create_task(utils.send_reset_password_email(email, password_reset_token))

    return {"message": "Sent to email"}

@router.get("/reset_password") 
async def reset_password(request: Request, token: str = None, db: Session = Depends(get_db)):
    context = {"request": request}
    response = utils.set_context_and_cookie_csrf_token(templates, context, "reset_password.html")

    utils.get_user_by_email_token(db, token)

    return response    

@router.put("/api/reset_password/")
def api_reset_password(user_data: dict, db: Session = Depends(get_db)) -> dict[str, str]:    
    new_password = user_data["new_password"]

    utils.is_invalid_passwords(new_password, user_data["new_password2"])
    
    user = utils.get_user_by_email_token(db, user_data["token"])
    
    hashed_password = utils.get_password_hash(new_password)
    user.password = hashed_password
    
    db.commit()

    return {"message": "Password updated successfully"}