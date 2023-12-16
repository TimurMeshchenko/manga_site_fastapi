from fastapi import APIRouter, Depends, Request, Response
from fastapi.templating import Jinja2Templates
from typing import Annotated
from sqlalchemy.orm import Session

from config import get_db
from auth.schemas import User as schemas_User 
from auth.dependencies import get_current_user
from auth.utils import set_context_and_cookie_csrf_token, validate_csrf
from auth.models import User as models_User

router = APIRouter(tags=["profile"])

templates = Jinja2Templates(directory="../templates")

@router.get("/user/{user_id}", name="remanga:profile")
async def profile(user_id: int, request: Request, 
                  current_user: Annotated[schemas_User, Depends(get_current_user)], 
                  db: Session = Depends(get_db)):
    context = {"request": request}
    context["profile"] = db.query(models_User).filter(models_User.id == user_id).first()
    context["user"] = current_user

    response = set_context_and_cookie_csrf_token(context, "profile.html")

    return response

@router.get("/api/logout", name="remanga:logout")
def delete_cookie(response: Response):
    response.delete_cookie("jwt_token")
    response.headers["Location"] = "/"
    response.status_code = 302
    return response