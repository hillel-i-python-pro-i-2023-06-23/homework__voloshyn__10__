# urls.py
from django.urls import path
from .views import UserGeneratorView

urlpatterns = [
    path("generate/", UserGeneratorView.as_view(), name="generate_users"),
]
