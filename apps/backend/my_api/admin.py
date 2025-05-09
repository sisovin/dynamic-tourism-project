from django.contrib import admin
from .models import Destination

@admin.register(Destination)
class DestinationAdmin(admin.ModelAdmin):
    list_display = ('title', 'location', 'price', 'rating', 'created_at', 'updated_at')
    search_fields = ('title', 'location')
    list_filter = ('location', 'rating')
