import typing

import nltk
import nltk
from django.db import models
from nltk import SnowballStemmer

from polznak_entities.models import Profile, Post
from recommendations.utils import remove_stop_words


class AuthorSpecialWords(models.Model):
    author = models.OneToOneField(Profile, on_delete=models.CASCADE)
    unque_and_long_words = models.JSONField()

    @staticmethod
    def create_for_author(author: Profile) -> 'AuthorSpecialWords':
        '''
        Создаёт и вовраащает объект класса `AuthorSpecialWords` с заполненными полями, но не сохраняет его.
        '''
        instance = AuthorSpecialWords()
        instance.author = author
        special_words = instance.get_unque_and_long_words()
        instance.unque_and_long_words = special_words
        return instance

    def get_unque_and_long_words(self) -> typing.TypedDict('gUaLw', {'long_words': list, 'unique_words': list}):
        #todo: нормалиовать слова,
        posts = Post.objects.filter(creator=self.author)
        unique_words = []
        long_words = []
        stemmer = SnowballStemmer("russian")

        for post in posts:
            sents = [nltk.word_tokenize(sent) for sent in nltk.sent_tokenize(post.content)]
            # named_entities=[]

            clean_words = []
            for sent in sents:
                for word in sent:
                    if all(c.isalpha() for c in word):
                        clean_words.append(word)

                # named_entities.append([w for w in nltk.ne_chunk(nltk.pos_tag(sent, lang='rus'))])

            clean_words = remove_stop_words(map(str.lower, clean_words))
            clean_words = [stemmer.stem(w) for w in clean_words]
            # print(clean_words)

            avg_len = sum(map(len, clean_words))/len(clean_words)
            long_words += [w for w in clean_words if len(w) > avg_len]
            # print(long_words)
            fdist = nltk.FreqDist(clean_words)
            unique_words+=fdist.hapaxes()
            # print(named_entities)
            # print('\n---\n')
        return {
            'long_words': long_words,
            'unique_words': unique_words,
        }
