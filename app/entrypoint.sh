#!/bin/sh

if [ ! -f "/tmp/entrypoint.lock" ]; then

    rm -rf static
    python manage.py collectstatic

    rm -rf faq/migrations
    python manage.py makemigrations faq
    python manage.py migrate
    
    echo "from django.contrib.auth.models import User; User.objects.create_superuser('$APP_USER', '$APP_USER_EMAIL', '$APP_USER_PASSWORD')" | python manage.py shell

    date >> /tmp/entrypoint.lock

fi

uwsgi --ini uwsgi.ini