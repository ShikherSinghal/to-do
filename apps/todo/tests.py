from django.test import TestCase

# Create your tests here.
from .models import ToDoItems

class ToDoItemCase(TestCase):
    def setUp(self):
        ToDoItems.objects.create(title="test1")
        ToDoItems.objects.create(title="test2")

    def test_to_do_created(self):
        test_1 = ToDoItems.objects.get(title="test1")
        test_2 = ToDoItems.objects.get(title="test2")
        self.assertEqual(len(test_1.title), 5)
        self.assertEqual(len(test_2.title), 5)
