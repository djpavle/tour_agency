from django.urls import path
from api import views

urlpatterns=[

    path('tours/',views.TourListView.as_view()),
    path('clients/',views.NewClientView.as_view(),)
]