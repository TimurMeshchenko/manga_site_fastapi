from title.models import *

class Titles_filters:
    def __init__(self, db) -> None:
        self.db = db

        manga_types_query = db.query(Title.manga_type).distinct().all()
        self.manga_types = [manga_type[0] for manga_type in manga_types_query]

        self.init_filters_variables(db)
        self.filters = None

    def init_filters_variables(self, db):
        self.query_keys_adapted_for_table = {
            "_gte": "",
            "_lte": "",
            "exclude_": "",
        }

        self.title_table_columns = {
            'types': Title.manga_type,
            'genres': Title.genres,
            'categories': Title.categories,
            'issue_year': Title.issue_year,
            'rating': Title.avg_rating,
            'count_chapters': Title.count_chapters,
        }

        self.database_tables = {
            'genres': db.query(Genres).all(),
            'categories': db.query(Categories).all(),
        }

    def create_filters(self, request):
        for query_key in list(request.query_params.keys()): 
            query_values = request.query_params.getlist(query_key)
            
            if (''.join(query_values) == str() or query_key == 'next_page'): continue
            
            self.create_query_key_filters(query_key, query_values)        
            
            if self.filters is None:
                self.filters = self.query_key_filters
            else:
                self.filters &= self.query_key_filters

        return self.filters

    def create_query_key_filters(self, query_key, query_values):
        query_key_adapted = self.get_query_key_adapted(query_key)
        self.query_key_filters = None 
        
        for query_value_str in query_values:
            query_value = float(query_value_str) if '.' in query_value_str else int(query_value_str)

            is_added_range_filter = self.add_range_filters(query_key, query_key_adapted, query_value)
            
            if is_added_range_filter: return

            self.add_filter(query_key, query_key_adapted, query_value)
    
    def get_query_key_adapted(self, query_key):
        for query_key_for_adapte in self.query_keys_adapted_for_table:
            if query_key_for_adapte in query_key:
                return query_key.replace(query_key_for_adapte, "")
        
        return query_key

    def add_range_filters(self, query_key, query_key_adapted, query_value):        
        query_filter = None

        if "lte" in query_key:
            query_filter = self.title_table_columns[query_key_adapted] <= query_value
        elif "gte" in query_key:
            query_filter = self.title_table_columns[query_key_adapted] >= query_value
        else:
            return False
        
        self.add_filter_to_query_key_filters(query_filter, query_key)        
        
        return True

    def add_filter_to_query_key_filters(self, query_filter, query_key):
        if self.query_key_filters is None:
            self.query_key_filters = query_filter
        else:
            if "exclude" in query_key:
                self.query_key_filters &= query_filter 
            else:
                self.query_key_filters |= query_filter 

    def add_filter(self, query_key, query_key_adapted, query_value):        
        title_table_column = self.title_table_columns[query_key_adapted]

        if query_key_adapted == "types": 
            query_filter = title_table_column == self.manga_types[query_value]      
        else:
            query_value_id = self.database_tables[query_key_adapted][query_value].id
            query_filter = title_table_column.any(id = query_value_id)

        if "exclude" in query_key:
            query_filter = ~query_filter

        self.add_filter_to_query_key_filters(query_filter, query_key)
