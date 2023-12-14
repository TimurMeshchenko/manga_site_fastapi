from fastapi import FastAPI, Query, Request
from pydantic import BaseModel
from typing import Annotated
from datetime import datetime
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder

class Comment(BaseModel):
    author: int
    content: str
    created_at: datetime 
    likes: int = 0

    def time_ago(self) -> str:
        now = datetime.now()
        time_diff = now - self.created_at

        if time_diff.days > 0:
            return f"{time_diff.days} days ago"
        elif time_diff.seconds >= 3600:
            hours = time_diff.seconds // 3600
            return f"{hours} hours ago"
        elif time_diff.seconds >= 60:
            minutes = time_diff.seconds // 60
            return f"{minutes} minutes ago"
        else:
            return "Just now"

class Title(BaseModel):
    rus_name: str
    dir_name: str
    img_url: str
    manga_type: str
    description: str
    avg_rating: float = 0.0
    count_rating: int = 0
    count_bookmarks: int = 0
    issue_year: int
    count_chapters: int
    # categories = list[Categories]
    # genres = list[Genres]
    # chapters = list[Chapters]
    comments: list[Comment] | None = None

app = FastAPI()

@app.get("/")
# async def catalog(types: str | None = None):
    # return {"message": types}
async def catalog(types: Request):
    return dict(types.query_params)

@app.get("/user/{user_id}")
async def profile(user_id):
    return {"user_id": user_id}

@app.post("/comment/", response_model=None)
async def create_comment(comment: Comment):
    json_compatible_data = jsonable_encoder(comment)

    return JSONResponse(content={"empty_comment_html": json_compatible_data})

async def common_parameters(title: Title):
    return {"title": Title}

# @app.put("/title/{dir_name}", response_model=Title)
# async def update_title_count_bookmarks(title: Annotated[dict, Depends(common_parameters)]):

@app.put("/title/{dir_name}", response_model=Title)
async def update_title_count_bookmarks(title: Title, count_bookmarks: str):
    title.count_bookmarks = int(count_bookmarks) + 1

    return title

# @app.post("/upload_avatar/")
# async def create_upload_avatar(file: UploadFile):
#     return {"filename": file.filename}