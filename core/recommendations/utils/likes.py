from polznak_entities.models import Profile, UserOpinion


def get_users_who_liked_user_posts(me: Profile) -> set:
    '''

    :param me:
    :return: Ползователи. лайкнувшие me
    '''
    return set(l.sender for l in UserOpinion.objects.filter(post__creator=me, opinion=1))

def get_cross_likes_users(me: Profile) -> set:
    '''

    :param me:
    :return: Пользователи, лайкнувшие друг-друга и ee
    '''

    return get_users_who_liked_user_posts(me) \
           & set(
            l.post.creator
            for l in UserOpinion.objects.filter(sender=me, opinion=1)
    )
