from django.urls import path
from rest_framework.authtoken import views
from .views import *

urlpatterns = [
    path('token-auth/', views.obtain_auth_token),
    path("signin/", Register.as_view()),
    path("credential/", Login.as_view()),
]