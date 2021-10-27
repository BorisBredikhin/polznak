import hashlib

from django.contrib.auth.models import User
from fastapi import APIRouter, FastAPI

from token_auth.models import Token
from token_auth.schemas import LoginSchema

app = APIRouter()

@app.post('/login/')
def login(data: LoginSchema):
    user = User.objects.get(username=data.username, password = hashlib.sha1(data.password.encode("utf-8")).hexdigest())

    if user is not None:
        token = Token.objects.get(profile=user.pk)
        # token.save()
        return {'token': token.key, 'message': 'ok'}
    else:
        return {'message': 'wrong username or password'}
