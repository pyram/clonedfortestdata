#
# Copyright 2009 by Neubloc, LLC. All rights reserved. 
# Author: Marcin Mierzejewski
#

from django.conf.urls.defaults import *
from django.contrib import admin
from webapp.settings import APPLICATION_ROOT

admin.autodiscover()

urlpatterns = patterns('',
    # Media files (CSS, JavaScripts, Images)
    (r'^site_media/(?P<path>.*)$', 'django.views.static.serve', \
        {'document_root': '%s/site_media' % APPLICATION_ROOT}),
        
    # PDF files for Flash splash on home page
    (r'^pdf/(?P<path>.*)$', 'django.views.static.serve', \
        {'document_root': '%s/site_media/pdf' % APPLICATION_ROOT}),        

    # Admin Site
    (r'^admin/', include(admin.site.urls)),
    (r'^tinymce/', include('tinymce.urls')),
    (r'^', include('cms.urls')),
)
