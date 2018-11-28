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
        return Response({

            "top_1": predict_question_cosine(question)[0],
            "top_2": predict_question_cosine(question)[1],
            "top_3": predict_question_cosine(question)[2]

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
