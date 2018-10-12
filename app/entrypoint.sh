#!/bin/sh

if [ ! -f "entrypoint.lock" ]; then

    python manage.py collectstatic
    python manage.py migrate
    echo "from django.contrib.auth.models import User; User.objects.create_superuser('$APP_USER', '$APP_USER_EMAIL', '$APP_USER_PASSWORD')" | python manage.py shell

    touch entrypoint.lock

fi

uwsgi --ini uwsgi.ini