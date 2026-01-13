import uuid
from typing import Optional
from pydantic import BaseModel, EmailStr

class UserBase(BaseModel):
    email: Optional[EmailStr] = None
    is_active: bool = True
    is_superuser: bool = False
    full_name: Optional[str] = None
    is_anonymous: bool = False
    persona: Optional[str] = None

class UserCreate(UserBase):
    password: Optional[str] = None

class UserRegister(BaseModel):
    email: EmailStr
    password: str
    full_name: Optional[str] = None
    persona: Optional[str] = None

class UserUpdate(BaseModel):
    password: Optional[str] = None
    email: Optional[EmailStr] = None
    full_name: Optional[str] = None
    is_active: Optional[bool] = None
    persona: Optional[str] = None

class UserInDBBase(UserBase):
    id: uuid.UUID

    class Config:
        from_attributes = True

class User(UserInDBBase):
    pass

class UserInDB(UserInDBBase):
    hashed_password: Optional[str] = None
