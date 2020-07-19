from rest_framework import serializer
from rest_framework import Tour
from aplikacija.models import Tour

class TourSerializer(Serializers.ModelSerializer):

    class Meta:

        model = Tour
        fields = ('destination','country','date_of_arrival','total_days','price','available_beds','description')
        
