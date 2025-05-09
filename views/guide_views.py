from rest_framework import generics
from ..models import Guide
from ..serializers.guide_serializer import GuideSerializer

class GuideListCreateView(generics.ListCreateAPIView):
    queryset = Guide.objects.all()
    serializer_class = GuideSerializer

class GuideRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Guide.objects.all()
    serializer_class = GuideSerializer
