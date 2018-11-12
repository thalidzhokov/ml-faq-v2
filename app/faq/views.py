from django.shortcuts import render
from rest_framework.views import APIView

# Create your views here.
from django import forms

from django.views.generic import ListView
from .models import Answer, Question, Rating
from django.http import HttpResponse
from faq.utils import predict_question_knn, predict_question_rf
from django.http import HttpResponseRedirect

from django.views import View

class QuestionForm(forms.Form):
    question = forms.CharField()


# class FaqListView(ListView):
#     model = Rating
#     paginate_by = 10
#     template_name = 'faq/answer_list.html'
#
#     # def vote_knn(request=None):
#     #     a = Rating.objects.get(id=1)
#     #     a.knn += 1
#     #     a.save()
#
#
#     # def best_answer(self, *args, **kwargs):
#     #     first_answer = self.get_queryset().first()
#     #     response = HttpResponse('')
#     #     predict_question_knn('test')
#     #     return response
#
#     def get_context_data(self, **kwargs):
#         print(self.request)
#
#         context = super(FaqListView, self).get_context_data(**kwargs)
#         context = {
#             "test": predict_question_knn('test'),
#             "random_forest": predict_question_rf('test'),
#             "form": QuestionForm(),
#             "knn": Rating.objects.get(id=1).knn,
#             "rf": Rating.objects.get(id=2).random_forest,
#             "cd": Rating.objects.get(id=3).cosine_distance,
#         }
#         return context
    #
    #
    # def increment_random_forest(self, request):
    #     self.model.objects.all().update(vote=random_forest)
    #     self.vote += 1
    #     self.vote.save()
    #     return HttpResponseRedirect("http://127.0.0.1:8000/admin/faq/answer/?q=%D0%B0%D0%B2%D0%B0")

class FaqView(View):
    form_class = QuestionForm
    model = Rating
    template_name = 'faq/answer_list.html'

    def get(self, request, *args, **kwargs):
        question = request.GET.get('question')
        form = self.form_class
        return render(request, self.template_name, {
            'form': form,
            "test": predict_question_knn('fdf'),
            "random_forest": predict_question_rf('fdf'),
            "knn": Rating.objects.get(id=1).knn,
            "rf": Rating.objects.get(id=2).random_forest,
            "cd": Rating.objects.get(id=3).cosine_distance,
        })

    # def post(self, request, *args, **kwargs):
    #     print(request)
    #     form = self.form_class
    #     return render(request, self.template_name, {
    #         'form': form,
    #         "test": predict_question_knn('test'),
    #         "random_forest": predict_question_rf('test'),
    #         "knn": Rating.objects.get(id=1).knn,
    #         "rf": Rating.objects.get(id=2).random_forest,
    #         "cd": Rating.objects.get(id=3).cosine_distance,
    #     })

    # def get_context_data(self, **kwargs):
    #     print(self.request)
    #
    #     context = super(FaqView, self).get_context_data(**kwargs)
    #     context = {
    #         "test": predict_question_knn('test'),
    #         "random_forest": predict_question_rf('test'),
    #         "form": QuestionForm(),
    #         "knn": Rating.objects.get(id=1).knn,
    #         "rf": Rating.objects.get(id=2).random_forest,
    #         "cd": Rating.objects.get(id=3).cosine_distance,
    #     }
    #     return context


def vote_knn(request):
    if request.method == 'GET':

        a = Rating.objects.get(id=1)
        a.knn += 1
        a.save()
    return HttpResponseRedirect('/faq/')

def vote_random_forest(request):
    if request.method == 'GET':

        a = Rating.objects.get(id=2)
        a.random_forest += 1
        a.save()
    return HttpResponseRedirect('/faq/')

def vote_cosine_distance(request):
    if request.method == 'GET':

        a = Rating.objects.get(id=3)
        a.cosine_distance += 1
        a.save()
    return HttpResponseRedirect('/faq/')