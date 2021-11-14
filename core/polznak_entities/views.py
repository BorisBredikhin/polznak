from django.contrib.auth.models import User
from django.db import IntegrityError
from drf_yasg.openapi import Schema, Parameter
from drf_yasg.utils import swagger_auto_schema
from rest_framework.authtoken.models import Token
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_201_CREATED, HTTP_400_BAD_REQUEST
from rest_framework.views import APIView

from polznak_entities.models import Profile, Post, UserOpinion
from polznak_entities.serializers import PostSerializer, RegisterSerializer, LikeRequestSerializer, \
   UserOpinionSerializer


class PostView(APIView):
    @swagger_auto_schema(
        request_body=PostSerializer,
        operation_summary="Создание нового поста от имени текущего "
                          "пользователя",
    )
    def post(self, request):
        data = PostSerializer(data=request.data)
        if not data.is_valid():
            return Response(data.errors, HTTP_400_BAD_REQUEST)
        profile = Profile.objects.get(user=request.user)
        data.save(creator=profile)
        return Response(data.data, HTTP_201_CREATED)

    @swagger_auto_schema(
        operation_description="Список постов, рекомендованных для текущего "
                              "пользователя",
        responses={
            HTTP_200_OK: PostSerializer(many=True)
        },
        manual_parameters=[
            Parameter('skip', 'path', 'Количество уже полученных постов',
                      required=True, type='number'),
            Parameter('count', 'path', 'Количество постов для получения',
                      required=True, type='number'),
        ]
    )
    def get(self, request: Request):
        # todo: написать интеллектуальное ранжирование
        return Response(PostSerializer(
            Post.objects.all()
                .order_by('-created_at')[int(request.query_params['skip'])
                                         :int(request.query_params['skip'])
                                          + int(request.query_params['count'])],
            many=True
        ).data
                        )


class LikesView(APIView):
    @swagger_auto_schema(
        operation_description="Текущий пользователь ставит лайк/дизлайк посту "
                              "с ключом `post_id`",
        request_body=LikeRequestSerializer,
        responses={
            HTTP_200_OK: Schema(type='str')
        }
    )
    def post(self, request: Request):
        data = LikeRequestSerializer(data=request.data)
        if not data.is_valid():
            return Response(data.errors, HTTP_400_BAD_REQUEST)

        profile = Profile.objects.get(user=request.user)
        opinion = UserOpinion(post=data.validated_data["post_id"],                              sender=profile, opinion=data.validated_data['grade'])
        opinion.save()

        return Response(None, HTTP_200_OK)

    @swagger_auto_schema(
        operation_description="Получает информацию о лайках поста с ключом `post_id`",
        manual_parameters=[
        Parameter('post_id', 'path', 'Идентификатор поста',
                  required=True, type='number'),
    ],
        responses={
            HTTP_200_OK: UserOpinionSerializer(many=True)
        }
    )
    def get(self, request: Request):
        return Response(UserOpinionSerializer(
            UserOpinion.objects.filter(post_id=int(request.query_params['post_id'])),
            many=True,
        ).data)

class RegisterView(APIView):
    @swagger_auto_schema(
        request_body=RegisterSerializer,
        operation_summary='Регистрация нового пользователя',
        responses={
            HTTP_201_CREATED: Schema(type='string'),
            HTTP_400_BAD_REQUEST: Schema('Ошибка регистрации', type='string')
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
            user.first_name = data.validated_data['first_name']
            user.last_name = data.validated_data['last_name']
            user.save()

            profile = Profile.objects.get(user=user)
            profile.gender = data.validated_data['gender']
            profile.birth_date = data.validated_data['birth_date']

            profile.save()

            return Response(Token.objects.get(user=user).key, status=HTTP_201_CREATED)
        except IntegrityError:
            return Response("Пользователь с такими данными уже зарегистрирован")
