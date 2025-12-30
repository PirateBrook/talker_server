from contextlib import asynccontextmanager
from fastapi import FastAPI, Request, status
from fastapi.responses import JSONResponse
from fastapi.exceptions import RequestValidationError
from app.core.config import settings
from app.api.v1.router import api_router
from app.core.database import engine, Base
from app.core.middlewares import GZipRequestMiddleware, LoggingMiddleware
import logging

# Import models to ensure they are registered with Base
from app.models import user, vector_store, character, interaction

logger = logging.getLogger(__name__)

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Create tables on startup (For development only. Use Alembic for production)
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    yield

app = FastAPI(
    title=settings.PROJECT_NAME,
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
    lifespan=lifespan
)

# Register Middlewares
# Middleware order in FastAPI (Starlette) is FILO (First In Last Out) for request processing.
# If we want Request -> GZip -> Logging -> Endpoint:
# 1. LoggingMiddleware (added last) receives request FIRST.
# 2. GZipRequestMiddleware (added first) receives request SECOND.

# Wait, add_middleware wraps the previous app.
# app = LoggingMiddleware(GZipRequestMiddleware(app))
# Request -> LoggingMiddleware -> GZipRequestMiddleware -> Endpoint

# So if we want GZip to decode FIRST, it should be the outermost layer?
# No, we want:
# Request (Compressed) -> GZipMiddleware (Decompresses) -> LoggingMiddleware (Logs Decompressed) -> Endpoint

# If stack is: Logging(GZip(App))
# 1. Request hits Logging. Body is compressed. Logging fails to decode.
# 2. Logging passes to GZip.
# 3. GZip decompresses.
# 4. GZip passes to App.

# So we need stack: GZip(Logging(App))
# 1. Request hits GZip. Decompresses.
# 2. GZip passes to Logging. Body is decompressed. Logging logs it.
# 3. Logging passes to App.

# So GZip must be added LAST (to be outermost).
# Wait, add_middleware ADDS to the TOP of the stack.
# The LAST added middleware is the FIRST to execute.
# So if we want GZip -> Logging, we must add GZip LAST.
app.add_middleware(LoggingMiddleware)
app.add_middleware(GZipRequestMiddleware)

@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request: Request, exc: RequestValidationError):
    logger.error(f"Validation error for request {request.url}: {exc.errors()}")
    body = await request.body()
    logger.error(f"Request body: {body.decode('utf-8')}")
    return JSONResponse(
        status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
        content={"detail": exc.errors(), "body": body.decode('utf-8')},
    )

app.include_router(api_router, prefix=settings.API_V1_STR)

@app.get("/")
async def root():
    return {"message": "Hello World"}
