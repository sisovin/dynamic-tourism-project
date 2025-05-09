from rest_framework import serializers
from .models import Destination
from django.contrib.auth.models import User
from argon2 import PasswordHasher

class DestinationSerializer(serializers.ModelSerializer):
    calculate_average_rating = serializers.SerializerMethodField()
    is_featured = serializers.SerializerMethodField()

    class Meta:
        model = Destination
        fields = [
            'id', 'title', 'description', 'location', 'price', 'images', 'rating',
            'calculate_average_rating', 'is_featured'
        ]

    def get_calculate_average_rating(self, obj):
        return obj.calculate_average_rating()

    def get_is_featured(self, obj):
        return obj.is_featured()

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'email', 'password']

    def create(self, validated_data):
        user = User(
            email=validated_data['email']
        )
        user.set_password(validated_data['password'])
        user.save()
        return user
