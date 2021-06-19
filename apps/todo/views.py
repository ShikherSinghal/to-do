from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.generics import CreateAPIView
from .models import ToDoItems
from .serializers import ToDoItemSerializer

# Create your views here.
class AddToDo(CreateAPIView):
	queryset = ToDoItems.objects.all()
	serializer_class = ToDoItemSerializer

	def create(self, request, *args, **kwargs):
		super().create(request, *args, **kwargs)
		return Response(status=status.HTTP_200_OK)


class GetToDo(APIView):
	def get(self, request, *args, **kwargs):
		item_list = ToDoItems.objects.all()
		response = []
		for item in item_list:
			response.append(item.title)
		return Response(response, status=status.HTTP_200_OK)
