from sqlalchemy.orm import Session, Query
from fastapi.encoders import jsonable_encoder
from fastapi import Request
from fastapi.templating import Jinja2Templates

from title.models import *
from auth.schemas import User

page_size = 30

def get_context(filtered_titles: Query[Title], current_user: User, db: Session):
    context = {
        "user": current_user,
        "titles_list": filtered_titles[:page_size],
        "pages_count": len(filtered_titles.all()) // 30,
    }

    database_tables_data = get_database_tables_data(db)
    
    for database_table_data_key in database_tables_data:
        context[database_table_data_key] = jsonable_encoder(database_tables_data[database_table_data_key])

    return context


def get_database_tables_data(db: Session):
    types_data = db.query(Title.manga_type).distinct().all()
    categories_data = db.query(Categories).all()
    genres_data = db.query(Genres).all()

    database_tables_data = {
        "types_data": [{"manga_type" : item[0]} for item in types_data],
        "categories_data": [item.__dict__ for item in categories_data],
        "genres_data": [item.__dict__ for item in genres_data],
    }

    return database_tables_data

def get_next_page_data(filtered_titles: Query[Title], request: Request, templates: Jinja2Templates, page: str):
    start = int(page) * page_size
    end = start + page_size
    context = {
        'request': request,
        'titles_list': filtered_titles[start:end]
    }

    return templates.TemplateResponse('titles_template.html', context).body.decode()