from fastapi import APIRouter, Request, Depends, WebSocket, WebSocketDisconnect
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from typing import Annotated


from . import models, utils
from database import engine
from config import get_db
from auth.schemas import User
from auth.dependencies import get_current_user
from auth.utils import set_context_and_cookie_csrf_token
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
    context = {}

    context["request"] = request
    context['title'] = title
    context['comments'] = title.comments
    context['title_comments_ratings'] = []
    context["user"] = ""

    if not current_user:
        return set_context_and_cookie_csrf_token(templates, context, "title.html")

    context["user"] = current_user
    context['title_rating'] = utils.get_title_rating(current_user, title.id) 
    context['title_comments_ratings'] = utils.get_title_comments_ratings(current_user, title.id)
    context['is_bookmark_added'] = title in current_user.titles
    
    return set_context_and_cookie_csrf_token(templates, context, "title.html")

@router.websocket("/ws/{session_id}")
async def websocket_endpoint(websocket: WebSocket, session_id: str, db: Session = Depends(get_db)):
    await websocket.accept()
    connections[session_id] = websocket

    websockets_csrf_token = "123"
    websocket.cookies["websockets_csrf_token"] = websockets_csrf_token

    await websocket.send_json({"websockets_csrf_token": websockets_csrf_token})

    try:
        while True:
            data = await websocket.receive_json()
            is_valid_websocket_csrf = await utils.is_valid_websocket_csrf(websocket, data)

            if not is_valid_websocket_csrf: return

            user = db.query(User_model).filter(User_model.id == data["user_id"]).first()
            title = db.query(models.Title).filter(models.Title.id == data["title_id"]).first()
            is_bookmark_added = title in user.titles

            if is_bookmark_added: 
                user.titles.remove(title)
                title.count_bookmarks -= 1
            else: 
                user.titles.append(title)
                title.count_bookmarks += 1

            db.commit()

            response = {
                "title_rus_name": title.rus_name,
                "title_dir_name": title.dir_name,
                "title_img_url": title.img_url,
                "is_bookmark_added": not is_bookmark_added,
            }

            # await utils.broadcast(connections, response)
            await utils.one_user_broadcast(connections, response, user.id)
    except WebSocketDisconnect:
        del connections[session_id]