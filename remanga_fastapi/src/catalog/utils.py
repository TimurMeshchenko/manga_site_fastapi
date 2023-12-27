from sqlalchemy.orm import Session, Query
from fastapi.encoders import jsonable_encoder
from fastapi import Request
from fastapi.templating import Jinja2Templates
from sqlalchemy import desc
from typing import Dict, Any, Union

from title.models import *
from auth.schemas import User
from .titles_filters import Titles_filters
from config import Config

page_size = 30
redis = Config.redis

def get_set_title_tables_redis(db: Session) -> Union[dict, Dict[str, Any]]:    
    if redis.exists('titles'):
        title_tables = get_title_tables_redis()
    else:
        title_tables = get_title_tables(db)
        title_tables['titles'] = get_titles(db).all()

        set_title_tables_redis(title_tables)
    
    return title_tables

def get_title_tables(db: Session) -> Dict[str, Any]:
    """
    Get data from related tables with title for filtering
    """
    title_tables = {
        'manga_types': db.query(Title.manga_type).distinct().all(), 
        'genres': db.query(Genres).all(), 
        'categories': db.query(Categories).all(),
    }    

    return title_tables

def get_title_tables_redis() -> dict:
    """
    Get data from related tables with title in redis lists from hashes and convert to dictionaries
    """
    title_tables = create_empty_title_tables_redis()

    for title_table_name in title_tables:
        title_table_rows = redis.lrange(title_table_name, 0, -1)
        title_table_data = list()

        if title_table_name == 'manga_types': 
            title_tables[title_table_name] = get_manga_types(title_table_name)
            continue

        for title_table_row in title_table_rows:
            title_table_row_dict = get_title_table_row_dict(title_table_row)
                            
            title_table_data.append(title_table_row_dict)    

        title_tables[title_table_name] = title_table_data
    
    return title_tables

def create_empty_title_tables_redis() -> dict:
    title_tables = {
        'manga_types': list(),
        'genres': list(),
        'categories': list(),        
        'titles': list(),        
    } 

    return title_tables

def get_manga_types(title_table_name: str) -> list:
    """
    Get manga types in redis list and convert to list
    """    
    manga_types_undecoded = redis.lrange(title_table_name, 0, -1)
    manga_types = list()

    for manga_type in manga_types_undecoded:
        manga_types.append(manga_type.decode())
    
    return manga_types

def get_title_table_row_dict(title_table_row: str) -> dict:
    title_table_row_hash = redis.hgetall(title_table_row)
    title_table_row_dict = dict()

    for column_name in title_table_row_hash:
        title_table_row_dict[column_name.decode()] = title_table_row_hash[column_name].decode()
    
    return title_table_row_dict

def set_title_tables_redis(title_tables: dict) -> None:
    """
    Convert data from related tables with title into a dictionary and 
    save it in a redis lists from hashes    
    """    
    for title_table_name in title_tables: 
        title_table = title_tables[title_table_name]

        if title_table_name == 'manga_types': 
            set_manga_types(title_tables, title_table_name)
            continue

        for title_table_row in title_table:
            title_table_row_dict = title_table_row.__dict__
            hashes_name =  f"{title_table_name}:{title_table_row.id}"

            remove_model_key = next(iter(title_table_row_dict)) 
            title_table_row_dict.pop(remove_model_key)  

            redis.hset(hashes_name, mapping=title_table_row_dict)
            redis.rpush(title_table_name, hashes_name)
            set_title_cache_expire(hashes_name)

        set_title_cache_expire(title_table_name)

def set_manga_types(title_tables: dict, title_table_name: str) -> None:
    for manga_type in title_tables[title_table_name]: 
        redis.rpush(title_table_name, manga_type[0])
    
    set_title_cache_expire(title_table_name)

def set_title_cache_expire(title_table_name: str) -> None:    
    redis.expire(title_table_name, 120)

def get_titles(db: Session) -> Query[Title]:
    return db.query(Title).order_by(desc(Title.count_rating))

def get_filtered_titles(title_tables: Any, titles: Any, request: Request) -> Any:
    if (request.query_params): 
        titles_filters_object = Titles_filters(title_tables)    
        filters = titles_filters_object.create_filters(request)    

        if not filters is None: titles = titles.filter(filters)

    return titles

def get_next_page_data(titles: Any, request: Request, templates: Jinja2Templates, page: str) -> str:
    start = int(page) * page_size
    end = start + page_size
    context = {
        'request': request,
        'titles_list': titles[start:end]
    }

    return templates.TemplateResponse('titles_template.html', context).body.decode()

def get_context(title_tables: dict, titles: Any, current_user: User) -> Dict[str, Any]:
    context = {
        "user": current_user,
        "titles_list": titles[:page_size],
    }
    
    is_titles_list = type(titles) == list
    context['pages_count'] = len(titles) // page_size if is_titles_list else len(titles.all()) // page_size

    database_tables_data = get_database_tables_data(title_tables)
    
    for database_table_data_key in database_tables_data:
        context[database_table_data_key] = jsonable_encoder(database_tables_data[database_table_data_key])

    return context

def get_database_tables_data(title_tables: dict) -> Dict[str, Any]:
    """
    Get data for filter buttons in template
    """    
    is_title_tables_dict = type(title_tables['genres'][0]) == dict

    if is_title_tables_dict:
        database_tables_data = {
            "types_data": [{"manga_type" : item} for item in title_tables['manga_types']],
            "categories_data": title_tables['categories'],
            "genres_data": title_tables['genres'],
        }
    else:
        database_tables_data = {
            "types_data": [{"manga_type" : item[0]} for item in title_tables['manga_types']],
            "categories_data": [item.__dict__ for item in title_tables['categories']],
            "genres_data": [item.__dict__ for item in title_tables['genres']],
        }

    return database_tables_data