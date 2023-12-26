from fastapi import APIRouter, Request, Depends, WebSocket, WebSocketDisconnect
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from typing import Any, Dict

from . import models, utils
from database import get_db
from auth.schemas import User
from auth.dependencies import get_current_user
from auth.utils import set_context_and_cookie_csrf_token

router = APIRouter(tags=["title"])

templates = Jinja2Templates(directory="../templates")

utils.register_filters(templates)

connections = dict()

handlers_websockets = {
    "bookmark": utils.handler_websockets_bookmark,
    "comment": utils.handler_websockets_comment
}

@router.get("/manga/{dir_name}", name="remanga:title")
async def title(
    dir_name: str, 
    request: Request, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    title = db.query(models.Title).filter(models.Title.dir_name == dir_name).first()
    context = {
        'request': request,
        'title': title,
        'user_title_comments_ratings': [],
        'user': ''
    }

    if not current_user:
        return set_context_and_cookie_csrf_token(templates, context, "title.html")

    title_rating = utils.get_title_rating(db, current_user.id, title.id)

    context["user"] = current_user
    context['title_rating'] = title_rating.rating if title_rating else title_rating
    context['user_title_comments_ratings'] = utils.get_user_title_comments_ratings_dict(db, current_user.id, title.id)
    context['is_bookmark_added'] = title in current_user.bookmarks
    
    return set_context_and_cookie_csrf_token(templates, context, "title.html")

@router.post("/api/title_rating")
async def title_rating(
    fetch_data: dict, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
) -> Dict[str, Any]:
    response = utils.change_rating(current_user, db, fetch_data)

    return response

@router.post("/api/comment_rating")
async def comment_rating(
    fetch_data: dict, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
) -> Dict[str, Any]:    
    response = utils.rating_comment(current_user, db, fetch_data)

    return response

@router.websocket("/ws/{session_id}")
async def websocket_endpoint(websocket: WebSocket, session_id: str, db: Session = Depends(get_db)) -> None:
    await websocket.accept()
    connections[session_id] = websocket

    await utils.set_and_send_websockets_csrf_token(websocket)

    try:
        while True:
            data = await websocket.receive_json()

            is_valid_websocket_csrf = await utils.is_valid_websocket_csrf(websocket, data)

            if not is_valid_websocket_csrf: return

            websocket_type = data["type"]

            if websocket_type in handlers_websockets:
                await handlers_websockets[websocket_type](db, connections, data)
    except WebSocketDisconnect:
        del connections[session_id]