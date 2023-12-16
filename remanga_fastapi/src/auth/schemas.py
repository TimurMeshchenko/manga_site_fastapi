from datetime import datetime
from pydantic import BaseModel

class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    username: str | None = None

class User(BaseModel):
    id: int
    password: str
    last_login: datetime
    is_superuser: bool
    username: str
    first_name: str | None = None
    last_name: str | None = None
    email: str | None = None
    is_staff: bool
    is_active: bool
    date_joined: datetime
    avatar: str

class UserSignup(BaseModel):
    username: str
    email: str
    password: str
    password2: str

class UserSignin(BaseModel):
    username: str
    password: str

