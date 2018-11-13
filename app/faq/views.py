from django.shortcuts import render
from django import forms
from .models import Rating
from django.http import HttpResponseRedirect
from django.views import View
from faq.utils import predict_question_knn, predict_question_rf, predict_question_cosine


class QuestionForm(forms.Form):
    question = forms.CharField()


class FaqView(View):
    form_class = QuestionForm
    model = Rating
    template_name = 'faq/answer_list.html'

    def get(self, request, *args, **kwargs):
        question = request.GET.get('question', request.session["temp_question"])
        request.session["temp_question"] = question
        form = self.form_class
        return render(request, self.template_name, {
            'form': form,
            "test": predict_question_knn(question),
            "random_forest": predict_question_rf(question),
            "cosine_distance": predict_question_cosine(question),
            "knn": Rating.objects.get(id=1).knn,
            "rf": Rating.objects.get(id=2).random_forest,
            "cd": Rating.objects.get(id=3).cosine_distance,
        })


def vote_knn(request):
    if request.method == 'GET':
        a = Rating.objects.get(id=1)
        a.knn += 1
        a.save()
        # b = Rating.objects.get(id=1)
        # b.vote += 1
        # b.save()
    return HttpResponseRedirect('/faq/')


def vote_random_forest(request):
    if request.method == 'GET':
        a = Rating.objects.get(id=2)
        a.random_forest += 1
        a.save()
        # b = Rating.objects.get(id=1)
        # b.vote += 1
        # b.save()
    return HttpResponseRedirect('/faq/')


def vote_cosine_distance(request):
    if request.method == 'GET':
        a = Rating.objects.get(id=3)
        a.cosine_distance += 1
        a.save()
        # b = Rating.objects.get(id=1)
        # b.vote += 1
        # b.save()
    return HttpResponseRedirect('/faq/')
