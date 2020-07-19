from django.urls import path
from api import views

urlpatterns=[

    path('tours/',views.TourListView.as_view(),name='tour_list')
]