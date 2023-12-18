from fastapi import APIRouter, Depends, Request, Response
from fastapi.templating import Jinja2Templates
from fastapi.responses import RedirectResponse
from typing import Annotated
from sqlalchemy.orm import Session

from . import utils, models, schemas, dependencies
from database import engine
from config import get_db


models.Base.metadata.create_all(bind=engine)

router = APIRouter(tags=["auth"])

templates = Jinja2Templates(directory="../templates")

Current_user = Annotated[schemas.User, Depends(dependencies.get_current_user)]

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