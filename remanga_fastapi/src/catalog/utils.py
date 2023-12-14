from sqlalchemy.orm import Session

from . import models
from title.models import *

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