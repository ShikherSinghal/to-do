from rest_framework import serializers
from .models import ToDoItems

class ToDoItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = ToDoItems
        fields = '__all__'

