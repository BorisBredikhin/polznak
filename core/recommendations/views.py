from drf_yasg.utils import swagger_auto_schema
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK
from rest_framework.views import APIView

from polznak_entities.models import Profile
from polznak_entities.serializers import ProfileSerialzer
from recommendations.models import AuthorSpecialWords
from recommendations.utils.likes import get_users_who_liked_user_posts


def test(request):
    profile = Profile.objects.get(pk=62)
    asw = AuthorSpecialWords(author=profile)
    asw.get_unque_and_long_words()


class PersonalRecommendations(APIView):
    @swagger_auto_schema(
        operation_description="Персjнальные рекомеендации для текуoего "
                              "пользователя"
    )
    def get(self, request: Request):
        profile = Profile.objects.get(user=request.user)

        similar_profiles = get_users_who_liked_user_posts(profile)

        return Response(
            ProfileSerialzer(similar_profiles, many=True).data,
            # AuthorSpecialWords \
            #     .create_for_author(profile) \
            #     .get_unque_and_long_words(),
            HTTP_200_OK,
        )
