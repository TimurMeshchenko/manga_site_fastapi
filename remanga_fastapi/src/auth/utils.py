
from jose import JWTError, jwt
from passlib.context import CryptContext
from datetime import datetime, timedelta
from typing import Annotated
from fastapi import Depends, Request
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session
from fastapi.templating import Jinja2Templates

import re
import secrets

from . import models, schemas, exceptions

SECRET_KEY = "c8f1c5004b4cdf41e7db8c675025fea43ac8348deb6b25d8f841d3baff6a6280"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60 * 24 * 7 

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/signin") 

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def verify_password(plain_password: str, hashed_password: str):
    return pwd_context.verify(plain_password, hashed_password)

def get_password_hash(password: str):
    return pwd_context.hash(password)

def get_user(db: Session, username: str):
    if not username: exceptions.empty_username()
    
    return db.query(models.User).filter(models.User.username == username).first()

def authenticate_user(db: Session, username: str, password: str):
    user = get_user(db, username)
    
    if user and verify_password(password, user.password):
        return user

    exceptions.invalid_user_data()

def create_access_token(data: dict):
    to_encode = data.copy()
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    
    return encoded_jwt

def get_token_data(token: Annotated[str, Depends(oauth2_scheme)]):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    except JWTError:
        return str()

    username: str = payload.get("sub")

    if username is None:
        return str()
    
    return schemas.TokenData(username=username)

def create_user(db: Session, user: schemas.UserSignup):
    hashed_password = get_password_hash(user.password)
    db_user = models.User(username=user.username, password=hashed_password, email=user.email, is_active=True) 
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    
    return db_user

def validate_registration_form(db: Session, user: schemas.UserSignup):
    db_user = get_user(db, user.username)

    if db_user: exceptions.username_taken()
    if is_invalid_username(user.username): exceptions.invalid_username()

    if is_invalid_email(user.email): exceptions.invalid_email()

    if is_invalid_password(user.password): exceptions.invalid_password()
    if user.password != user.password2: exceptions.different_passwords()

def is_invalid_email(email):
    email_pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
    return re.match(email_pattern, email) is None

def is_invalid_username(username):
    username_pattern = r'^[a-zA-Z0-9_]{3,20}$'
    return re.match(username_pattern, username) is None

def is_invalid_password(password):
    password_pattern = r'^[a-zA-Z0-9_@$!%*?&-]{6,}$'
    return re.match(password_pattern, password) is None

def set_context_and_cookie_csrf_token(templates: Jinja2Templates, context: dict, template_name: str):
    csrf_token = secrets.token_hex(32)

    context["csrf_token"] = csrf_token

    response = templates.TemplateResponse(template_name, context)
    response.set_cookie(key="csrf_token", value=csrf_token, httponly=True, samesite="Strict")    

    return response

def validate_csrf(request: Request):
    csrf_token_cookies = request.cookies.get("csrf_token")
    csrf_token_header = request.headers.get("X-CSRF-Token")

    if csrf_token_header != csrf_token_cookies:
        exceptions.invalid_csrf_token()

