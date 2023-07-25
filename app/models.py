from django.db import models


class CustomUser(models.Model):
    login = models.CharField(max_length=100, unique=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
