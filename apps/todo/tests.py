from django.test import TestCase

# Create your tests here.
from .models import ToDoItems

class ToDoItemCase(TestCase):
    def setUp(self):
        ToDoItems.objects.create(title="test 1")
        ToDoItems.objects.create(title="test 2")

    def test_to_do_created(self):
        test_1 = ToDoItems.objects.get(title="test 1")
        test_2 = AnToDoItemsimal.objects.get(title="test 2")
        self.assertEqual(len(test_1), 5)
        self.assertEqual(len(test_1), 5)
