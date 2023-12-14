from pydantic import BaseModel

class Categories(BaseModel):
    id: int
    name: str

class Genres(BaseModel):
    id: int
    name: str
    
class Chapters(BaseModel):
    id: int
    chapter: int
    tome: int

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
    chapters: list[Chapters]
    # comments: list[Comment] = []
    
    class Config:
        from_attributes = True