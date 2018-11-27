from django.db import models

from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token

@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)


class Answer(models.Model):
    id = models.AutoField(primary_key=True, help_text='Идентификатор ответа')
    answer = models.TextField(blank=True, help_text='Ответ', null=True)

    def __str__(self):
        return self.answer

    class Meta:
        ordering = ["-id", "answer"]


class Question(models.Model):
    id = models.AutoField(primary_key=True, help_text='Идентификатор вопроса')
    question = models.TextField(blank=True, help_text='Вопрос', null=True)
    answer_id = models.ForeignKey('Answer', on_delete=models.SET_NULL, null=True, help_text='Идентификатор ответа')
    answer_label = models.IntegerField(blank=True, help_text='Текст ответа', null=True)

    def __str__(self):
        return self.question

    class Meta:
        ordering = ["-answer_id", "-id", "question"]


class Rating(models.Model):
    name = models.CharField(max_length=128, blank=True, null=True)
    vote_score = models.IntegerField(blank=True, null=True)


class Statistic(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    question = models.TextField(blank=True, null=True)
    answer = models.TextField(blank=True, null=True)
    # answer 2 To-Do
    # answer 3 To-Do
    right_answer = models.TextField(blank=True, null=True)
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='user_id')
