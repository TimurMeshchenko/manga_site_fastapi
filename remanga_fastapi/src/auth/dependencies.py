from fastapi import Depends, Request
from sqlalchemy.orm import Session

from . import utils
from config import get_db

async def get_current_user(request: Request, db: Session = Depends(get_db)):        
    token = request.cookies.get("jwt_token")
    
    if not token: return 
    
    token_data = utils.get_token_data(token)

    if not token_data: return

    user = utils.get_user(db, username=token_data.username)
    
    if user is None: return
        
    return user