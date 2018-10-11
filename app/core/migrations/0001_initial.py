from django.db import migrations, models
import uuid


class FAQ(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name='Answer',
            fields=[
                ('id', models.UUIDField(primary_key=True, default=uuid.uuid4, help_text='Идентификатор ответа')),
                ('answer', models.TextField(blank=True, help_text='Ответ', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.UUIDField(primary_key=True, default=uuid.uuid4, help_text='Идентификатор вопроса')),
                ('question', models.TextField(blank=True, help_text='Вопрос', null=True)),
                #('answer_id', models.ForeignKey()), <<<<<<<<<<<<<<<<<<
            ],
        ),
    ]
