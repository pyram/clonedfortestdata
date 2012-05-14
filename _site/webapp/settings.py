#
# Copyright 2009 by Neubloc, LLC. All rights reserved.
# Author: Marcin Mierzejewski
#

import platform
import sys

if platform.node() == "b17d":
    APPLICATION_URL = 'http://127.0.0.1:8000'
    APPLICATION_ROOT = 'e:\\Neubloc\\neubloc-website\\webapp'
    DEBUG = True
else:
    APPLICATION_URL = 'http://www.neubloc.pl'
    APPLICATION_ROOT = '/var/www/neubloc.pl/webapp'
    DEBUG = False


TEMPLATE_DEBUG = DEBUG

#EMAIL_HOST = ''
#EMAIL_HOST_USER = ''
#EMAIL_HOST_PASSWORD = ''
#EMAIL_USE_TLS = True

sys.path.append('%s/apps' % APPLICATION_ROOT)
sys.path.append('%s/libs' % APPLICATION_ROOT)

ADMINS = (
    ('Marcin Mierzejewski', 'mmierzejewski@neubloc.com'),
)

MANAGERS = ADMINS

DATABASE_ENGINE = 'sqlite3'
DATABASE_NAME = '%s/database.db' % APPLICATION_ROOT

TIME_ZONE = 'America/Chicago'

SITE_ID = 1
MEDIA_ROOT = '%s/site_media' % APPLICATION_ROOT
MEDIA_URL = '/site_media/'
ADMIN_MEDIA_PREFIX = '/media/'
APPEND_SLASH = True
SECRET_KEY = '50%+2432j5i52-2a5&akghjqpfq5-14gm&2l#ae$9*jw*od#i7_v76'

gettext = lambda s: s

CMS_TEMPLATES = (
    ('base_submenu.html', gettext('Base with submenu')),
    ('base_no_submenu.html', gettext('Base without submenu')),
    ('base_news.html', gettext('News')),
    ('base_news_details.html', gettext('News Details')),
    ('base_home.html', gettext('Home')),)

USE_I18N = True
LANGUAGE_CODE = 'pl'
LANGUAGES = (
    ('pl', gettext('Polski')),)
    #('en', gettext('English')),)

TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.auth',
    'django.core.context_processors.debug',
    'django.core.context_processors.i18n',
    'django.core.context_processors.media',
    'django.core.context_processors.request',
    'cms.context_processors.media',)



MIDDLEWARE_CLASSES = (
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.gzip.GZipMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.middleware.doc.XViewMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',)
    #'cms.middleware.multilingual.MultilingualURLMiddleware',)

ROOT_URLCONF = 'webapp.urls'
CMS_USE_TINYMCE = True
TEMPLATE_DIRS = ( "%s/templates" % APPLICATION_ROOT )
CMS_CONTENT_CACHE_DURATION = 0

TINYMCE_DEFAULT_CONFIG = {
    'theme': 'advanced',
    'width': '100%',
    'theme_advanced_font_sizes' : '18,20',
    'height' : '300',
    'mode' : "textareas",
    'theme_advanced_toolbar_location' : "top",
    'theme_advanced_toolbar_align' : "left",
    'theme_advanced_buttons1' : "formatselect,bold,italic,underline,strikethrough,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,undo,redo,separator,link,unlink,separator,image,cleanup,separator,code",
    'theme_advanced_buttons2' : "",
    'theme_advanced_buttons3' : "",
    'relative_urls': False
}

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.admin',
    'django.contrib.sites',
    'reversion',
    'tinymce',
    'cms',
    'cms.plugins.text',
    'cms.plugins.picture',
    'cms.plugins.link',
    'cms.plugins.file',
    'cms.plugins.snippet',
    'cms.plugins.googlemap',
    'mptt',
    'publisher',)
