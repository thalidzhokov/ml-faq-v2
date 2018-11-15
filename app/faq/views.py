from django.shortcuts import render
from django import forms
from .models import Rating
from django.http import HttpResponseRedirect
from django.views import View
from faq.utils import predict_question_knn, predict_question_rf, predict_question_cosine
from rest_framework.views import APIView
from rest_framework.response import Response


class QuestionsApiView(APIView):
    """
    post: return answer
    """
    # def get(self, request, format=None):
    #     snippets = Snippet.objects.all()
    #     serializer = SnippetSerializer(snippets, many=True)
    #     return Response(serializer.data)


    def get(self, request):
        data = request.data
        print(request.data)
        return Response('fdf')

    # def post(self, request, format=None):
    #     serializer = SnippetSerializer(data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def post(self, request):
        question = request.data.get('question')
        return Response(
            {
        "knn": predict_question_knn(question),
        "random_forest": predict_question_rf(question),
        "cosine_distance": predict_question_cosine(question)
            }
        )


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
            # "test": predict_question_knn(question),
            # "random_forest": predict_question_rf(question),
            # "cosine_distance": predict_question_cosine(question),
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


