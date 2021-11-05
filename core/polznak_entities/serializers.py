from rest_framework.relations import PrimaryKeyRelatedField
from rest_framework.serializers import ModelSerializer

from polznak_entities.models import Post, Profile


class PostSerializer(ModelSerializer):
    creator = PrimaryKeyRelatedField(queryset=Profile.objects.all(), required=False)

    class Meta:
        model = Post
        fields = '__all__'
