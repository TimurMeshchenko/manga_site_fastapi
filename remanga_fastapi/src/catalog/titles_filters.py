from fastapi import Request
from typing import Any, List, Union, Optional

from title.models import *

class Titles_filters:
    def __init__(self, title_tables: dict):
        self.title_tables = title_tables
        self.manga_types = [manga_type[0] for manga_type in title_tables['manga_types']]

        self.init_filters_variables()
        self.filters = None

    def init_filters_variables(self) -> None:
        self.query_keys_adapted_for_table = {
            "_gte": "",
            "_lte": "",
            "exclude_": "",
        }

        self.title_table_columns = {
            'types': Title.manga_type,
            'genres': Title.genres,
            'categories': Title.categories,
        }
        
        self.title_table_columns_ranges = {
            'issue_year': Title.issue_year,
            'rating': Title.avg_rating,
            'count_chapters': Title.count_chapters,
        }

    def create_filters(self, request: Request) -> Optional[Any]:   
        """
        Iterate each query param and for different query params combine with a condition "and"
        """             
        for query_key in list(request.query_params.keys()): 
            query_values = request.query_params.getlist(query_key)
            query_param_exception = self.is_query_param_exception(query_key, query_values)

            if (query_param_exception): continue
            
            self.create_query_key_filters(query_key, query_values)        
            
            if self.filters is None:
                self.filters = self.query_key_filters
            else:
                self.filters &= self.query_key_filters

        return self.filters

    def is_query_param_exception(self, query_key: str, query_values: List[str]) -> bool:
        for query_value in query_values:
            query_values_empty = query_value == str()
           
            if query_values_empty: break

        query_key_adapted = self.get_query_key_adapted(query_key)

        query_key_exists = query_key_adapted in self.title_table_columns \
        or query_key_adapted in self.title_table_columns_ranges

        return query_values_empty or not query_key_exists

    def create_query_key_filters(self, query_key: str, query_values: List[str]) -> None:
        """
        Create filters for all values in query param
        """         
        query_key_adapted = self.get_query_key_adapted(query_key)
        self.query_key_filters = None 
        
        for query_value_str in query_values:
            valid_query_value = self.is_valid_query_value(query_value_str)

            if not valid_query_value: continue
            
            query_value = float(query_value_str) if '.' in query_value_str else int(query_value_str)

            if query_key_adapted in self.title_table_columns_ranges:
                self.add_range_filters(query_key, query_key_adapted, query_value)
            elif type(query_value) == int:
                self.add_filter(query_key, query_key_adapted, query_value)
    
    def is_valid_query_value(self, query_value_str: str) -> bool:
        have_point = False

        for char in query_value_str:
            if char == '.' and not have_point: 
                have_point = True
            elif not char.isdigit():
                return False
            
        return True

    def get_query_key_adapted(self, query_key: str) -> str:
        """
        Remove conditions in the query param name
        """   
        for query_key_for_adapte in self.query_keys_adapted_for_table:
            if query_key_for_adapte in query_key:
                return query_key.replace(query_key_for_adapte, "")
        
        return query_key

    def add_range_filters(self, query_key: str, query_key_adapted: str, query_value: Union[float, int]) -> None:        
        """
        Filters ranging from to
        """           
        query_filter = None

        if "lte" in query_key:
            query_filter = self.title_table_columns_ranges[query_key_adapted] <= query_value
        elif "gte" in query_key:
            query_filter = self.title_table_columns_ranges[query_key_adapted] >= query_value
        else:
            return
        
        self.add_filter_to_query_key_filters(query_filter, query_key)        
        
    def add_filter_to_query_key_filters(self, query_filter: Any, query_key: str) -> None:
        """
        For conditions with the same query param name combine with a condition "or"
        """          
        if self.query_key_filters is None:
            self.query_key_filters = query_filter
        else:
            if "exclude" in query_key:
                self.query_key_filters &= query_filter 
            else:
                self.query_key_filters |= query_filter 

    def add_filter(self, query_key: str, query_key_adapted: str, query_value: Union[float, int]) -> None:                
        """
        Other filters except ranging from to
        """         
        title_table_column = self.title_table_columns[query_key_adapted]

        if query_key_adapted == "types": 
            if query_value >= len(self.manga_types): return

            query_filter = title_table_column == self.manga_types[query_value]     
        else:
            if query_value >= len(self.title_tables[query_key_adapted]): return

            query_value_id = self.title_tables[query_key_adapted][query_value].id
            query_filter = title_table_column.any(id = query_value_id)

        if "exclude" in query_key:
            query_filter = ~query_filter

        self.add_filter_to_query_key_filters(query_filter, query_key)