from django.urls import path

from channels.routing import ProtocolTypeRouter, URLRouter
from dotenv import load_dotenv
load_dotenv()

application = ProtocolTypeRouter({})
