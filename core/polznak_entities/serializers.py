from rest_framework.relations import PrimaryKeyRelatedField
from rest_framework import serializers
from typing import TypedDict

from polznak_entities.models import Post, Profile


class PostSerializer(serializers.ModelSerializer):
    creator = PrimaryKeyRelatedField(
        queryset=Profile.objects.all(),
        required=False,
        help_text="Создатель поста. устанавлвается автоматически"
    )

    class Meta:
        model = Post
        fields = '__all__'


class RegisterSerializer(serializers.Serializer):
    first_name = serializers.CharField(help_text="Имя")
    last_name = serializers.CharField(help_text="Фамилия")
    username = serializers.CharField(help_text="Имя пользователя")
    birth_date = serializers.DateField(help_text="Дата рождения")
    gender = serializers.ChoiceField([x[0] for x in Profile.GENDER_CHOICES])
    email = serializers.EmailField()
    password = serializers.CharField(help_text="Пароль")


class LikeRequestSerializer(serializers.Serializer):
    class LikeRequestSerializerTypedDict(TypedDict):
        post_id: int
        grade: int

    validated_data: LikeRequestSerializerTypedDict

    post_id = serializers.PrimaryKeyRelatedField(
        queryset=Post.objects.all(),
        help_text="Идентификатор поста, которому ставится оценка"
    )
    grade = serializers.IntegerField(help_text="Оценка") # todo: add validator


class LikeResponseSerializer(serializers.Serializer):
    pass
