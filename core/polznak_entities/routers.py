from fastapi import APIRouter
from token_auth.routers import app

router = APIRouter()

router.include_router(app, prefix="/auth")
