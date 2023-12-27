from httpx import AsyncClient
from sqlalchemy.orm import Session
from sqlalchemy import text

from src.catalog.utils import *
from src.config import Config
from src.database import engine

full_title_tables = dict()
config = Config()

config.check_redis_connection()

use_redis = config.use_redis

def test_create_test_database_data(db: Session) -> None:
    tables_names = {
        'remanga_genres': 'name',
        'remanga_categories': 'name',
    }

    db.execute(text("""INSERT INTO remanga_title (rus_name, dir_name, img_url, manga_type, avg_rating,
                    count_rating, issue_year, count_bookmarks, count_chapters, description)
                    VALUES ('a', 'b', 'b', 'b', 0, 0, 0, 0, 0, 'b')"""))    
    
    for table_name in tables_names:
        db.execute(text(f"INSERT INTO {table_name} ({tables_names[table_name]}) VALUES ('a'), ('b')"))

    db.commit()

async def test_query_params_exceptions(ac: AsyncClient) -> None:
    if is_database_empty(): return
    
    query_params_exceptions = [
        'types=', 'random_query_key=0', 'types=random_query_value',
        'types=0.0', 'issue_year_gte=0.0.0', 'types_gte=0',
        'issue_year_exclude=0', 'types=999999999'
    ]
    
    for query_param in query_params_exceptions:
        response = await ac.get(f"/?{query_param}")

        assert response.status_code == 200

def is_database_empty() -> bool:
    with engine.connect() as connection:
        query = text("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public'")
        result = connection.execute(query).scalar()
        return result == 0

def test_set_title_tables_redis(db: Session) -> None:
    if not use_redis: return
    title_tables = get_title_tables(db)
    title_tables['titles'] = get_titles(db).all()

    set_title_tables_redis(title_tables) 
    title_tables_redis = get_title_tables_redis()

    for title_table_name in title_tables_redis:
        assert len(title_tables_redis[title_table_name]) > 0

    redis.flushdb()

def test_get_list_title_tables_redis() -> None:
    if not use_redis: return
    manga_type_value = 'a'
    redis.rpush('manga_types', manga_type_value)

    title_tables_redis = get_title_tables_redis()

    assert title_tables_redis['manga_types'][0] == manga_type_value

    redis.flushdb()

def test_get_hashes_title_tables_redis() -> None:
    if not use_redis: return
    genres_value = {'id': 1, 'name': 'a'}
    redis.hset('genres:1', mapping=genres_value)
    redis.rpush('genres', 'genres:1')

    title_tables_redis = get_title_tables_redis()

    assert title_tables_redis['genres'][0]['name'] == genres_value['name']

    redis.flushdb()

def test_create_manga_types_filters(db: Session) -> None:
    titles_filters = create_titles_filters(db)
    query_values = ['0', '1']

    expected_query_filters = get_manga_types_query_filters(titles_filters, 'types', query_values)

    assert str(titles_filters.query_key_filters) == expected_query_filters

def create_titles_filters(db: Session):
    global full_title_tables
    
    if full_title_tables == dict(): 
        manga_types_test_data = ['a', 'b']

        full_title_tables = get_title_tables(db)
        full_title_tables['manga_types'] = manga_types_test_data

    titles_filters = Titles_filters(full_title_tables)

    return titles_filters

def get_manga_types_query_filters(titles_filters: Titles_filters, query_key: str,
                                query_values: list[str]) -> str:
    titles_filters.create_query_key_filters(query_key, query_values)

    title_table_column = titles_filters.title_table_columns[query_key]
    query_filter = None

    for query_value in query_values:
        sql_condition = title_table_column == titles_filters.manga_types[int(query_value)]
        query_filter = combine_query_filters(query_filter, sql_condition, query_key)

    return str(query_filter)

def combine_query_filters(query_filter: Any, sql_condition: Any, query_key: str) -> Any:
    if query_filter is None: 
        query_filter = sql_condition
    else:
        if "exclude" in query_key:
            query_filter &= sql_condition 
        else:
            query_filter |= sql_condition 

    return query_filter

def test_create_greater_range_filters(db: Session) -> None:
    titles_filters = create_titles_filters(db)
    query_value = ['0']

    expected_query_filter = get_range_filter(titles_filters, 'issue_year_gte', query_value)

    assert str(titles_filters.query_key_filters) == expected_query_filter

def get_range_filter(titles_filters: Titles_filters, query_key: str,
                    query_values: list[str]) -> str:
    titles_filters.create_query_key_filters(query_key, query_values)
    
    query_value = int(query_values[0])
    query_key_adapted = titles_filters.get_query_key_adapted(query_key)
        
    if "gte" in query_key: 
        query_filter = titles_filters.title_table_columns_ranges[query_key_adapted] >= query_value
    else:
        query_filter = titles_filters.title_table_columns_ranges[query_key_adapted] <= query_value

    return str(query_filter)

def test_create_less_range_filters(db: Session) -> None:
    titles_filters = create_titles_filters(db)
    query_value = ['0']

    expected_query_filter = get_range_filter(titles_filters, 'issue_year_lte', query_value)

    assert str(titles_filters.query_key_filters) == expected_query_filter

def test_create_other_filters(db: Session) -> None:
    """
    Drop menu filters except manga types
    """    
    titles_filters = create_titles_filters(db)
    query_values = ['0', '1']

    expected_query_filters = get_other_query_filters(titles_filters, 'genres', query_values)

    assert str(titles_filters.query_key_filters) == expected_query_filters

def get_other_query_filters(titles_filters: Titles_filters, query_key: str, 
                           query_values: list[str]) -> str:
    titles_filters.create_query_key_filters(query_key, query_values)

    title_table_column = titles_filters.title_table_columns[query_key]
    query_filter = None 

    for query_value in query_values:
        query_value_id = full_title_tables[query_key][int(query_value)].id
        sql_condition = title_table_column.any(id = query_value_id)
        
        query_filter = combine_query_filters(query_filter, sql_condition, query_key)

    return str(query_filter)

def test_create_filter_manga_types_exclude(db: Session) -> None:
    titles_filters = create_titles_filters(db)
    query_values = ['0', '1']

    expected_query_filters = get_manga_type_exclude_query_filters(titles_filters, 'exclude_types', query_values)

    assert str(titles_filters.query_key_filters) == expected_query_filters

def get_manga_type_exclude_query_filters(titles_filters: Titles_filters, query_key: str, 
                           query_values: list[str]) -> str:
    titles_filters.create_query_key_filters(query_key, query_values)

    query_key_adapted = titles_filters.get_query_key_adapted(query_key)

    title_table_column = titles_filters.title_table_columns[query_key_adapted]
    query_filter = None 

    for query_value in query_values:
        sql_condition = title_table_column == titles_filters.manga_types[int(query_value)]
        sql_condition_reversed = ~sql_condition

        query_filter = combine_query_filters(query_filter, sql_condition_reversed, query_key)

    return str(query_filter) 

