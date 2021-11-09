from django.urls import path

from polznak_entities import views

urlpatterns = [
    path('posts/', views.PostView.as_view()),
    path('register/', views.RegisterView.as_view()),
]
