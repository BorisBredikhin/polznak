import nltk
from django.db import models

from polznak_entities.models import Profile, Post


class AuthorSpecialWords(models.Model):
    author = models.OneToOneField(Profile, on_delete=models.CASCADE)
    unque_and_long_words = models.JSONField()

    def get_unque_and_long_words(self):
        #todo: удалить стоп-слова,
        #todo: нормалиовать слова,
        posts = Post.objects.filter(creator=self.author)
        unique_words = []

        for post in posts:
            sents = [nltk.word_tokenize(sent) for sent in nltk.sent_tokenize(post.content)]
            # text = nltk.Text(nltk.word_tokenize(post.content))
            # print(text.vocab().most_common(10))
            # print("---")
            # print(sents)
            clean_words = []
            for sent in sents:
                for word in sent:
                    if all(c.isalpha() for c in word):
                        clean_words.append(word)

            avg_len = sum(map(len, clean_words))/len(clean_words)
            long_words = [w for w in clean_words if len(w) > avg_len]
            print(long_words)
            fdist = nltk.FreqDist(clean_words)
            print(fdist.hapaxes())
            unique_words+=fdist.hapaxes()
            print("\n---\n")
