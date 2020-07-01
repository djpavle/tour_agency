from django.db import models
from django.urls import reverse

class  Tour(models.Model):

    destination = models.CharField(max_length=256)
    country = models.CharField(max_length=256)
    date_of_arrival = models.DateField()
    total_days = models.IntegerField()
    price = models.DecimalField(decimal_places=2,max_digits=6)
    available_beds = models.IntegerField()
    photo = models.ImageField(upload_to='photos',default='photos/def.png')
    description = models.TextField(blank=True)

    def set_new_number_of_beds(self,number_of_guests):

        self.available_beds -= number_of_guests
        return self.available_beds

    def __str__(self):

        return f'{self.destination} , {self.country} , {self.total_days} days for $ {self.price}'

class Client(models.Model):

    name = models.CharField(max_length=256)
    surname = models.CharField(max_length=256)
    email = models.CharField(max_length=256)
    number_of_guests =models.IntegerField()
    tour = models.ForeignKey(Tour,on_delete=models.CASCADE)
    total_price = models.DecimalField(decimal_places=2,max_digits=6,default=0)


    def get_total_price(self):

        return self.number_of_guests * self.tour.price 


    def get_absolute_url(self):

        return reverse('tour_list')

    def __str__(self):

        return f'{self.name} {self.surname}, {self.tour}'


class ContactMessage(models.Model):

    sender=models.EmailField()
    title=models.CharField(max_length=256)
    body =models.TextField()