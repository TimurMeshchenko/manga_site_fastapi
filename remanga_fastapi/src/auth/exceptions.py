from fastapi import HTTPException, status

def invalid_user_data():
    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Incorrect username or password",
    )

def invalid_credentials():
    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
    )

def inactive_user():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail="Inactive user"
    )

def username_taken():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Username is taken'
    )

def different_passwords():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Password didn’t match'
    )

def invalid_email():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Invalid email'
    )

def empty_username():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Empty username'
    )   

def invalid_csrf_token():
    raise HTTPException(
        status_code=status.HTTP_403_FORBIDDEN, 
        detail="Invalid CSRF token. Reload page"
    )