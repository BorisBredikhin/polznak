from django.urls import path

from recommendations import views

urlpatterns = [
    path('personal/', views.PersonalRecommendations.as_view()),
]
