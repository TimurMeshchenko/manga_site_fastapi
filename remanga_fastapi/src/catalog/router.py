from fastapi import APIRouter, Request, Depends
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from fastapi.encoders import jsonable_encoder

from . import utils, models, titles_filters
from database import engine
from title.models import Title
from config import get_db

models.Base.metadata.create_all(bind=engine)

router = APIRouter(tags=["catalog"])

templates = Jinja2Templates(directory="../templates")

@router.get("/", name="remanga:catalog")
async def catalog(request: Request, db: Session = Depends(get_db)):
    titles = db.query(Title)
    context = {}

    titles_filters_object = titles_filters.Titles_filters(db)    
    filters = titles_filters_object.create_filters(request)    

    if not filters is None: titles = titles.filter(filters)
        
    database_tables_data = utils.get_database_tables_data(db)
    
    for database_table_data_key in database_tables_data:
        context[database_table_data_key] = jsonable_encoder(database_tables_data[database_table_data_key])

    context["request"] = request
    context["titles_list"] = titles.all()

    return templates.TemplateResponse("catalog.html", context)

