from django.db import models
from django.utils import timezone
# Create your models here.

class ToDoItems(models.Model):
    title = models.CharField(max_length=50)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
