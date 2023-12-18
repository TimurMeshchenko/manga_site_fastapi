from fastapi import APIRouter, Request, Depends
from fastapi.templating import Jinja2Templates
from typing import Annotated

from auth.schemas import User
from auth.dependencies import get_current_user

router = APIRouter(tags=["bookmarks"])

templates = Jinja2Templates(directory="../templates")

@router.get("/bookmarks", name="remanga:bookmarks")
async def bookmarks(
    request: Request, 
    current_user: Annotated[User, Depends(get_current_user)],
    ):
    context = { 
        "request": request,
        "user": current_user,
        "titles": current_user.titles 
    }

    return templates.TemplateResponse("bookmarks.html", context)