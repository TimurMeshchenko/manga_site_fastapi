from pydantic import BaseModel, ConfigDict
from datetime import datetime
from typing import Optional

from title.schemas import Title

class User(BaseModel):
    model_config: ConfigDict = ConfigDict(from_attributes=True)

    id: int
    password: str
    last_login: datetime
    is_superuser: bool
    username: str
    first_name: Optional[str] = None
    last_name: Optional[str] = None
    email: Optional[str] = None
    is_staff: bool
    is_active: bool
    date_joined: datetime
    avatar: str

    bookmarks: list[Title] = []

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