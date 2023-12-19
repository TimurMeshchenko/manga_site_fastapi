from pydantic import BaseModel
from datetime import datetime

class Categories(BaseModel):
    id: int
    name: str

class Genres(BaseModel):
    id: int
    name: str
    
class Title_chapters(BaseModel):
    id: int
    title_id: int
    chapter: int
    tome: int

class Comment(BaseModel):
    id: int
    author_id: int
    content: str
    created_at: datetime
    likes: int = 0

    class Config:
        from_attributes = True

class Title(BaseModel):
    id: int
    rus_name: str
    dir_name: str
    img_url: str
    manga_type: str
    avg_rating: float = 0.0
    count_rating: int = 0
    issue_year: int
    count_bookmarks: int = 0
    count_chapters: int
    description: str
    
    categories: list[Categories]
    genres: list[Genres]
    chapters: list[Title_chapters]
    comments: list[Comment] = []
    
    class Config:
        from_attributes = True

class Title_rating(BaseModel):
    id: int
    user_id: int
    title_id: int
    rating: int