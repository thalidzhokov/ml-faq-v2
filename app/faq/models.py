from django.db import models


class Answer(models.Model):
    id = models.AutoField(primary_key=True, help_text='Идентификатор ответа')
    answer = models.TextField(blank=True, help_text='Ответ', null=True)

    class Meta:
        ordering = ["-id", "answer"]


class Question(models.Model):
    id = models.AutoField(primary_key=True, help_text='Идентификатор вопроса')
    question = models.TextField(blank=True, help_text='Вопрос', null=True)
    answer_id = models.ForeignKey('Answer', on_delete=models.SET_NULL, null=True, help_text='Идентификатор ответа')

    class Meta:
        ordering = ["-answer_id", "-id", "question"]

