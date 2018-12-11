#!/usr/bin/python
# -*- coding: utf8 -*-

# imports
import pandas as pd
import numpy as np
import pickle
import scipy
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from string import punctuation
from pymorphy2 import MorphAnalyzer
from collections import Counter
from sklearn.metrics.pairwise import cosine_distances
#from gensim.models import KeyedVectors
from .models import Question, S7Question
from django_pandas.io import read_frame
from gensim.models import FastText

morph = MorphAnalyzer()
stops = stopwords.words('russian')
punct = punctuation + '«»—…“”*№–'


qs = S7Question.objects.all()
qs2 = Question.objects.all()
data = read_frame(qs2, fieldnames=['question', 'answer_id', 'answer_label'])
data_s7 = read_frame(qs, fieldnames=['question', 'answer_id', 'answer_label'])

values = {'answer_id': 'В письме с уведомлением внизу есть возможность отписаться от получения уведомлений.'}
data = data.fillna(value=values)
# data.to_csv('DATA.csv', sep='\t', index=False)

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

F = np.memmap("uploads/fasttext/embed.dat", dtype='float32', mode="r", shape=(2000000, 300))
with open("uploads/fasttext/embed.vocab") as f:
    vocab_list = map(str.strip, f.readlines())

vocab_dict = {w: k for k, w in enumerate(vocab_list)}

fname = 'uploads/fasttext-own.model'
fast_text = FastText.load(fname)

def normalize(text):
    words = [word.strip(punct) for word in word_tokenize(text.lower())]
    words = [morph.parse(word)[0].normal_form for word in words]
    words = [word for word in words if word not in stops]
    return ' '.join(words)

#pretrained: model = F[vocab_dict[word]]
# функция для поиска векторов в предобученных векторах Fasttext
def getWordVecs(text, dim, model):
    text = text.split()
    # чтобы не доставать одно слово несколько раз
    # сделаем счетчик, а потом векторы домножим на частоту
    words = Counter(text)
    total = len(text)
    vectors = np.zeros((len(words), dim))
    for i, word in enumerate(words):
        try:
            if model != 'embed':
                v = model[word]
            else:
                v = F[vocab_dict[word]]
            vectors[i] = v * (words[word] / total)  # просто умножаем вектор на частоту
        except (KeyError, ValueError):
            continue

    if vectors.any():  # усредняем векторы
        vector = np.average(vectors, axis=0)
    else:
        vector = np.zeros((dim))

    return vector


def vectorize(texts, strings_number, dim, model):
    if strings_number == 1:
        vects = np.zeros((strings_number, dim))
        vects[0] = getWordVecs(texts, dim, model)
    else:
        vects = np.zeros((strings_number, dim))
        for i, text in enumerate(texts.values):
            vects[i] = getWordVecs(text, dim, model)

    return vects


data['texts_norm'] = data['question'].apply(lambda x: normalize(x))
data_s7['texts_norm'] = data_s7['question'].apply(lambda x: normalize(x))

# model_1 SVD+Random Forest
filename = 'uploads/ft_vec_SVD_RF_new.sav'
loaded_model_RF = pickle.load(open(filename, 'rb'))

# model_2 SVD+KNN
filename = 'uploads/ft_vec_SVD_KNN_new.sav'
loaded_model_KNN = pickle.load(open(filename, 'rb'))


# def predict_question_rf(question):
#     prep = normalize(question)
#     print(prep, 'prep')
#     dim = 300
#     vects_prep = vectorize(prep, 1, dim)
#     predicted_1 = loaded_model_RF.predict(vects_prep)
#
#     clas = int(data.label[predicted_1])
#     print(clas, 'clas')
#     #df = data['answer_id'].loc[data['answer_label'] == clas]
#     # return data.loc[data['answer_id'] == clas, 'answer_label'].iloc[0]
#     return data.loc[data['answer'] == clas, 'label'].iloc[0]
#
#
# def predict_question_knn(question):
#     prep = normalize(question)
#     dim = 300
#     vects_prep = vectorize(prep, 1, dim)
#     predicted_2 = loaded_model_KNN.predict(vects_prep)
#
#     clas = int(data.label[predicted_2])
#     #df = data['answer_id'].loc[data['answer_label'] == clas]
#     # return data.loc[data['answer_id'] == clas, 'answer_label'].iloc[0]
#     return data.loc[data['answer'] == clas, 'label'].iloc[0]


def predict_question_cosine(question, model, username=''):
    dim = 100
    data = read_frame(qs2, fieldnames=['question', 'answer_id', 'answer_label'])
    data['texts_norm'] = data['question'].apply(lambda x: normalize(x))
    if username == 's7':
        data = data_s7
        # data['texts_norm'] = data['question'].apply(lambda x: normalize(x))
        prep = normalize(question)
        vects_prep = vectorize(prep, 1, dim, fast_text.wv)
        vects_ft = vectorize(data['texts_norm'], len(data['texts_norm']), dim, fast_text.wv)
        cos_dist = cosine_distances(vects_prep, vects_ft).argsort()

        cos_list = list(cos_dist[0][:])
        lst = []
        for i in cos_list:
            lst.append(data['answer_id'].loc[data.index == i].values[0])

        df = pd.DataFrame(lst, columns=['cosanswer'])
        df = df.drop_duplicates(subset='cosanswer')

        return list(df['cosanswer'].values[:3])  # это список из ответов в количестве 3 шт.
    else:
        prep = normalize(question)
        vects_prep = vectorize(prep, 1, dim, fast_text.wv)
        vects_ft = vectorize(data['texts_norm'], len(data['texts_norm']), dim, fast_text.wv)
        cos_dist = cosine_distances(vects_prep, vects_ft).argsort()

        cos_list = list(cos_dist[0][:])
        lst = []
        for i in cos_list:
            lst.append(data['answer_id'].loc[data.index == i].values[0])

        df = pd.DataFrame(lst, columns=['cosanswer'])
        df = df.drop_duplicates(subset='cosanswer')

        return list(df['cosanswer'].values[:3])  # это список из ответов в количестве 3 шт.
