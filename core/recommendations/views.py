from drf_yasg.utils import swagger_auto_schema
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK
from rest_framework.views import APIView

from polznak_entities.models import Profile, Post, UserOpinion
from polznak_entities.serializers import PostSerializer
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
        similar_profiles_posts = Post.objects \
            .filter(creator__in=similar_profiles) \
            .order_by('-created_at')
        similar_profiles_posts_i_do_not_scored = similar_profiles_posts.exclude(
            pk__in=[x.post.pk for x in UserOpinion.objects.filter(sender=profile)]
        )

        posts_data = PostSerializer(
            similar_profiles_posts_i_do_not_scored[:10],
            many=True
        ).data

        if len(posts_data) == 0:
            posts_data = PostSerializer(
                Post.objects \
                    .order_by('-created_at') \
                    .exclude(creator=profile)[:10],
                many=True
            ).data

        # todo; отсортировать по любимым словам
        # my_favorite_words = AuthorSpecialWords \
        #     .create_for_author(profile) \
        #     .get_unque_and_long_words()
        return Response(
            {
                "posts": posts_data
            },
            HTTP_200_OK,
        )
