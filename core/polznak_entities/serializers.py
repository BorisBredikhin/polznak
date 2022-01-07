from django.contrib.auth.models import User
from rest_framework.relations import PrimaryKeyRelatedField
from rest_framework import serializers
from typing import TypedDict

from polznak_entities.models import Post, Profile, UserOpinion, Message, Conversation


class PostSerializer(serializers.ModelSerializer):
    creator = PrimaryKeyRelatedField(
            queryset=Profile.objects.all(),
            required=False,
            help_text="Создатель поста. устанавлвается автоматически"
    )

    class Meta:
        model = Post
        fields = '__all__'


class UserOpinionSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserOpinion
        fields = '__all__'


class ConversationSerializer(serializers.Serializer):
    class Meta:
        model = Conversation
        fields = '__all__'


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = '__all__'
        # depth=2


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
    grade = serializers.IntegerField(help_text="Оценка", min_value=-1, max_value=1)


class SendMessageRequestSerializer(serializers.Serializer):
    class SendMessageRequestSerializerTypedDict(TypedDict):
        text: str

    validated_data: SendMessageRequestSerializerTypedDict

    text = serializers.CharField()


class LikeListRequestSerializer(serializers.Serializer):
    class LikeRequestSerializerTypedDict(TypedDict):
        post_id: int

    validated_data: LikeRequestSerializerTypedDict

    post_id = serializers.PrimaryKeyRelatedField(
            queryset=Post.objects.all(),
            help_text="Идентификатор поста, для которого нужно получиить список лайков"
    )


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'first_name', 'last_name']


class ProfileSerialzer(serializers.ModelSerializer):
    user = UserSerializer()

    # todo: Скрыть конфиенциальные анные
    class Meta:
        model = Profile
        fields = '__all__'
        depth = 2
