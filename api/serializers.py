from rest_framework import serializers
from aplikacija.models import Tour,Client
from django.db import transaction

class TourSerializer(serializers.ModelSerializer):
    
    class Meta:

        model = Tour
        fields = ('pk','destination','country','date_of_arrival','total_days','price','available_beds','description')


class ClientSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Client
        fields = ('name','surname','email','number_of_guests','tour')

    def create(self,validated_data):
        
        print(validated_data)
        with transaction.atomic():
                number_of_guests = validated_data["number_of_guests"]
                tour=Tour.objects.select_for_update().filter(pk=validated_data['tour'])[0]
                beds_available = tour.check_if_requested_beds_are_avaliable(number_of_guests)
                if beds_available:
                    tour.set_new_number_of_beds(number_of_guests)
                    tour.update_confirmed_reservations(number_of_guests)
                    tour.save()
                    new_client = Client.objects.create(**validated_data)
                    reservation_code =new_client.generate_reservation_code()
                    total_price = new_client.get_total_price()
                    email = validated_data['email']
                    email_message = f'Thank you {validated_data["name"]} {validated_data["surname"]} for booking your trip to {validated_data["tour"]}\n\n Here are the details:\n Reservation Code : {reservation_code}\nNumber of guests: {validated_data["number_of_guests"]}\nTotal Price: {total_price}\nDate of arrival: {validated_data["tour"]}\n\nBest regards,\n GLOBE TOURS'
                    try:
                        send_mail(f'Globe tour reservation to {tour_name}',email_message,settings.EMAIL_HOST_USER,[email,],fail_silently=False)
                    except:
                        return "INVALID EMAIL ADDRESS"
                    return {'success':'ok','new_client':new_client}
                else:
                    return {'error':'not enough beds available'}