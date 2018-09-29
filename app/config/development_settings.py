from config.common_settings import *

DEBUG = True

SECRET_KEY = 'sosecret'

# To-Do: CACHES

# file uploads
MEDIA_ROOT = os.path.join(BASE_DIR, '../media_root')

# Django Debug Toolbar
INTERNAL_IPS = [
    '127.0.0.1',
]
