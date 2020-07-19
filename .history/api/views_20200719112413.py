from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from aplikacija.models import Tour
from .serializers import TourSerializer

class TourList(APIView):

    def get(self,request):

        tours = Tour.objects.all()
        serializer = TourSerializer(tours,many=True)
        return Response(serializer.data)
