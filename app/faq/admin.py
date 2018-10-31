from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from import_export import widgets, fields, resources
from import_export.admin import ImportExportModelAdmin
from import_export.admin import ImportExportActionModelAdmin

from .models import Answer, Question

admin.site.site_header = 'FAQ'


class AnswerAdmin(ImportExportModelAdmin):
    fields = ['answer']
    search_fields = ['id', 'answer']

    class Meta:
        model = Answer


admin.site.register(Answer, AnswerAdmin)


class QuestionAdmin(ImportExportModelAdmin):
    fields = ['question', 'answer_id']
    search_fields = ['id', 'question', 'answer_id']

    class Meta:
        model = Question


admin.site.register(Question, QuestionAdmin)
