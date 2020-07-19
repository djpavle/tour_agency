
from django.contrib import admin
from django.urls import path,include
from django.conf.urls.static import static
from django.conf import settings
from rest_framework.urlpatterns import format_suffix_patterns
from api import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('aplikacija.urls')),
    path('api/',include('api.urls'))
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
