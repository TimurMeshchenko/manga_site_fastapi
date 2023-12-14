from typing import Annotated
from fastapi import Depends
from jose import JWTError, jwt
from fastapi.security import OAuth2PasswordBearer

from . import utils, exceptions, models, schemas

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token") 

async def get_current_user(token: Annotated[str, Depends(oauth2_scheme)]):    
    try:
        payload = jwt.decode(token, utils.SECRET_KEY, algorithms=[utils.ALGORITHM])
        username: str = payload.get("sub")

        if username is None:
            exceptions.invalid_credentials()
        
        token_data = schemas.TokenData(username=username)
    except JWTError:
        exceptions.invalid_credentials()
    
    user = utils.get_user(models.fake_users_db, username=token_data.username)
    
    if user is None:
        exceptions.invalid_credentials()
    
    if user.disabled:
        exceptions.inactive_user()
    
    return user