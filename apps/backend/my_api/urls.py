from django.urls import path
from .views import HelloWorldView, DestinationListCreateView, DestinationRetrieveUpdateDestroyView, UserCreateView, UserLoginView, UserRefreshTokenView, ModelNameListCreateView, ModelNameRetrieveUpdateDestroyView, FunctionalityView, BookingListCreateView, BookingRetrieveUpdateDestroyView, BlogListCreateView, BlogRetrieveUpdateDestroyView, TestimonialListCreateView, TestimonialRetrieveUpdateDestroyView, GuideListCreateView, GuideRetrieveUpdateDestroyView, ContactListCreateView, ContactRetrieveUpdateDestroyView

urlpatterns = [
    path('hello/', HelloWorldView.as_view(), name='hello_world'),
    path('destinations/', DestinationListCreateView.as_view(), name='destination_list_create'),
    path('destinations/<int:pk>/', DestinationRetrieveUpdateDestroyView.as_view(), name='destination_detail'),
    path('auth/register/', UserCreateView.as_view(), name='user_register'),
    path('auth/login/', UserLoginView.as_view(), name='user_login'),
    path('auth/refresh/', UserRefreshTokenView.as_view(), name='token_refresh'),
    path('modelname/', ModelNameListCreateView.as_view(), name='modelname_list_create'),
    path('modelname/<int:pk>/', ModelNameRetrieveUpdateDestroyView.as_view(), name='modelname_detail'),
    path('functionality/', FunctionalityView.as_view(), name='functionality'),
    path('bookings/', BookingListCreateView.as_view(), name='booking_list_create'),
    path('bookings/<int:pk>/', BookingRetrieveUpdateDestroyView.as_view(), name='booking_detail'),
    path('blogs/', BlogListCreateView.as_view(), name='blog_list_create'),
    path('blogs/<int:pk>/', BlogRetrieveUpdateDestroyView.as_view(), name='blog_detail'),
    path('testimonials/', TestimonialListCreateView.as_view(), name='testimonial_list_create'),
    path('testimonials/<int:pk>/', TestimonialRetrieveUpdateDestroyView.as_view(), name='testimonial_detail'),
    path('guides/', GuideListCreateView.as_view(), name='guide_list_create'),
    path('guides/<int:pk>/', GuideRetrieveUpdateDestroyView.as_view(), name='guide_detail'),
    path('contacts/', ContactListCreateView.as_view(), name='contact_list_create'),
    path('contacts/<int:pk>/', ContactRetrieveUpdateDestroyView.as_view(), name='contact_detail'),
]
