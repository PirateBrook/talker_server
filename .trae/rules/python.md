# Talker Server Project Guidelines

## Project Overview
Talker Server is a modern, full-stack AI chat application backend built with FastAPI and Python 3.13+. It powers an immersive "Otome" style chat experience with AI characters, supporting real-time WebSocket communication, RAG (Retrieval-Augmented Generation), and complex social interactions.

## Tech Stack
- **Backend Framework**: FastAPI (Async)
- **Database (Relational)**: PostgreSQL + AsyncPG + SQLAlchemy (Async ORM)
- **Database (NoSQL)**: MongoDB + Motor (Chat logs & unstructured data)
- **Vector Store**: pgvector (PostgreSQL extension) for RAG
- **Cache/Queue**: Redis + Celery
- **AI/LLM**: LangChain + OpenAI/OpenRouter
- **Package Manager**: uv (preferred)
- **Client SDK**: Dart (Flutter) with Retrofit & Dio

## Architecture Patterns
- **Layered Architecture**:
  - `app/api`: Routes and Controllers (Endpoints)
  - `app/services`: Business Logic (Service Layer)
  - `app/models`: Database Models (SQLAlchemy)
  - `app/schemas`: Pydantic Models (Data Transfer Objects)
  - `app/core`: Configuration & Infrastructure
- **Dependency Injection**: Heavy usage of FastAPI's `Depends` for DB sessions and services.
- **Async First**: All I/O operations (DB, AI, Network) MUST be asynchronous (`async/await`).

## Coding Standards (Python)
- **Type Hinting**: Mandatory for all function signatures. Use `typing` module or built-in types.
- **Pydantic V2**: Use `pydantic-settings` for config and `BaseModel` for schemas.
- **SQLAlchemy 2.0**: Use strict 2.0 style (select statements, async sessions).
- **Error Handling**: Use `HTTPException` with proper status codes in API layers. Service layers should return values or raise specific exceptions caught by API.
- **Testing**: `pytest` with `pytest-asyncio`. Use `conftest.py` for fixtures.

## Key Features & Implementations
- **Authentication**: OAuth2 with Password Flow (JWT).
- **Real-time Chat**: WebSocket endpoint (`/chat/ws`) handling connection lifecycle and message streaming.
- **RAG**: Character memory system using vector embeddings stored in Postgres.
- **Social Graph**: Friends, Follows, and Chat Sessions management.

## Development Workflow
1.  **Environment**: Copy `.env.example` to `.env`.
2.  **Infrastructure**: Run `docker-compose -f docker-compose.dev.yml up -d` for DBs.
3.  **Run Server**: `uv run uvicorn app.main:app --reload`
4.  **Database Migrations**: Use `alembic` for schema changes (currently using auto-create in dev).

## Important Files
- `app/main.py`: Entry point.
- `app/core/config.py`: Settings management.
- `app/api/v1/router.py`: Main router registration.
- `client/lib/src/api_service.dart`: Client-side API definition.

## AI & LLM Specifics
- Use `langchain_openai` for model interaction.
- `OPENAI_API_BASE_URL` is configured for OpenRouter compatibility.
- Ensure `openai_api_key` and `openai_api_base` are passed explicitly to `ChatOpenAI` constructors to avoid config issues.

## Common Pitfalls
- **Router Conflicts**: Ensure `prefix` in `include_router` does not conflict (e.g., separating `/chat` and `/sessions`).
- **Trailing Slashes**: Be mindful of trailing slashes in API definitions vs client requests.
- **Async Context**: Don't block the event loop; run CPU-bound tasks in thread pools if necessary.
- **Hardcoded Strings**: Avoid using hardcoded strings for event types, status codes, or other enumerable values. Define and use Python `Enum` classes instead (e.g., `RecommendationEventType`).
