from django.contrib import admin
from .models import Destination, ModelName

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
