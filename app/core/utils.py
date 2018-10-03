#!/usr/bin/python
# -*- coding: utf8 -*-

# imports
import spacy
import csv
import pandas as pd
from pymystem3 import Mystem

# spacy.load
nlp = spacy.load('/fasttext-vectors/word-vectors-v2')

# preprocessing
mystem = Mystem()

RUSSIAN_STOPWORDS = ['и', 'в', 'во', 'не', 'что', 'он', 'на', 'я', 'с', 'со', 'что-то',
                     'как', 'а', 'то', 'все', 'она', 'так', 'его', 'но', 'да', 'ты', 'к', 'у', 'же',
                     'вы', 'за', 'бы', 'по', 'только', 'ее', 'мне', 'было', 'вот', 'от', 'меня', 'еще',
                     'нет', 'о', 'из', 'ему', 'теперь', 'когда', 'даже', 'ну', 'вдруг', 'ли', 'если',
                     'уже', 'или', 'ни', 'быть', 'был', 'него', 'до', 'вас', 'нибудь', 'опять', 'уж',
                     'вам', 'ведь', 'там', 'потом', 'себя', 'ничего', 'ей', 'может', 'они', 'тут',
                     'где', 'есть', 'надо', 'ней', 'для', 'мы', 'тебя', 'их', 'чем', 'была', 'сам',
                     'чтоб', 'без', 'будто', 'чего', 'раз', 'тоже', 'себе', 'под', 'будет', 'ж',
                     'тогда', 'кто', 'этот', 'того', 'потому', 'этого', 'какой', 'совсем', 'ним',
                     'здесь', 'этом', 'один', 'почти', 'мой', 'тем', 'чтобы', 'нее', 'сейчас', 'были',
                     'куда', 'зачем', 'всех', 'никогда', 'можно', 'при', 'наконец', 'два', 'об', 'другой',
                     'хоть', 'после', 'над', 'больше', 'тот', 'через', 'эти', 'нас', 'про', 'всего', 'них',
                     'какая', 'много', 'разве', 'три', 'эту', 'моя', 'впрочем', 'хорошо', 'свою', 'этой',
                     'перед', 'иногда', 'лучше', 'чуть', 'том', 'нельзя', 'такой', 'им', 'более', 'всегда',
                     'конечно', 'всю', 'между', 'почему', 'мочь', 'хотеть', 'какие', 'как', 'привет',
                     'здравствуйте', 'приветствую', 'сделать', 'узнавать', 'что-нибудь', 'пожалуйста',
                     ]

TRASH = [' ', ',', ', ', ' ?', '? ', '-', '.', '. ', ')', '(', ' (', ') ', '«', '»', ' «', '» ', '!', '?', '\n']


def lemmatize(text):
    lemmas_with_spaces = mystem.lemmatize(text)
    return lemmas_with_spaces


def remove_stop_words(lemmas):
    return [w for w in lemmas if not w in RUSSIAN_STOPWORDS]


def clean_text(text):
    res = text[:]
    for word in text:
        if word in TRASH:
            res.remove(word)
    return res


# load data
df = pd.read_csv('../dataset.csv', usecols=['id', 'question', 'answer', 'title'])
dataset = df.to_dict(orient='records')

data = open('../dataset.csv')
questions_answers_dict = {x[1]: x[2] for x in csv.reader(data, delimiter=',', quotechar='"')}

# arr = list(faqs.keys())
questions = list(questions_answers_dict.keys())


# print(questions)

def print_result(question):
    # global top5_answers
    question = nlp(' '.join(clean_text(remove_stop_words(lemmatize(question)))))
    for_sort = []
    for i in questions:
        for_sort.append((question.similarity(nlp(' '.join(clean_text(remove_stop_words(lemmatize(i)))))), nlp(i).text))
    return sorted(for_sort, key=lambda tup: tup[0], reverse=True)[0:5]


def append_new_vector(question_append, question):
    questions[int(question_append)] + ' ' + str(question)
