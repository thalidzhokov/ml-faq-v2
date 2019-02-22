from django.shortcuts import render
from django import forms
from .models import Rating, Answer, Question, Statistic
from django.http import HttpResponseRedirect
from django.views import View
from faq.utils import predict_question_cosine, cosine_dist
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework import status
import json
import random
# import uwsgi
import requests

match_dict = {'Футбол': 31710, 'MMA': 47264, 'Шахматы': 46842, 'Хоккей': 31711, 'Теннис': 31712, 'Баскетбол': 31713, 'Волейбол': 40059, 'Бокс': 31736, 'Киберспорт': 31749, 'Гандбол': 44711, 'Снукер': 31737, 'Формула-1': 41392, 'Бейсбол': 32564, 'Олимпийские игры-2016': 31767, 'ОИ-2018': 45051, 'Биатлон': 45050, 'Другой спорт': 31738, 'Лига чемпионов': 40063, 'Лига Европы': 31726, 'РПЛ': 31716, 'АПЛ': 31714, 'Примера': 31727, 'Серия А': 31715, 'Бундеслига': 31728, 'Лига 1': 33782, 'Серия А Бразилии': 47265, 'ФНЛ': 32841, 'Кубки (нац.)': 39225, 'Другие': 31735, 'Кубок конфедераций 2017': 41175, 'Евро-2016': 31729, 'ЧМ-2014': 31778, 'Кубок Америки-2016': 35476, 'ЧМ-2018': 33571, 'ЧМ по хоккею 2018': 46004, 'КХЛ': 31730, 'НХЛ': 31731, 'МХЛ': 31774, 'ВХЛ': 31775, 'ЧМ по хоккею 2015': 32131, 'ЧМ по хоккею 2016': 35148, 'ЧМ по хоккею 2017': 40706, 'WTA': 41007, 'ATP': 41008, 'Australian Open 2018': 34011, 'Ролан Гаррос 2018': 35366, 'Уимблдон 2018': 31768, 'US Open 2018': 33138, 'НБА': 31733, 'Евролига': 31734, 'Евробаскет-2015': 33171, 'Евробаскет-2017': 36592, 'Волейбол другие': 40132, 'Суперлига России': 40060, 'Плюс-лига Польши': 40061, 'Серия А1': 40062, 'Dota 2': 39227, 'CS:GO': 39228, 'LoL': 40008, 'МЛБ': 32565}


class QuestionsApiView(APIView):
    @classmethod
    def get_extra_actions(cls):
        return []

    """
    post: return answer
    """

    def get(self, request):
        data = request.data
        return Response('use the post method, please')

    def post(self, request):
        question = request.data.get('question')
        model = request.data.get('model')
        tres = request.data.get('tres')
        if '.' in tres:
            tres = float(tres)
        else:
            tres = int(tres)

        result = predict_question_cosine(question, model, tres)
        if not isinstance(result, list):
            return Response({
                "Message": result
            })
        else:
            return Response({
                "top_1": result[0],
                "top_2": result[1],
                "top_3": result[2]
        })


class QuestionForm(forms.Form):
    question = forms.CharField()


class FaqView(View):
    form_class = QuestionForm
    model = Rating
    template_name = 'faq/answer_list.html'

    def get(self, request, *args, **kwargs):
        request.session["temp_question"] = ''
        question = request.GET.get('question', request.session["temp_question"])
        request.session["temp_question"] = question
        form = self.form_class
        return render(request, self.template_name, {
            'form': form,
            "knn": Rating.objects.get(name='knn').vote_score,
            "rf": Rating.objects.get(name='random_forest').vote_score,
            "cd": Rating.objects.get(name='cosine_distance').vote_score,
        })


def vote_knn(request):
    if request.method == 'GET':
        a = Rating.objects.get(id=1)
        a.vote_score += 1
        a.save()

    return HttpResponseRedirect('/faq/')


def vote_random_forest(request):
    if request.method == 'GET':
        a = Rating.objects.get(name='random_forest')
        a.vote_score += 1
        a.save()

    return HttpResponseRedirect('/faq/')


def vote_cosine_distance(request):
    if request.method == 'GET':
        a = Rating.objects.get(name='cosine_distance')
        a.vote_score += 1
        a.save()

    return HttpResponseRedirect('/faq/')


def save_statistics(answer, question):
    Statistic.objects.create(
        question=question,
        answer=answer,
        right_answer='заглушка',
        user=request.user,
    )


class FaqViewSet(APIView):

    def get(self, request):
        return Response('use the post method, please')

    def post(self, request):
        answer = request.data.get('answer')
        question = request.data.get('question')

        if Answer.objects.filter(answer=answer).exists():
            current_answer = Answer.objects.get(answer=answer)
            a = Question.objects.create(question=question, answer_id=current_answer, answer_label=current_answer.id)
            a.save()
            return Response('this question already exist')
        else:
            set1 = Answer.objects.create(answer=answer)
            # set1.save()
            set2 = Question.objects.create(question=question, answer_id=set1, answer_label=set1.id)
            # set2.save()

        # save_statistics(question, answer)
        # print(save_statistics(question, answer))

        # Statistic.objects.create(
        #     question=question,
        #     answer=answer,
        #     right_answer='заглушка',
        #     user=request.user,
        # )

        return Response('ok', status=status.HTTP_201_CREATED)

class RandomForecastViewSet(APIView):
    def get(self, request):
        sport_type = match_dict.get(request.data.get('sport_type'))
        url = 'https://bookmaker-ratings.ru/wp-json/bmr/v1.2/tips/posts/'
        payload = {'filter': 'today', 'sport_types': sport_type}
        r = requests.get(url, params=payload).json().get('list')
        ids = []
        for i in r:
            ids.append(i.get('id'))
        r = requests.get(f'{url}{random.choice(ids)}').json()
        title = r.get('title')
        text = r.get('content')
        url = r.get('uri')
        random_forecast = f'{title}\n{text}'
        if len(random_forecast) > 600:
            text = text[:600]
            random_forecast = f'{title}\n{text}... '
        return Response({"random_forecast": random_forecast, "url": url})


class ReloadAppViewSet(APIView):
    url = 'http://46.101.255.21/api/questions/'

    def get(self, request):
        # uwsgi.reload()
        requests.post(self.url, data={'question': '', 'model': 'fasttext'})

        return Response('The model will be restarted', status=status.HTTP_201_CREATED)


class CustomDataViewSet(APIView):

    def post(self, request, username):
        question = request.data.get('question')
        model = request.data.get('model')
        dataset = request.data.get('dataset')
        result = predict_question_cosine(question, model, username)
        return Response({
            "top_1": result[0],
            "top_2": result[1],
            "top_3": result[2],
        })
