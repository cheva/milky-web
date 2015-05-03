"""
Django settings for app project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'd654ge87g9afsd521a65g48er7g6a5f46a54rg8ad4vb351as6t7qaer+8'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    # django core
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # 3rd party energizers
    'django_jinja',
    'captcha',
    'guardian',
    # my projects
    'projects.main',
    'projects.blog',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

# GETTING-STARTED: change 'app' to your project name:
ROOT_URLCONF = 'app.urls'

WSGI_APPLICATION = 'app.wsgi.application'


# Guardian
AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',  # default
    'guardian.backends.ObjectPermissionBackend',
)

ANONYMOUS_USER_ID = -1


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases
'''
DATABASES = {
    'default': {
        'ENGINE':	'django.db.backends.sqlite3',
        'NAME':		os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
'''

if 'OPENSHIFT_POSTGRESQL_DB_HOST' in os.environ.keys():
    psql_user = 'adminpkkgnjz'
    psql_pass = 'r9vWmBmf-m4q'
    psql_host = os.environ['OPENSHIFT_POSTGRESQL_DB_HOST']
    psql_port = os.environ['OPENSHIFT_POSTGRESQL_DB_PORT']
else:
    psql_user = 'postgres'
    psql_pass = 'postgres'
    psql_host = 'localhost'
    psql_port = '5432'


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'USER': psql_user,
        'PASSWORD': psql_pass,
        'HOST': psql_host,
        'PORT': psql_port,
        'NAME': 'pyblog',
    }
}


# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'Europe/Kiev'
USE_I18N = True
USE_L10N = True
USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static')]

# Jinja2 templates
# http://niwibe.github.io/django-jinja/
# !!!ONLY for Django<1.8

TEMPLATE_DIRS = [os.path.join(BASE_DIR, 'templates')]
TEMPLATE_LOADERS = (
    'django_jinja.loaders.FileSystemLoader',
    'django_jinja.loaders.AppLoader',
)
DEFAULT_JINJA2_TEMPLATE_EXTENSION = '.jinja2'
