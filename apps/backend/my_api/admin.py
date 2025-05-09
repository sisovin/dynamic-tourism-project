from django.contrib import admin
from .models import Destination, ModelName, Booking, Blog, Testimonial, Guide, Contact

@admin.register(Destination)
class DestinationAdmin(admin.ModelAdmin):
    list_display = ('title', 'location', 'price', 'rating', 'created_at', 'updated_at')
    search_fields = ('title', 'location')
    list_filter = ('location', 'rating')

@admin.register(ModelName)
class ModelNameAdmin(admin.ModelAdmin):
    list_display = ('field1', 'field2', 'field3', 'relationship_field', 'created_at', 'updated_at')
    search_fields = ('field1',)
    list_filter = ('created_at', 'updated_at')

@admin.register(Booking)
class BookingAdmin(admin.ModelAdmin):
    list_display = ('user', 'destination', 'start_date', 'end_date', 'payment_status', 'created_at', 'updated_at')
    search_fields = ('user__username', 'destination__title')
    list_filter = ('payment_status', 'created_at', 'updated_at')

@admin.register(Blog)
class BlogAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'created_at', 'updated_at')
    search_fields = ('title', 'author')
    list_filter = ('created_at', 'updated_at')

@admin.register(Testimonial)
class TestimonialAdmin(admin.ModelAdmin):
    list_display = ('customer_name', 'rating', 'created_at', 'updated_at')
    search_fields = ('customer_name',)
    list_filter = ('rating', 'created_at', 'updated_at')

@admin.register(Guide)
class GuideAdmin(admin.ModelAdmin):
    list_display = ('name', 'created_at', 'updated_at')
    search_fields = ('name',)
    list_filter = ('created_at', 'updated_at')

@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'created_at', 'updated_at')
    search_fields = ('name', 'email')
    list_filter = ('created_at', 'updated_at')
