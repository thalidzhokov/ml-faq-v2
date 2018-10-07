from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name='Faq',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question', models.TextField(blank=True, help_text='Вопрос из датасета.', null=True)),
                ('answer', models.TextField(blank=True, help_text='Ответ из датасета.', null=True)),
                ('title', models.TextField(blank=True, help_text='Заголовок вопроса из датасета.', null=True)),
            ],
        ),
    ]
