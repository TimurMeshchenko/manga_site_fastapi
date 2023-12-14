from fastapi import APIRouter, Request, Depends
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session

from . import models
from database import engine
from config import get_db

models.Base.metadata.create_all(bind=engine)

router = APIRouter(tags=["title"])

templates = Jinja2Templates(directory="../templates")

@router.get("/manga/{dir_name}", name="remanga:title")
async def title(dir_name: str, request: Request, db: Session = Depends(get_db)):
    title = db.query(models.Title).filter(models.Title.dir_name == dir_name).first()
    context = {}
            
    context["request"] = request
    context['title'] = title

    return templates.TemplateResponse("title.html", context)