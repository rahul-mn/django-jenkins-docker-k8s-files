from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='resume-home'),
    path('about/', views.about, name='resume-about'),
]