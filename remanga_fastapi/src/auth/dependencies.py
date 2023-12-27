from fastapi import Depends, Request
from sqlalchemy.orm import Session
from typing import Optional

from . import utils
from database import get_db
from .schemas import User

async def get_current_user(request: Request, db: Session = Depends(get_db)) -> Optional[User]:        
    token = request.cookies.get("jwt_token")
    
    if not token: return 
    
    token_data = utils.get_token_data(token)

    if not token_data: return

    user = utils.get_user(db, token_data)
    
    if user is None: return
        
    return user