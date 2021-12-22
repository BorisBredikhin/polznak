from typing import Iterable

import nltk
from nltk.corpus import stopwords

nltk.download('averaged_perceptron_tagger_ru')

stop_words: list = stopwords.words('russian') + stopwords.words('english') # fixme: добавить интерфейс для более удобного добавления других языков

def remove_stop_words(words: Iterable) -> list:
    return [w for w in words if not w in stop_words]

if __name__ == '__main__':
    print(stop_words)
