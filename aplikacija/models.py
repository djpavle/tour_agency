from django.db import models
from django.urls import reverse
import random

class  Tour(models.Model):

    destination = models.CharField(max_length=256)
    country = models.CharField(max_length=256)
    date_of_arrival = models.DateField()
    total_days = models.IntegerField()
    price = models.DecimalField(decimal_places=2,max_digits=15)
    available_beds = models.IntegerField()
    photo = models.ImageField(upload_to='photos',default='photos/def.png')
    description = models.TextField(blank=True)
    confirmed_reservations = models.IntegerField(default=0)

    def set_new_number_of_beds(self,number_of_guests):

        self.available_beds -= number_of_guests
        return self.available_beds

    def cancel_reservation(self,number_of_guests):

        self.available_beds+=number_of_guests
        self.confirmed_reservations-=number_of_guests

    def update_confirmed_reservations(self,number_of_guests):

        self.confirmed_reservations+= number_of_guests

    def check_if_requested_beds_are_avaliable(self,numb_of_guests):

        if self.available_beds < numb_of_guests:
            return False
        else:
            return True


    def __str__(self):

        return f'{self.destination} , {self.country} , {self.total_days} days for $ {self.price}'

class Client(models.Model):

    name = models.CharField(max_length=256)
    surname = models.CharField(max_length=256)
    email = models.CharField(max_length=256)
    number_of_guests =models.IntegerField()
    tour = models.ForeignKey(Tour,on_delete=models.CASCADE)
    total_price = models.DecimalField(decimal_places=2,max_digits=15,default=0)
    reservation_code = models.CharField(max_length=50,unique=True)


    def get_total_price(self):

        return self.number_of_guests * self.tour.price 

    def generate_reservation_code(self):
        
        chars =['1','2','3','4','5','6','7','8','9','0','A','a','B','b','C','c','D','d','E','e','F','f','G','g','H','h','I','i','J','j','K','k','L','l','M','m']
        self.reservation_code ="".join(random.sample(chars,10))
        return self.reservation_code

    def get_absolute_url(self):

        return reverse('tour_list')

    def __str__(self):

        return f'{self.name} {self.surname}, {self.tour}'


class ContactMessage(models.Model):

    sender=models.EmailField()
    title=models.CharField(max_length=256)
    body =models.TextField()
