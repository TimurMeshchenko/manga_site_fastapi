from fastapi import APIRouter, Depends, Request, Response
from fastapi.templating import Jinja2Templates
from fastapi.responses import RedirectResponse
from typing import Annotated
from sqlalchemy.orm import Session

from . import utils, models, schemas, dependencies, exceptions
from database import engine
from config import get_db


models.Base.metadata.create_all(bind=engine)

router = APIRouter(tags=["auth"])

templates = Jinja2Templates(directory="../templates")

Current_user = Annotated[schemas.User, Depends(dependencies.get_current_user)]

@router.get("/signin", name="remanga:signin")
async def signin(request: Request, current_user: Current_user):
    if current_user: return RedirectResponse(url="/", status_code=303)
    
    csrf_token = utils.generate_csrf_token()
    response = templates.TemplateResponse("signin.html", {"request": request, "csrf_token": csrf_token})
    response.set_cookie(key="csrf_token", value=csrf_token, httponly=True, samesite="Strict")

    return response

@router.post("/api/signin")
async def api_signin(request: Request, response: Response, form_data: schemas.UserSignin, db: Session = Depends(get_db)):
    utils.validate_csrf(request, response)

    user = utils.authenticate_user(db, form_data.username, form_data.password)
    jwt_data = {"sub": user.username}
    access_token = utils.create_access_token(jwt_data)

    response.set_cookie(key="jwt_token", value=access_token, httponly=True, samesite="Strict")
    
    return {"message": "Logged in successfully"}

@router.get("/signup", name="remanga:signup")
async def signin(request: Request, response: Response, current_user: Current_user):
    if current_user: return RedirectResponse(url="/", status_code=303)

    return templates.TemplateResponse("signup.html", {"request": request})

@router.post("/api/signup")
async def api_signup(user: schemas.UserSignup, db: Session = Depends(get_db)):
    db_user = utils.get_user(db, user.username)
    
    if db_user: exceptions.username_taken()

    if user.password != user.password2: exceptions.different_passwords()

    if utils.is_invalid_email(user.email): exceptions.invalid_email()

    utils.create_user(db, user)

    return user

# @router.get("/user/{user_id}", response_model=schemas.User)
@router.get("/user/", response_model=schemas.User)
async def read_user(current_user: Current_user):
    return current_user

@router.get("/test/")
async def test(request: Request, response: Response, db: Session = Depends(get_db)):
    return db.query(models.User).filter(models.User.username == "test").first()

@router.post("api/logout", name="remanga:logout")
async def logout(response: Response):
    response.delete_cookie("jwt_token")
    return response