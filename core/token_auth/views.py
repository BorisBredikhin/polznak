import json

from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.http import HttpRequest, JsonResponse

from token_auth.models import Token
from token_auth.schemas import LoginSchema


def login(request: HttpRequest) -> JsonResponse:
    data: LoginSchema = json.loads(request.body)

    try:
        user = authenticate(request, username=data['username'], password=data['password'])

        token = Token.objects.get(profile=user.pk)
        # token.save()
        return JsonResponse({'token': token.key, 'message': 'ok'})
    except User.DoesNotExist:
        return JsonResponse({'message': 'wrong username or password'})


def register(request: HttpRequest) -> JsonResponse:
    raise NotImplementedError
