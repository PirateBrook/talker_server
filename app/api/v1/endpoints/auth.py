from datetime import timedelta
from typing import Any, Optional
from fastapi import APIRouter, Depends, HTTPException, status, Body
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.ext.asyncio import AsyncSession
from google.oauth2 import id_token as google_id_token
from google.auth.transport import requests
from pydantic import BaseModel
import logging

from app.api import deps
from app.core import security
from app.core.config import settings
from app.schemas.token import Token
from app.schemas.user import UserCreate, UserRegister, User
from app.services.user_service import user_service

logger = logging.getLogger(__name__)

router = APIRouter()

@router.post("/login/access-token", response_model=Token)
async def login_access_token(
    db: AsyncSession = Depends(deps.get_db),
    form_data: OAuth2PasswordRequestForm = Depends(),
) -> Any:
    """
    OAuth2 compatible token login, get an access token for future requests
    """
    user = await user_service.authenticate(
        db, email=form_data.username, password=form_data.password
    )
    if not user:
        raise HTTPException(status_code=400, detail="Incorrect email or password")
    elif not user.is_active:
        raise HTTPException(status_code=400, detail="Inactive user")
    access_token_expires = timedelta(minutes=security.ACCESS_TOKEN_EXPIRE_MINUTES)
    return {
        "access_token": security.create_access_token(
            {"sub": str(user.id)}, expires_delta=access_token_expires
        ),
        "token_type": "bearer",
    }

@router.post("/login/anonymous", response_model=Token)
async def login_anonymous(
    db: AsyncSession = Depends(deps.get_db),
) -> Any:
    """
    Login anonymously
    """
    user = await user_service.create_anonymous_user(db)
    access_token_expires = timedelta(minutes=security.ACCESS_TOKEN_EXPIRE_MINUTES)
    return {
        "access_token": security.create_access_token(
            {"sub": str(user.id)}, expires_delta=access_token_expires
        ),
        "token_type": "bearer",
    }


class GoogleLoginRequest(BaseModel):
    id_token: str
    access_token: Optional[str] = None

@router.post("/login/google", response_model=Token)
async def login_google(
    request_body: GoogleLoginRequest,
    db: AsyncSession = Depends(deps.get_db),
) -> Any:
    """
    Login with Google ID Token
    """
    try:
        # Verify the token
        # If settings.GOOGLE_CLIENT_ID is None, verify_oauth2_token will not check audience
        # which might not be what we want, but it shouldn't cause ValueError unless token is bad.
        id_info = google_id_token.verify_oauth2_token(
            request_body.id_token, requests.Request(), settings.GOOGLE_CLIENT_ID
        )
    except ValueError as e:
        logger.error(f"Google Token Verification Failed: {str(e)}")
        # Be careful logging full tokens in production, but helpful for debug
        logger.debug(f"Provided Token: {request_body.id_token}") 
        logger.error(f"Expected Client ID: {settings.GOOGLE_CLIENT_ID}")
        raise HTTPException(status_code=400, detail=f"Invalid Google token: {str(e)}")

    email = id_info.get("email")
    google_id = id_info.get("sub")
    name = id_info.get("name")
    
    if not email:
         raise HTTPException(status_code=400, detail="Email not found in Google token")

    user = await user_service.create_google_user(db, email, google_id, name)
    
    if not user.is_active:
        raise HTTPException(status_code=400, detail="Inactive user")

    access_token_expires = timedelta(minutes=security.ACCESS_TOKEN_EXPIRE_MINUTES)
    return {
        "access_token": security.create_access_token(
            {"sub": str(user.id)}, expires_delta=access_token_expires
        ),
        "token_type": "bearer",
    }

@router.post("/register", response_model=User)
async def register_user(
    *,
    db: AsyncSession = Depends(deps.get_db),
    user_in: UserRegister,
) -> Any:
    """
    Create new user without the need to be logged in
    """
    user = await user_service.get_by_email(db, email=user_in.email)
    if user:
        raise HTTPException(
            status_code=400,
            detail="The user with this username already exists in the system",
        )
    user_create = UserCreate(
        email=user_in.email,
        password=user_in.password,
        full_name=user_in.full_name
    )
    user = await user_service.create(db, user_create)
    return user
