"""autofaq URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
# from filesbrowser.sites import site
from faq.views import vote_knn, vote_random_forest, vote_cosine_distance, FaqView, QuestionsApiView, FaqViewSet, RandomForecastViewSet, ReloadAppViewSet
from rest_framework.authtoken import views
from faq.admin import s7_admin_site

urlpatterns = [
    path('admin/', admin.site.urls, name='admin'),
    # path('admin/filebrowser/', site.urls, name='filebrowser'),
    path('vote_knn/', vote_knn, name='vote-knn'),
    path('vote_random_forest/', vote_random_forest, name='vote-random-forest'),
    path('vote_cosine_distance/', vote_cosine_distance, name='vote-cosine-distance'),
    path('faq/', FaqView.as_view(), name='faq-view'),
    path('api/questions/', QuestionsApiView.as_view(), name='api-questions'),
    path('api/random_forecast/', RandomForecastViewSet.as_view(), name='api-random-forecasts'),
    path('api/questions/add/', FaqViewSet.as_view(), name='api-questions-add'),
    path('api-token-auth/', views.obtain_auth_token),
    path('admin/s7', s7_admin_site.urls),
    path('api/reload/', ReloadAppViewSet.as_view()),
]
