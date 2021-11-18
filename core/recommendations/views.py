from polznak_entities.models import Profile
from recommendations.models import AuthorSpecialWords


def test(request):
    profile = Profile.objects.get(pk=62)
    asw = AuthorSpecialWords(author=profile)
    asw.get_unque_and_long_words()
