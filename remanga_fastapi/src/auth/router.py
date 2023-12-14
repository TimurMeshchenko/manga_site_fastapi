from fastapi import APIRouter, Depends
from fastapi.templating import Jinja2Templates

from typing import Annotated
from fastapi.security import OAuth2PasswordRequestForm

from . import utils, models, schemas, dependencies
from database import engine

models.Base.metadata.create_all(bind=engine)

router = APIRouter(tags=["auth"])

templates = Jinja2Templates(directory="../templates")

@router.post("/token", response_model=schemas.Token)
async def login_for_access_token(form_data: Annotated[OAuth2PasswordRequestForm, Depends()]):
    user = utils.authenticate_user(models.fake_users_db, form_data.username, form_data.password)
    
    access_token = utils.create_access_token(data={"sub": user.username})

    return {"access_token": access_token, "token_type": "bearer"}

# @router.get("/user/{user_id}", response_model=schemas.User)
@router.get("/user/", response_model=schemas.User)
async def read_user(current_user: Annotated[schemas.User, Depends(dependencies.get_current_user)]):
    return current_user