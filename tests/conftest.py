import asyncio
from typing import AsyncGenerator, Generator
import os
import re
import sqlalchemy
import pytest
from httpx import AsyncClient, ASGITransport
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import sessionmaker

from app.main import app
from app.core.config import settings
from app.core.database import Base, get_db

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

    # Create tables
    async with engine.begin() as conn:
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
