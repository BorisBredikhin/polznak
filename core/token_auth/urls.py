from django.urls import path

from token_auth import views

urlpatterns = [
    path('login/', views.login),
    path('register/', views.register),
]
