from django.urls import path

from polznak_entities import views

urlpatterns = [
    path('likes/', views.LikesView.as_view()),
    path('posts/', views.PostView.as_view()),
    path('messages/chat_list', views.ChatListView.as_view()),
    path('messages/chat/<int:chat_id>', views.ChatView.as_view()),
    path('register/', views.RegisterView.as_view()),
]
