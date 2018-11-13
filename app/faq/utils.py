#!/usr/bin/python
# -*- coding: utf8 -*-

# imports
import pandas as pd
import numpy as np
import pickle
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from string import punctuation
from pymorphy2 import MorphAnalyzer
from collections import Counter
from sklearn.metrics.pairwise import cosine_distances
from gensim.models import KeyedVectors

morph = MorphAnalyzer()
stops = stopwords.words('russian')
punct = punctuation + '«»—…“”*№–'

stops.extend(
    ['что', 'это', 'так', 'вот', 'быть', 'как', 'в', 'к', 'на', 'хоть', 'после', 'над', 'больше', 'тот', 'через', 'эти',
     'нас', 'про', 'всего', 'них',
     'какая', 'много', 'разве', 'три', 'эту', 'моя', 'впрочем', 'хорошо', 'свою', 'этой',
     'перед', 'иногда', 'лучше', 'чуть', 'том', 'нельзя', 'такой', 'им', 'более', 'всегда',
     'конечно', 'всю', 'между', 'почему', 'мочь', 'хотел', 'какие', 'как', 'привет',
     'здравствовать', 'приветствовать', 'сделать', 'узнать', 'что-нибудь', 'пожалуйста', 'допустить',
     'добрый', 'день', 'утро', 'вечер', 'привет', 'спасибо', 'не', 'мочь', 'получается',
     'время', 'сутки', 'которой', 'сказать', 'свои', 'найти',
     'хотеть', 'например', 'подскажите', 'просить', 'сделать', 'так', 'хотя', 'поэтому', 'один', 'два', 'ещё', 'уже',
     'из', 'под',
     'возможно', 'https', 'ваш', 'весь', 'свой', 'сей', 'вчера', 'который', 'несколько', 'уважаемый'])

# load pretrained model
ft = KeyedVectors.load_word2vec_format(('cc.ru.300.vec'), binary=False)


def normalize(text):
    # words = [word.strip(punct) for word in text.lower().split()]
    words = [word.strip(punct) for word in word_tokenize(text.lower())]
    words = [morph.parse(word)[0].normal_form for word in words]
    words = [word for word in words if word not in stops]
    return ' '.join(words)


data = pd.read_csv('df_all_class_labels.csv', sep='\t')

data['texts_norm'] = data['texts'].apply(lambda x: normalize(x))

# model_1 SVD+Random Forest
filename = 'ft_vec_SVD_RandForest.sav'
loaded_model_RF = pickle.load(open(filename, 'rb'))

# model_2 SVD+KNN
filename = 'ft_vec_SVD_KNN.sav'
loaded_model_KNN = pickle.load(open(filename, 'rb'))


def vectorize(texts, strings_number, dim):
    if strings_number == 1:
        vects = np.zeros((strings_number, dim))
        vects[0] = getWordVecs(texts, dim)
    else:
        vects = np.zeros((strings_number, dim))
        for i, text in enumerate(texts.values):
            vects[i] = getWordVecs(text, dim)
    return vects


# функция для поиска векторов в предобученных векторах Fasttext
def getWordVecs(text, dim):
    text = text.split()
    # чтобы не доставать одно слово несколько раз
    # сделаем счетчик, а потом векторы домножим на частоту
    words = Counter(text)
    total = len(text)
    vectors = np.zeros((len(words), dim))
    for i, word in enumerate(words):
        try:
            v = ft[word]
            vectors[i] = v * (words[word] / total)  # просто умножаем вектор на частоту
        except (KeyError, ValueError):
            continue

    if vectors.any():  # усредняем векторы
        vector = np.average(vectors, axis=0)
    else:
        vector = np.zeros((dim))

    return vector


def predict_question_rf(question):
    prep = normalize(question)
    dim = 300
    vects_prep = vectorize(prep, 1, dim)
    predicted_1 = loaded_model_RF.predict(vects_prep)

    clas = int(data.labels[predicted_1])
    df = data['answers'].loc[data['labels'] == clas]
    return (question, df.iloc[0])


# index.values https://brlhq.slack.com/archives/GB6RNKYUD/p1541757643006100

def predict_question_knn(question):
    prep = normalize(question)
    dim = 300
    vects_prep = vectorize(prep, 1, dim)
    predicted_2 = loaded_model_KNN.predict(vects_prep)

    clas = int(data.labels[predicted_2])
    df = data['answers'].loc[data['labels'] == clas]
    return (question, df.iloc[0])


def predict_question_cosine(question):
    dim = 300
    prep = normalize(question)
    vects_prep = vectorize(prep, 1, dim)
    vects_ft = vectorize(data['texts_norm'], len(data['texts_norm']), dim)
    cos_dist = cosine_distances(vects_prep, vects_ft).argsort()

    clas = int(data.labels[cos_dist[0][0]])
    df = data['answers'].loc[data['labels'] == clas]
    return (question, df.iloc[0])
