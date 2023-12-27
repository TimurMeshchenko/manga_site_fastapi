
from jose import JWTError, jwt
from passlib.context import CryptContext
from datetime import datetime, timedelta
from fastapi import Depends, Request
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session
from fastapi.templating import Jinja2Templates
from jinja2 import Environment, FileSystemLoader
from typing import Optional

from re import match
from secrets import token_hex
from aiosmtplib import send
from json import dumps, loads
from email.message import EmailMessage
from aio_pika import Message

from . import models, exceptions
from .schemas import User, UserSignup
from config import Config, SMTP_USER, SMTP_PASSWORD

SECRET_KEY = "c8f1c5004b4cdf41e7db8c675025fea43ac8348deb6b25d8f841d3baff6a6280"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60 * 24 * 7 

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/signin") 

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)

def get_password_hash(password: str) -> str:
    return pwd_context.hash(password)

def get_user(db: Session, username: str) -> Optional[User]:
    if not username: exceptions.empty_username()
    
    return db.query(models.User).filter(models.User.username == username).first()

def get_user_by_email_token(db: Session, token: str) -> Optional[User]:
    email = get_token_data(token)

    if not email: exceptions.invalid_token()
    
    user = db.query(models.User).filter(models.User.email == email).first()

    if not user: exceptions.email_not_exists()    

    return user

def authenticate_user(db: Session, username: str, password: str) -> Optional[User]:
    user = get_user(db, username)
    
    if user and verify_password(password, user.password):
        return user

    exceptions.invalid_user_data()

def create_access_token(data: dict) -> str:
    to_encode = data.copy()
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    
    return encoded_jwt

def get_token_data(token: str = Depends(oauth2_scheme)) -> str:
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    except JWTError:
        return str()

    token_data: str = payload.get("sub")

    if token_data is None: return str()
    
    return token_data

def create_user(db: Session, user: UserSignup) -> User:
    hashed_password = get_password_hash(user.password)
    db_user = models.User(username=user.username, password=hashed_password, email=user.email, is_active=True) 
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    
    return db_user

def validate_registration_form(db: Session, user: UserSignup) -> None:
    db_user = get_user(db, user.username)

    if db_user: exceptions.username_taken()
    if is_invalid_username(user.username): exceptions.invalid_username()

    if is_invalid_email(user.email): exceptions.invalid_email()

    is_invalid_passwords( user.password, user.password2)

def is_invalid_passwords(password: str, password2: str) -> None:
    if password != password2: exceptions.different_passwords()

    if is_invalid_password(password): exceptions.invalid_password()

def is_invalid_email(email: str) -> bool:
    email_pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
    return match(email_pattern, email) is None

def is_invalid_username(username: str) -> bool:
    username_pattern = r'^[a-zA-Z0-9_]{3,20}$'
    return match(username_pattern, username) is None

def is_invalid_password(password: str) -> bool:
    password_pattern = r'^[a-zA-Z0-9_@$!%*?&-]{6,}$'
    return match(password_pattern, password) is None

def is_not_email_exists(db: Session, email: str) -> bool:
    return db.query(models.User).filter(models.User.email == email).first() is None

def set_context_and_cookie_csrf_token(templates: Jinja2Templates, context: dict, template_name: str):
    csrf_token = generate_csrf_token()

    context["csrf_token"] = csrf_token

    response = templates.TemplateResponse(template_name, context)
    response.set_cookie(key="csrf_token", value=csrf_token, httponly=True, samesite="Strict")    

    return response

def generate_csrf_token() -> str:
    return token_hex(32)

def is_valid_csrf(request: Request) -> bool:
    csrf_token_cookies = request.cookies.get("csrf_token")
    csrf_token_header = request.headers.get("X-CSRF-Token")

    if csrf_token_header != csrf_token_cookies:
        return False
    
    return True

async def send_reset_password_email_rabbitmq(email: str, password_reset_token: str) -> None:
    email_data_json = dumps({"email": email, "token": password_reset_token})

    await Config.channel.default_exchange.publish(Message(body=email_data_json.encode()), routing_key='email_queue')
    await rabbitmq_consume_email_data(Config.queue)

async def rabbitmq_consume_email_data(queue) -> None:
    async for message in queue:
        async with message.process():
            email_data = loads(message.body)
            await send_reset_password_email(email_data["email"], email_data["token"])
        break

async def send_reset_password_email(to_email: str, password_reset_token: str) -> None:
    server_host = "http://localhost:8000"
    password_reset_url = f"{server_host}/reset_password?token={password_reset_token}"

    env = Environment(loader=FileSystemLoader("../templates"))
    template = env.get_template('reset_password_letter.html')
    html_content = template.render(password_reset_url=password_reset_url)

    message = EmailMessage()
    message["From"] = SMTP_USER
    message["To"] = to_email
    message["Subject"] = "Manga password recovery"
    message.set_content(html_content, subtype='html')

    await send(message, hostname="smtp-mail.outlook.com", username=SMTP_USER, password=SMTP_PASSWORD, port=587, start_tls=True)