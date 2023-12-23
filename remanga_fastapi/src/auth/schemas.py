from pydantic import BaseModel
from datetime import datetime

from title.schemas import Title

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

    bookmarks: list[Title] = []

    class Config:
        from_attributes = True

class UserSignup(BaseModel):
    username: str
    email: str
    password: str
    password2: str

class UserSignin(BaseModel):
    username: str
    password: str

class UserChangePassword(BaseModel):
    old_password: str
    new_password: str
    new_password2: str