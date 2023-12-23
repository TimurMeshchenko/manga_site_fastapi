
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
import aiosmtplib
import json
from email.message import EmailMessage
import aio_pika

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

def get_user_by_email_token(db: Session, token: str):
    email = get_token_data(token)

    if not email: exceptions.invalid_token()
    
    user = db.query(models.User).filter(models.User.email == email).first()

    if not user: exceptions.email_not_exists()    

    return user

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

    token_data: str = payload.get("sub")

    if token_data is None: return str()
    
    return token_data

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

    is_invalid_passwords( user.password, user.password2)

def is_invalid_passwords(password, password2):
    if password != password2: exceptions.different_passwords()

    if is_invalid_password(password): exceptions.invalid_password()

def is_invalid_email(email):
    email_pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
    return re.match(email_pattern, email) is None

def is_invalid_username(username):
    username_pattern = r'^[a-zA-Z0-9_]{3,20}$'
    return re.match(username_pattern, username) is None

def is_invalid_password(password):
    password_pattern = r'^[a-zA-Z0-9_@$!%*?&-]{6,}$'
    return re.match(password_pattern, password) is None

def is_not_email_exists(db: Session, email: str):
    return db.query(models.User).filter(models.User.email == email).first() is None

def set_context_and_cookie_csrf_token(templates: Jinja2Templates, context: dict, template_name: str):
    csrf_token = generate_csrf_token()

    context["csrf_token"] = csrf_token

    response = templates.TemplateResponse(template_name, context)
    response.set_cookie(key="csrf_token", value=csrf_token, httponly=True, samesite="Strict")    

    return response

def generate_csrf_token():
    return secrets.token_hex(32)

def validate_csrf(request: Request):
    csrf_token_cookies = request.cookies.get("csrf_token")
    csrf_token_header = request.headers.get("X-CSRF-Token")

    if csrf_token_header != csrf_token_cookies:
        exceptions.invalid_csrf_token()

async def send_reset_password_email_rabbitmq(email: str, password_reset_token: str, channel, queue):
    email_data_json = json.dumps({"email": email, "token": password_reset_token})

    await channel.default_exchange.publish(aio_pika.Message(body=email_data_json.encode()), routing_key='email_queue')
    await rabbitmq_consume_email_data(queue) 

async def rabbitmq_consume_email_data(queue):
    async for message in queue:
        async with message.process():
            email_data = json.loads(message.body)
            await send_reset_password_email(email_data["email"], email_data["token"])
        break

async def send_reset_password_email(to_email: str, password_reset_token: str):
    from_email = 'fwafwafwawfawf21@outlook.com'
    SMTP_PASSWORD = "fGJsS(Q.PP#95r#"
    server_host = "http://localhost:8000"

    password_reset_url = f"{server_host}/reset_password?token={password_reset_token}"

    message = EmailMessage()
    message["From"] = from_email
    message["To"] = to_email
    message["Subject"] = "Manga password recovery"
    message.set_content(f"<a href='{password_reset_url}'>Click here to reset your password</a>", subtype='html')

    await aiosmtplib.send(message, hostname="smtp-mail.outlook.com", username=from_email, password=SMTP_PASSWORD, port=587, start_tls=True)