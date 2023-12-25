from fastapi import APIRouter, Request, Depends
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates

from auth.schemas import User
from auth.dependencies import get_current_user
from auth.router import router as auth_router

router = APIRouter(tags=["bookmarks"])

templates = Jinja2Templates(directory="../templates")

@router.get("/bookmarks", name="remanga:bookmarks")
async def bookmarks(
    request: Request, 
    current_user: User = Depends(get_current_user),
    ):
    signin_url = auth_router.url_path_for("remanga:signin")

    if not current_user: return RedirectResponse(signin_url, status_code=303)

    context = { 
        "request": request,
        "user": current_user,
        "bookmarks": current_user.bookmarks 
    }

    return templates.TemplateResponse("bookmarks.html", context)