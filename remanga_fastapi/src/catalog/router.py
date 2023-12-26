from fastapi import APIRouter, Request, Depends
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session

from . import utils
from database import get_db
from auth.schemas import User
from auth.dependencies import get_current_user
from config import Config

router = APIRouter(tags=["catalog"])

templates = Jinja2Templates(directory="../templates")

@router.get("/", name="remanga:catalog")
async def catalog(
    request: Request, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):        
    if Config.use_redis and not request.query_params:
        title_tables = utils.get_set_title_tables_redis(db)
        titles = title_tables.pop('titles') 
    else:
        title_tables = utils.get_title_tables(db)
        titles = utils.get_titles(db)

    page = request.query_params.get("page")
    titles = utils.get_filtered_titles(title_tables, titles, request)

    if (page): return utils.get_next_page_data(titles, request, templates, page)
      
    context = utils.get_context(title_tables, titles, current_user)
    context["request"] = request

    return templates.TemplateResponse("catalog.html", context)