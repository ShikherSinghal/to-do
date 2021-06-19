from django.urls import path
from . import views

urlpatterns = [
    path('get_list/', views.GetToDo.as_view(), name='todo_list'),
    path('add_todo/', views.AddToDo.as_view(), name='add_todo'),
]
