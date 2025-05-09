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

class ModelName(models.Model):
    field1 = models.CharField(max_length=255)
    field2 = models.IntegerField()
    field3 = models.DateField()
    relationship_field = models.ForeignKey(Destination, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def method1(self):
        """
        Example method for ModelName.
        """
        return f"Method1 result for {self.field1}"

    def clean(self):
        """
        Example validation for ModelName.
        """
        if self.field2 < 0:
            raise ValidationError('field2 must be a positive integer.')

    def __str__(self):
        return self.field1

    class Meta:
        verbose_name = "ModelName"
        verbose_name_plural = "ModelNames"
