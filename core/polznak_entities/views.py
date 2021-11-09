from django.contrib.auth.models import User
from django.db import IntegrityError
from drf_yasg.openapi import Schema
from drf_yasg.utils import swagger_auto_schema
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.status import HTTP_201_CREATED, HTTP_400_BAD_REQUEST
from rest_framework.views import APIView

from polznak_entities.models import Profile
from polznak_entities.serializers import PostSerializer, RegisterSerializer


class PostView(APIView):
    @swagger_auto_schema(
        request_body=PostSerializer,
        operation_summary="Создание нового поста от имени текущего пользователя",
    )
    def post(self, request):
        data = PostSerializer(data=request.data)
        if not data.is_valid():
            return Response(data.errors, HTTP_400_BAD_REQUEST)
        profile = Profile.objects.get(user=request.user)
        data.save(creator=profile)
        return Response(data.data, HTTP_201_CREATED)


class RegisterView(APIView):
    @swagger_auto_schema(
        request_body=RegisterSerializer,
        operation_summary='Регистрация нового пользователя',
        responses={
            201: Schema(type='string'),
            400: Schema('Ошибка регистрации', type='string')
        }
    )
    def post(self, request):
        data = RegisterSerializer(data=request.data)

        if not data.is_valid():
            return Response(data.errors, HTTP_400_BAD_REQUEST)

        try:
            user = User.objects.create_user(data.validated_data['username'],
                                            data.validated_data['email'],
                                            data.validated_data['password'])
            user.save()

            profile = Profile.objects.get(user=user)
            profile.gender = data.validated_data['gender']
            profile.birth_date = data.validated_data['birth_date']

            profile.save()

            return Response(Token.objects.get(user=user).key, status=HTTP_201_CREATED)
        except IntegrityError:
            return Response("Пользователь с такими данными уже зарегистрирован")
