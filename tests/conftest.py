import asyncio
from typing import AsyncGenerator, Generator
from contextlib import asynccontextmanager
import os
import re
import sqlalchemy
import pytest
from httpx import AsyncClient, ASGITransport
from fastapi import FastAPI
from fastapi.testclient import TestClient
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import sessionmaker
import uuid

from app.main import app
from app.core.config import settings
from app.core.database import Base, get_db
from app.core.security import create_access_token, get_password_hash
from app.models.user import User
from app.models.character import Character
from app.schemas.character import CharacterCreate

# Calculate SQLALCHEMY_DATABASE_URL
SQLALCHEMY_DATABASE_URL = settings.SQLALCHEMY_DATABASE_URI
if "@db:" in SQLALCHEMY_DATABASE_URL:
     SQLALCHEMY_DATABASE_URL = SQLALCHEMY_DATABASE_URL.replace("@db:", "@localhost:")
if "postgres:password@db:5432" in SQLALCHEMY_DATABASE_URL:
    SQLALCHEMY_DATABASE_URL = SQLALCHEMY_DATABASE_URL.replace("@db:", "@localhost:")
if "POSTGRES_SERVER" not in os.environ and "db" in SQLALCHEMY_DATABASE_URL:
    SQLALCHEMY_DATABASE_URL = re.sub(r'@db:', '@localhost:', SQLALCHEMY_DATABASE_URL)
if "localhost" in SQLALCHEMY_DATABASE_URL and "/talker" in SQLALCHEMY_DATABASE_URL:
     SQLALCHEMY_DATABASE_URL = SQLALCHEMY_DATABASE_URL.replace("/talker", "/postgres")

@pytest.fixture(scope="function")
async def db_engine():
    # Create engine inside the fixture (session scope)
    engine = create_async_engine(SQLALCHEMY_DATABASE_URL)
    
    # Enable vector extension if not exists
    async with engine.begin() as conn:
        await conn.execute(sqlalchemy.text("CREATE EXTENSION IF NOT EXISTS vector"))

    # Create tables (drop first to ensure clean state)
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)
        await conn.run_sync(Base.metadata.create_all)
        
    yield engine
    
    await engine.dispose()

@pytest.fixture(scope="function")
async def db(db_engine) -> AsyncGenerator[AsyncSession, None]:
    connection = await db_engine.connect()
    transaction = await connection.begin()
    
    # Create session factory bound to this connection
    session_maker = sessionmaker(autocommit=False, autoflush=False, bind=connection, class_=AsyncSession)
    session = session_maker()
    
    yield session
    
    await session.close()
    await transaction.rollback()
    await connection.close()

@pytest.fixture(scope="function")
async def client(db) -> AsyncGenerator[AsyncClient, None]:
    async def override_get_db():
        yield db

    app.dependency_overrides[get_db] = override_get_db
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as c:
        yield c
    app.dependency_overrides.clear()

@pytest.fixture(scope="function")
def sync_client(db):
    # Note: Using TestClient with async DB session from a different loop might cause issues.
    # This is primarily for WebSocket tests where we might mock the DB interaction.
    # If DB access is needed, we need to ensure loop compatibility or mock it.
    
    # We still override it to prevent it from creating a new engine/session that points to prod DB
    # But since it's sync, we can't yield the async session easily.
    # For now, we rely on mocks in tests using this.

    # Override lifespan to avoid DB operations using the global engine which causes loop conflicts
    # The db_engine fixture already handles table creation
    from app.main import app
    original_lifespan = app.router.lifespan_context

    @asynccontextmanager
    async def mock_lifespan(app: FastAPI):
        yield

    app.router.lifespan_context = mock_lifespan

    with TestClient(app) as c:
        yield c
    
    # Restore lifespan
    app.router.lifespan_context = original_lifespan

# --- Helpers ---

async def create_test_character(db: AsyncSession) -> Character:
    char_in = Character(
        name="Test Char",
        description="A test character",
        is_active=True
    )
    db.add(char_in)
    await db.commit()
    await db.refresh(char_in)
    return char_in

@pytest.fixture(scope="function")
async def normal_user_token_headers(db: AsyncSession) -> dict:
    email = f"test_{uuid.uuid4()}@example.com"
    password = "testpassword"
    user = User(
        email=email,
        hashed_password=get_password_hash(password),
        is_active=True,
        is_superuser=False,
    )
    db.add(user)
    await db.commit()
    await db.refresh(user)
    
    access_token = create_access_token(
        data={"sub": str(user.id)}
    )
    return {"Authorization": f"Bearer {access_token}"}
