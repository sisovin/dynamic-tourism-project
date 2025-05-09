from django.urls import path
from .views import HelloWorldView, DestinationListCreateView, DestinationRetrieveUpdateDestroyView, UserCreateView, UserLoginView, UserRefreshTokenView, ModelNameListCreateView, ModelNameRetrieveUpdateDestroyView

urlpatterns = [
    path('hello/', HelloWorldView.as_view(), name='hello_world'),
    path('destinations/', DestinationListCreateView.as_view(), name='destination_list_create'),
    path('destinations/<int:pk>/', DestinationRetrieveUpdateDestroyView.as_view(), name='destination_detail'),
    path('auth/register/', UserCreateView.as_view(), name='user_register'),
    path('auth/login/', UserLoginView.as_view(), name='user_login'),
    path('auth/refresh/', UserRefreshTokenView.as_view(), name='token_refresh'),
    path('modelname/', ModelNameListCreateView.as_view(), name='modelname_list_create'),
    path('modelname/<int:pk>/', ModelNameRetrieveUpdateDestroyView.as_view(), name='modelname_detail'),
]
