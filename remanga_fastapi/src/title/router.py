from fastapi import APIRouter, Request, Depends, WebSocket, WebSocketDisconnect
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from typing import Annotated


from . import models, utils
from database import engine
from config import get_db
from auth.schemas import User
from auth.dependencies import get_current_user
from auth.utils import set_context_and_cookie_csrf_token, validate_csrf
from auth.models import User as User_model

models.Base.metadata.create_all(bind=engine)

router = APIRouter(tags=["title"])

templates = Jinja2Templates(directory="../templates")

utils.register_filters(templates)

connections = {}

@router.get("/manga/{dir_name}", name="remanga:title")
async def title(
    dir_name: str, 
    request: Request, 
    current_user: Annotated[User, Depends(get_current_user)],
    db: Session = Depends(get_db)
):
    title = db.query(models.Title).filter(models.Title.dir_name == dir_name).first()
    context = {
        'request': request,
        'title': title,
        'title_comments_ratings': [],
        'user': ''
    }

    if not current_user:
        return set_context_and_cookie_csrf_token(templates, context, "title.html")

    title_rating = utils.get_title_rating(db, current_user.id, title.id)

    context["user"] = current_user
    context['title_rating'] = title_rating.rating if title_rating else title_rating
    context['title_comments_ratings'] = utils.get_title_comments_ratings(current_user, title.id)
    context['is_bookmark_added'] = title in current_user.bookmarks
    
    return set_context_and_cookie_csrf_token(templates, context, "title.html")

@router.post("/api/title_rating")
async def title_rating(
    request: Request, 
    fetch_data: dict, 
    current_user: Annotated[User, Depends(get_current_user)],
    db: Session = Depends(get_db)
):
    validate_csrf(request)

    response = utils.change_rating(current_user, db, fetch_data)

    return response

@router.websocket("/ws/{session_id}")
async def websocket_endpoint(websocket: WebSocket, session_id: str, db: Session = Depends(get_db)):
    await websocket.accept()
    connections[session_id] = websocket

    await utils.set_and_send_websockets_csrf_token(websocket)

    try:
        while True:
            data = await websocket.receive_json()

            is_valid_websocket_csrf = await utils.is_valid_websocket_csrf(websocket, data)

            if not is_valid_websocket_csrf: return

            user = db.query(User_model).filter(User_model.id == data["user_id"]).first()
            title = db.query(models.Title).filter(models.Title.id == data["title_id"]).first()
            
            # словарь type: функция()

            if (data["type"] == "bookmark"):
                # handler_websockets_bookmark

                is_bookmark_added = title in user.bookmarks
                
                await utils.change_bookmark(user, title, is_bookmark_added)
        
                db.commit()

                response = {
                    "type": data["type"],
                    "title_rus_name": title.rus_name,
                    "title_dir_name": title.dir_name,
                    "title_img_url": title.img_url,
                    "is_bookmark_added": not is_bookmark_added,
                }

                await utils.one_user_broadcast(connections, response, user.id)
            else:
                # handler_websockets_comment
                
                # add_comment

                max_comment_length = 500
                comment_content = data["content"][:max_comment_length]
                comment_object = models.Comment(author_id=user.id, title_id=title.id, 
                                                content=comment_content)

                db.add(comment_object)
                db.commit()
                
                # 

                response = {
                    "type": data["type"],
                    "content": comment_content,
                    "user_id": user.id,
                    "user_name": user.username,
                    "user_avatar": user.avatar,
                    "comment_id": comment_object.id
                }                

                await utils.title_broadcast(connections, response, title.id)
    except WebSocketDisconnect:
        del connections[session_id]