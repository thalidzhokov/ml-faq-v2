from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.urls import path

from import_export import widgets, fields, resources
from import_export.admin import ImportExportModelAdmin
from import_export.admin import ImportExportActionModelAdmin

from .models import Answer, Question, S7Data, S7Answer, S7Question
from django.http import HttpResponseRedirect
from django.contrib.admin import AdminSite

admin.site.site_header = 'FAQ'


class AnswerAdmin(ImportExportModelAdmin):
    fields = ['answer']
    search_fields = ['id', 'answer']
    list_display = ['id', 'answer']

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


class S7AnswerAdmin(ImportExportModelAdmin):
    fields = ['answer']
    search_fields = ['id', 'answer']
    list_display = ['id', 'answer']

    class Meta:
        model = S7Answer




class S7QuestionAdmin(ImportExportModelAdmin):
    fields = ['question', 'answer_id', 'answer_label']
    search_fields = ['id', 'question', 'answer_id']
    list_display = ['id', 'question', 'answer_id']

    class Meta:
        model = S7Question

s7_admin_site.register(S7Answer, S7AnswerAdmin)
s7_admin_site.register(S7Question, S7QuestionAdmin)
