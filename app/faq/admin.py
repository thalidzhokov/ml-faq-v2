from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.urls import path

from import_export import widgets, fields, resources
from import_export.admin import ImportExportModelAdmin
from import_export.admin import ImportExportActionModelAdmin

from .models import Answer, Question, S7Data
from django.http import HttpResponseRedirect
from django.contrib.admin import AdminSite

admin.site.site_header = 'FAQ'


class AnswerAdmin(ImportExportModelAdmin):
    # change_list_template = "rating_changelist.html"
    # change_results_template = "new_change_list.html"
    fields = ['answer']
    search_fields = ['id', 'answer']
    list_display = ['id', 'answer']
    #
    # # queryset = []
    #
    # def get_urls(self):
    #     urls = super().get_urls()
    #     my_urls = [
    #         path('knn/', self.set_knn),
    #         path('random_forest/', self.set_random_forest),
    #         path('cosine_distance/', self.set_cosine_distance),
    #     ]
    #     return my_urls + urls
    #
    # def set_knn(self, request):
    #     a = Rating.objects.create(vote=1)
    #     a.vote += 1
    #     a.save()
    #     return HttpResponseRedirect("http://127.0.0.1:8000/admin/faq/answer/?q=%D0%B0%D0%B2%D0%B0")
    #
    # def set_random_forest(self):
    #     self.model.objects.all().update(vote=random_forest)
    #     self.vote += 1
    #     self.vote.save()
    #
    # def set_cosine_distance(self):
    #     self.model.objects.all().update(vote=cosine_distance)
    #     self.vote += 1
    #     self.vote.save()
    #
    # def get_search_results(self, request, queryset, search_term):
    #     queryset, use_distinct = super(AnswerAdmin, self).get_search_results(request, queryset, search_term)
    #
    #     result = predict_question_knn(search_term)
    #     #
    #     # arr = []
    #     # for j in result:
    #     #     arr.append(j)
    #
    #     # queryset = Answer.objects.filter(id__in=arr)
    #     print(search_term)
    #     print(predict_question_knn(search_term))
    #     # print(queryset)
    #
    #     # self.queryset = arr
    #     return queryset, use_distinct

    class Meta:
        model = Answer


admin.site.register(Answer, AnswerAdmin)


class QuestionAdmin(ImportExportModelAdmin):
    fields = ['question', 'answer_id', 'answer_label']
    search_fields = ['id', 'question', 'answer_id']
    list_display = ['id', 'question', 'answer_id']

    class Meta:
        model = Question


admin.site.register(Question, QuestionAdmin)


class S7Admin(AdminSite):
    site_header = "S7 Admin Panel"
    site_title = "S7 Admin Panel"
    index_title = "Welcome to S7 Admin Panel"
    fields = ['question','answer']
    list_display = ['id', 'question', 'answer']

    class Meta:
        model = S7Data




s7_admin_site = S7Admin(name='s7_admin')

s7_admin_site.register(S7Data)


