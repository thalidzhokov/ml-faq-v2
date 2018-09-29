from config.common_settings import *

DEBUG = True

SECRET_KEY = 'sosecret'

INSTALLED_APPS += [
    # 'debug_toolbar',
]

DATABASES = {
   'default': {
       'ENGINE': 'django.db.backends.postgresql',
       'NAME': 'db',
       'USER': 'user',
       'PASSWORD': 'password',
       'HOST': 'postgres',
       'PORT': '5432',
   }
}

# To-Do: CACHES

# file uploads
MEDIA_ROOT = os.path.join(BASE_DIR, '../media_root')

# Django Debug Toolbar
INTERNAL_IPS = [
    '127.0.0.1',
]
