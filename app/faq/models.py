from django.db import models



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

    def __str__(self):
        return self.question

    class Meta:
        ordering = ["-answer_id", "-id", "question"]


class Rating(models.Model):
    name = models.CharField(max_length=128, blank=True, null=True)
    vote_score = models.IntegerField(blank=True, null=True)
