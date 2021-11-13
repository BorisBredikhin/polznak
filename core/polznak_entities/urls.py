from django.urls import path

from polznak_entities import views

urlpatterns = [
    path('likes/', views.LikesView.as_view()),
    path('posts/', views.PostView.as_view()),
    path('register/', views.RegisterView.as_view()),
]
