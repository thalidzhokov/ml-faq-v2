from django.shortcuts import render
from django import forms
from .models import Rating, Answer, Question, Statistic
from django.http import HttpResponseRedirect
from django.views import View
from faq.utils import predict_question_cosine
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework import status
import json
import random
# import uwsgi
import requests


class QuestionsApiView(APIView):
    @classmethod
    def get_extra_actions(cls):
        return []

    """
    post: return answer
    """

    def get(self, request):
        data = request.data
        print(request.data)
        return Response('use the post method, please')

    def post(self, request):
        question = request.data.get('question')
        model = request.data.get('model')
        result = predict_question_cosine(question, model)
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
        url = 'https://bookmaker-ratings.ru/wp-json/bmr/v1.2/tips/posts/'
        payload = {'filter': 'today'}
        r = requests.get(url, params=payload).json().get('list')
        ids = []
        for i in r:
            ids.append(i.get('id'))
        random_forecast = requests.get(f'{url}{random.choice(ids)}').json().get('content')

        return Response({"random_forecast": random_forecast})


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
        print(dataset)
        return Response({
            "top_1": result[0],
            "top_2": result[1],
            "top_3": result[2],
        })
