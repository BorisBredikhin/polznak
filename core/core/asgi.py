"""
ASGI config for backend project.
It exposes the ASGI callable as a module-level variable named ``application``.
For more information on this file, see
https://docs.djangoproject.com/en/3.1/howto/deployment/asgi/
"""

import os

from django.core.asgi import get_asgi_application
from fastapi import FastAPI

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings')

application = get_asgi_application()

###############################################################################

from django.contrib.auth.middleware import AuthenticationMiddleware
from polznak_entities import routers

app = FastAPI(
    title="Barter",
    description="Backend application for Barter project",
    version="0.0.0"
)

# from token_auth.middleware import TokenMiddleware

# app.middleware("http")(TokenMiddleware)

app.include_router(routers.router, prefix="/api")
app.mount('/', application)
