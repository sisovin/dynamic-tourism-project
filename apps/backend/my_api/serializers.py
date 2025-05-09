from rest_framework import serializers
from .models import Destination

class DestinationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Destination
        fields = [
            'id', 'title', 'description', 'location', 'price', 'images', 'rating',
            'created_at', 'updated_at', 'calculate_average_rating', 'is_featured'
        ]

    def get_calculate_average_rating(self, obj):
        return obj.calculate_average_rating()

    def get_is_featured(self, obj):
        return obj.is_featured()
