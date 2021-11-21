from drf_yasg.utils import swagger_auto_schema
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK
from rest_framework.views import APIView

from polznak_entities.models import Profile
from recommendations.models import AuthorSpecialWords


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
        return Response(
            AuthorSpecialWords \
                .create_for_author(Profile.objects.get(user=request.user)) \
                .get_unque_and_long_words(),
            HTTP_200_OK,
        )
