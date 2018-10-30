from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from import_export import widgets, fields, resources
from import_export.admin import ImportExportModelAdmin
from import_export.admin import ImportExportActionModelAdmin

from .models import Answer, Question

admin.site.site_header = 'FAQ'


class AnswerAdmin(ImportExportModelAdmin):

    class Meta:
        model = Answer
        fields = ['answer',]


class QuestionAdmin(ImportExportModelAdmin):

    class Meta:
        model = Question
        fields = ['question', 'answer_id',]


admin.site.register(Question, QuestionAdmin)
admin.site.register(Answer, AnswerAdmin)
