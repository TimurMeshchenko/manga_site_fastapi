from pydantic import BaseModel
from datetime import datetime

from title.schemas import Comment, Title

class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    username: str | None = None

class Rating(BaseModel):
    id: int
    title_id: int 
    rating: int = 0

class Title_comments_ratings(BaseModel):
    id: int
    title_id: int
    comments_likes: list[Comment] = []
    comments_dislikes: list[Comment] = []

    class Config:
        from_attributes = True

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
    titles: list[Title] = []
    ratings: list[Rating] = []
    titles_comments_ratings: list[Title_comments_ratings] = []

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