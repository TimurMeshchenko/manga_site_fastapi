from fastapi import APIRouter, Depends, Request, Response, UploadFile, HTTPException, status
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from typing import Dict

from database import get_db
from auth.schemas import User as schemas_User, UserChangePassword 
from auth.dependencies import get_current_user
from auth.utils import set_context_and_cookie_csrf_token, verify_password, get_password_hash, is_invalid_passwords
from auth.models import User as models_User

router = APIRouter(tags=["profile"])

templates = Jinja2Templates(directory="../templates")

@router.get("/user/{user_id}", name="remanga:profile")
async def profile(user_id: int, request: Request, 
                  current_user: schemas_User = Depends(get_current_user), 
                  db: Session = Depends(get_db)):
    context = {"request": request}
    context["profile"] = db.query(models_User).filter(models_User.id == user_id).first()
    context["user"] = current_user

    response = set_context_and_cookie_csrf_token(templates, context, "profile.html")

    return response

@router.get("/api/logout", name="remanga:logout")
def delete_cookie(response: Response):
    response.delete_cookie("jwt_token")
    response.headers["Location"] = "/"
    response.status_code = 302
    return response

@router.put("/api/change_avatar")
async def change_avatar(
    avatar: UploadFile,
    current_user: schemas_User = Depends(get_current_user),
    db: Session = Depends(get_db)
) -> Dict[str, str]:    
    if avatar.content_type not in ["image/jpeg", "image/png", "image/gif"]:
        raise HTTPException(status_code=400, detail="Invalid file type")

    file_name = f"{current_user.id}.jpg"
    file_path = f"media/users_avatars/{file_name}" 

    with open(file_path, "wb") as f:
        f.write(await avatar.read())
    
    current_user.avatar = file_name

    db.commit()

    return {"message": "Successfuly uploaded"}

@router.put("/api/change_password")
async def change_password(
    passwords: UserChangePassword,
    current_user: schemas_User = Depends(get_current_user),
    db: Session = Depends(get_db)
) -> Dict[str, str]:
    if (not verify_password(passwords.old_password, current_user.password)):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail='Old password is incorrect'
        )
    
    is_invalid_passwords(passwords.new_password, passwords.new_password2)

    current_user.password = get_password_hash(passwords.new_password)

    db.commit()

    return {"message": "Password successfuly changed"}