from fastapi import APIRouter, Request, Depends, WebSocket, WebSocketDisconnect
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session, sessionmaker
from typing import Annotated

from . import models, utils
from database import engine
from config import get_db
from auth.schemas import User
from auth.dependencies import get_current_user

models.Base.metadata.create_all(bind=engine)
Session = sessionmaker(bind=engine)
session = Session()

router = APIRouter(tags=["title"])

templates = Jinja2Templates(directory="../templates")

utils.register_filters(templates)

connections = {}

@router.get("/manga/{dir_name}", name="remanga:title")
async def title(dir_name: str, request: Request, 
                current_user: Annotated[User, Depends(get_current_user)], 
                db: Session = Depends(get_db)):
    title = db.query(models.Title).filter(models.Title.dir_name == dir_name).first()
    context = {}

    context["request"] = request
    context['title'] = title
    context['comments'] = title.comments
    context['title_comments_ratings'] = []

    if not current_user:
        return templates.TemplateResponse("title.html", context)

    title_rating = utils.get_title_rating(current_user, title.id)
    title_comments_ratings = utils.get_title_comments_ratings(current_user, title.id)

    context["user"] = current_user
    context['title_rating'] = title_rating 
    context['title_comments_ratings'] = title_comments_ratings
    
    return templates.TemplateResponse("title.html", context)

@router.websocket("/ws/{user_id}")
async def websocket_endpoint(websocket: WebSocket, user_id: str):
    await websocket.accept()
    connections[user_id] = websocket

    try:
        while True:
            data = await websocket.receive_json()
            await websocket.send_json({data})
            await utils.broadcast({data})
    except WebSocketDisconnect:
        del connections[user_id]