from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from aplikacija.models import Tour
from .serializers import TourSerializer,ClientSerializer


class TourListView(APIView):

    def get(self,request):

        """Returns all available tours """

        tours = Tour.objects.all()
        serializer = TourSerializer(tours,many=True)
        return Response(serializer.data)

class NewClientView(APIView):

    def post(self,request):

        """Create a new tour reservation """

        serializer = ClientSerializer(data=request.data)
        if serializer.is_valid():
            name = serializer.data.get('name')
            surname = serializer.data.get('surname')
            email = serializer.data.get('email')
            number_of_guests = serializer.data.get('number_of_guests')
            tour = serializer.data.get('tour')
            return Response(ClientSerializer.create(request.validated_data))
        else:
            return Response({'error':'invalid data'})