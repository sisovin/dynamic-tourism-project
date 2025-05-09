from rest_framework import serializers
from ..models import Booking

class BookingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Booking
        fields = ['id', 'user', 'destination', 'start_date', 'end_date', 'payment_status', 'created_at', 'updated_at']
