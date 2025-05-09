from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, generics
from .models import Destination, ModelName
from .serializers import DestinationSerializer, UserSerializer, ModelNameSerializer
from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from django_ratelimit.decorators import ratelimit
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from rest_framework.pagination import PageNumberPagination
from asgiref.sync import sync_to_async
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import OrderingFilter

class HelloWorldView(APIView):
    def get(self, request):
        return Response({"message": "Hello, world!"}, status=status.HTTP_200_OK)

class DestinationListCreateView(generics.ListCreateAPIView):
    queryset = Destination.objects.select_related().all()
    serializer_class = DestinationSerializer
    pagination_class = PageNumberPagination

    @method_decorator(cache_page(60*15))
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)

    async def perform_create(self, serializer):
        await sync_to_async(serializer.save)()

class DestinationRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Destination.objects.select_related().all()
    serializer_class = DestinationSerializer

class UserCreateView(generics.CreateAPIView):
    serializer_class = UserSerializer

class UserLoginView(APIView):
    @ratelimit(key='ip', rate='5/m', method='POST', block=True)
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')
        user = authenticate(request, email=email, password=password)
        if user is not None:
            refresh = RefreshToken.for_user(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
            })
        return Response({'error': 'Invalid credentials'}, status=status.HTTP_401_UNAUTHORIZED)

class UserRefreshTokenView(APIView):
    def post(self, request):
        refresh_token = request.data.get('refresh')
        try:
            refresh = RefreshToken(refresh_token)
            data = {
                'access': str(refresh.access_token),
            }
            return Response(data)
        except Exception as e:
            return Response({'error': 'Invalid refresh token'}, status=status.HTTP_400_BAD_REQUEST)

class ModelNameListCreateView(generics.ListCreateAPIView):
    queryset = ModelName.objects.select_related().all()
    serializer_class = ModelNameSerializer
    pagination_class = PageNumberPagination

    @method_decorator(cache_page(60*15))
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)

    async def perform_create(self, serializer):
        await sync_to_async(serializer.save)()

class ModelNameRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = ModelName.objects.select_related().all()
    serializer_class = ModelNameSerializer

class FunctionalityView(generics.ListCreateAPIView):
    queryset = ModelName.objects.all()
    serializer_class = ModelNameSerializer
    permission_classes = [IsAuthenticated]
    pagination_class = PageNumberPagination
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_fields = ['field1', 'field2']
    ordering_fields = ['field1', 'field2']

    def get_queryset(self):
        queryset = super().get_queryset()
        field1 = self.request.query_params.get('field1')
        if field1:
            queryset = queryset.filter(field1=field1)
        return queryset
