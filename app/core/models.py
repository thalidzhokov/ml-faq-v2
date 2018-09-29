from django.db import models

class Faq(models.Model):
    question = models.TextField(blank=True, null=True, help_text='Вопрос из датасета.')
    answer = models.TextField(blank=True, null=True, help_text='Ответ из датасета.')
    title = models.TextField(blank=True, null=True, help_text='Заголовок вопроса из датасета.')
