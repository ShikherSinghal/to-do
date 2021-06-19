from django.contrib import admin, messages
from .models import ToDoItems

# Register your models here.


class ToDoAdmin(admin.ModelAdmin):
    list_display = ('title', 'created')


admin.site.register(ToDoItems,ToDoAdmin)
