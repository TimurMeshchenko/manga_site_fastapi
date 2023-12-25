from fastapi import APIRouter, Request, Depends
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from fastapi.encoders import jsonable_encoder

from title.models import Title
from title.schemas import Title_base
from database import get_db

from auth.dependencies import get_current_user
from auth.schemas import User

router = APIRouter(tags=["search"])

templates = Jinja2Templates(directory="../templates")

@router.get("/search", name="remanga:search")
async def search(
    request: Request, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)):
    full_titles = db.query(Title).all()
    titles =  [Title_base(**full_title.__dict__) for full_title in full_titles]

    context = { 
        "request": request,
        "user": current_user,
        "titles":  jsonable_encoder(titles)
    }

    return templates.TemplateResponse("search.html", context)