from django_filters import rest_framework as filters
from ..models import Destination

class DestinationFilter(filters.FilterSet):
    location = filters.CharFilter(field_name='location', lookup_expr='iexact')
    rating = filters.NumberFilter(field_name='rating', lookup_expr='gte')

    class Meta:
        model = Destination
        fields = ['location', 'rating']
