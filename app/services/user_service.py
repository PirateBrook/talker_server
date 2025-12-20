from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from app.models.user import User
from app.schemas.user import UserCreate
from app.core.security import get_password_hash, verify_password
from typing import Optional

class UserService:
    async def get_by_email(self, db: AsyncSession, email: str) -> Optional[User]:
        result = await db.execute(select(User).filter(User.email == email))
        return result.scalars().first()

    async def get(self, db: AsyncSession, user_id: int) -> Optional[User]:
        result = await db.execute(select(User).filter(User.id == user_id))
        return result.scalars().first()

    async def create(self, db: AsyncSession, obj_in: UserCreate) -> User:
        db_obj = User(
            email=obj_in.email,
            hashed_password=get_password_hash(obj_in.password) if obj_in.password else None,
            full_name=obj_in.full_name,
            is_superuser=obj_in.is_superuser,
            is_active=obj_in.is_active,
            is_anonymous=obj_in.is_anonymous
        )
        db.add(db_obj)
        await db.commit()
        await db.refresh(db_obj)
        return db_obj

    async def authenticate(self, db: AsyncSession, email: str, password: str) -> Optional[User]:
        user = await self.get_by_email(db, email)
        if not user:
            return None
        if not user.hashed_password:
            return None
        if not verify_password(password, user.hashed_password):
            return None
        return user

    async def create_anonymous_user(self, db: AsyncSession) -> User:
        db_obj = User(
            email=None,
            hashed_password=None,
            is_active=True,
            is_anonymous=True,
            full_name="Anonymous User"
        )
        db.add(db_obj)
        await db.commit()
        await db.refresh(db_obj)
        return db_obj

    async def get_by_google_id(self, db: AsyncSession, google_id: str) -> Optional[User]:
        result = await db.execute(select(User).filter(User.google_id == google_id))
        return result.scalars().first()
    
    async def create_google_user(self, db: AsyncSession, email: str, google_id: str, full_name: str = None) -> User:
        # Check if user with email exists
        existing_user = await self.get_by_email(db, email)
        if existing_user:
            existing_user.google_id = google_id
            if full_name and not existing_user.full_name:
                existing_user.full_name = full_name
            db.add(existing_user)
            await db.commit()
            await db.refresh(existing_user)
            return existing_user
        
        db_obj = User(
            email=email,
            google_id=google_id,
            full_name=full_name,
            is_active=True,
            hashed_password=None
        )
        db.add(db_obj)
        await db.commit()
        await db.refresh(db_obj)
        return db_obj

user_service = UserService()
