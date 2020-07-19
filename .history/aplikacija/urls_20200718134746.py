from django.urls import path
from aplikacija import views
from django.conf.urls import url

urlpatterns = [
    path("", views.HomeView,name='home'),
    url(r'^tour/(?P<pk>\d+)$',views.TourDetailView.as_view(),name='tour_detail'),
    path("tourlist/",views.TourListView.as_view(),name='tour_list'),
    path("booktour/",views.CreateClientView.as_view(),name="book_tour"),
    path("contact/",views.contactView.as_view(),name="contact"),
    path("thanks/",views.thanksView,name='thanks'),
    path("reservations/",views.reservationView,name='reservations'),
    path("checkReservation/",views.checkReservationView,name='check_reservation'),
    path("reservations/<string:code>",views.ReservationDetailView.as_view(),name='reservation_details')
    
]