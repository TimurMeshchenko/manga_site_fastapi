from pydantic import BaseModel, ConfigDict
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
    model_config: ConfigDict = ConfigDict(from_attributes=True)
    
    id: int
    author_id: int
    content: str
    created_at: datetime
    likes: int = 0
       

class Title_base(BaseModel):
    id: int
    rus_name: str
    dir_name: str
    img_url: str
    manga_type: str
    avg_rating: float = 0.0

class Title(Title_base):
    model_config: ConfigDict = ConfigDict(from_attributes=True)

    issue_year: int
    count_chapters: int
    count_rating: int = 0
    count_bookmarks: int = 0
    description: str
    
    categories: list[Categories]
    genres: list[Genres]
    chapters: list[Title_chapters]
    comments: list[Comment] = []
    
class Title_rating(BaseModel):
    id: int
    user_id: int
    title_id: int
    rating: int

class Comment_rating(BaseModel):
    id: int
    user_id: int 
    title_id: int 
    comment_id: int 
    is_liked: bool