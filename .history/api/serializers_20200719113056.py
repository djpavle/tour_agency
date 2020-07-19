from rest_framework import serializers
from rest_framework import aplikacija.models.Tour
from aplikacija.models import Tour

class TourSerializer(serializers.ModelSerializer):
    class Meta:

        model = Tour
        fields = ('destination','country','date_of_arrival','total_days','price','available_beds','description')

