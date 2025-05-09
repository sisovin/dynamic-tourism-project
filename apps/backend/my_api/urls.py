from django.urls import path
from .views import HelloWorldView, DestinationListCreateView, DestinationRetrieveUpdateDestroyView

urlpatterns = [
    path('hello/', HelloWorldView.as_view(), name='hello_world'),
    path('destinations/', DestinationListCreateView.as_view(), name='destination_list_create'),
    path('destinations/<int:pk>/', DestinationRetrieveUpdateDestroyView.as_view(), name='destination_detail'),
]
