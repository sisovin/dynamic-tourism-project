from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.contrib.postgres.fields import ArrayField

class Destination(models.Model):
    CONTINENT_CHOICES = [
        ('AF', 'Africa'),
        ('AN', 'Antarctica'),
        ('AS', 'Asia'),
        ('EU', 'Europe'),
        ('NA', 'North America'),
        ('OC', 'Oceania'),
        ('SA', 'South America'),
    ]

    title = models.CharField(max_length=255)
    description = models.TextField()
    location = models.CharField(max_length=2, choices=CONTINENT_CHOICES)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    images = ArrayField(models.URLField())
    rating = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(5)])
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def calculate_average_rating(self):
        """
        Calculate the average rating of the destination.
        """
        return self.rating

    def is_featured(self):
        """
        Determine if the destination is featured.
        """
        return self.rating >= 4.5

    @classmethod
    def filter_by_location(cls, location):
        """
        Filter destinations by location.
        """
        return cls.objects.filter(location=location)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Destination"
        verbose_name_plural = "Destinations"
