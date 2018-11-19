from django.shortcuts import render
from django import forms
from .models import Rating, Answer, Question
from django.http import HttpResponseRedirect
from django.views import View
from faq.utils import predict_question_knn, predict_question_rf, predict_question_cosine
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework import status


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
        # назвать индексы
        return Response([
            {
                "top_1": predict_question_cosine(question)
            },

            {
                "top_2": predict_question_knn(question)
            },
            {
                "top_3": predict_question_rf(question)
            }

            ])


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


class FaqViewSet(APIView):

    def get(self, request):
        return Response('use the post method, please')

    def post(self, request):
        answer = request.data.get('answer')
        question = request.data.get('question')

        set1 = Answer.objects.create(answer=answer)
        set1.save()
        set2 = Question.objects.create(question=question, answer_id=set1)
        set2.save()

        return Response('ok', status=status.HTTP_201_CREATED)
