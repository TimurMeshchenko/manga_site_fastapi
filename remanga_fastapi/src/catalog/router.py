from fastapi import APIRouter, Request, Depends
from fastapi.templating import Jinja2Templates
from sqlalchemy import desc
from sqlalchemy.orm import Session
from typing import Annotated

from . import utils, models, titles_filters
from database import engine
from title.models import Title
from config import get_db
from auth.schemas import User
from auth.dependencies import get_current_user

models.Base.metadata.create_all(bind=engine)

router = APIRouter(tags=["catalog"])

templates = Jinja2Templates(directory="../templates")

titles = None

@router.get("/", name="remanga:catalog")
async def catalog(request: Request, current_user: Annotated[User, Depends(get_current_user)], 
                  db: Session = Depends(get_db)):
    global titles

    if not titles: 
        titles = db.query(Title).order_by(desc(Title.count_rating))

    filtered_titles = titles
    page = request.query_params.get("page")

    titles_filters_object = titles_filters.Titles_filters(db)    
    filters = titles_filters_object.create_filters(request)    

    if not filters is None: filtered_titles = titles.filter(filters)

    if (page): return utils.get_next_page_data(filtered_titles, request, templates, page)
      
    context = utils.get_context(filtered_titles, current_user, db)
    context["request"] = request

    return templates.TemplateResponse("catalog.html", context)
