from datetime import datetime, timezone
from fastapi import WebSocket

def timesince(value):
    now = datetime.now(timezone.utc)
    diff = now - value
    days = diff.days
    hours, remainder = divmod(diff.seconds, 3600)
    minutes, seconds = divmod(remainder, 60)

    if days > 0:
        return f"{days} days ago"
    elif hours > 0:
        return f"{hours} hours ago"
    elif minutes > 0:
        return f"{minutes} minutes ago"
    
def register_filters(templates):
    templates.env.filters['timesince'] = timesince

def get_title_rating(current_user, title_id):
    for rating in current_user.ratings:
        if rating.title_id == title_id:
            return rating.rating
        
    return None

def get_title_comments_ratings(current_user, title_id):
    for title_comments_ratings in current_user.titles_comments_ratings:
        if title_comments_ratings.title_id == title_id:
            return title_comments_ratings
        
    return None

async def is_valid_websocket_csrf(websocket: WebSocket, data):
    received_websockets_csrf_token = data['websockets_csrf_token']
    stored_websockets_csrf_token = websocket.cookies['websockets_csrf_token']

    if received_websockets_csrf_token != stored_websockets_csrf_token:
        await websocket.close()
        return False 
    
    return True   

async def broadcast(connections: dict, response: dict):
    for session_id in connections:
        await connections[session_id].send_json(response) 

async def one_user_broadcast(connections: dict, response: dict, user_id: int):
    for session_id in connections:
        if session_id.split("-")[0] == str(user_id):
            await connections[session_id].send_json(response) 

