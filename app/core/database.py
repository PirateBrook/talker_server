from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker, declarative_base
from motor.motor_asyncio import AsyncIOMotorClient
from redis.asyncio import Redis
from app.core.config import settings
from bson import UuidRepresentation

# SQLAlchemy (Postgres)
engine = create_async_engine(settings.SQLALCHEMY_DATABASE_URI, echo=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine, class_=AsyncSession)
Base = declarative_base()

async def get_db():
    async with SessionLocal() as session:
        yield session

# MongoDB
mongo_client = AsyncIOMotorClient(settings.MONGO_URI, uuidRepresentation='standard')
mongo_db = mongo_client[settings.MONGO_DB]

# Redis
redis_client = Redis.from_url(settings.REDIS_URL, decode_responses=True)
