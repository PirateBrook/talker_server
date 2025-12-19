from fastapi import APIRouter, Depends

router = APIRouter()

@router.get("/")
async def read_users():
    """
    Retrieve users (Placeholder)
    """
    return [{"username": "foo"}, {"username": "bar"}]
