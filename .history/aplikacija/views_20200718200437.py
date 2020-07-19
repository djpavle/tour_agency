from django.shortcuts import render,get_object_or_404
from aplikacija.models import Tour,Client,ContactMessage
from django.views.generic import ListView,DetailView,TemplateView,CreateView
from django.core.mail import send_mail
from aplikacija.forms import ClientForm,ContactForm,ReservationForm


def HomeView(request):

    top_three_destinations = Tour.objects.filter(confirmed_reservations__gte=2).order_by('-confirmed_reservations')[:3]
    if request.method=="GET":
        return render(request,'aplikacija/home.html',{'top_three':top_three_destinations})
    else:
        form= ClientForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            surname=form.cleaned_data['surname']
            email=form.cleaned_data['email']
            tour_id=form.cleaned_data['tour'].pk
            number_of_guests=form.cleaned_data['number_of_guests']
            total_price=number_of_guests*form.cleaned_data['tour'].price
            tour_name=form.cleaned_data['tour'].destination
            tour=Tour.objects.get(destination=tour_name)
            beds_available = tour.check_if_requested_beds_are_avaliable(number_of_guests)
            if beds_available:
                tour.set_new_number_of_beds(number_of_guests)
                tour.update_confirmed_reservations(number_of_guests)
                tour.save()
                client = Client.objects.create(name=name,surname=surname,email=email,number_of_guests=number_of_guests,tour_id=tour_id,total_price=total_price)
                reservation_code = client.generate_reservation_code()
                client.save()
                email_message = f'Thank you {name} {surname} for booking your trip to {tour_name}\n\n Here are the details:\n Reservation Code : {reservation_code}'
                send_mail(f'Globe tour reservation to {tour_name}',email_message,'globetours011@gmail.com')
                message =f'thank you {name} ! Your reservation to {tour} for {number_of_guests} guests , with a total price of {total_price} has been booked successfully.'
                return render(request,'aplikacija/home.html',{'msg':message,'top_three':top_three_destinations})
            else:
                form = ClientForm()
                return render(request,'aplikacija/client_form.html',{'infoMsg':f"sorry, there are less than {number_of_guests} beds available for {tour_name}",'form':form})
            


def thanksView(request):

    form=ContactForm(request.POST)
    if form.is_valid():
        sender=form.cleaned_data['sender']
        title=form.cleaned_data['title']
        body=form.cleaned_data['body']
        message=ContactMessage.objects.create(sender=sender,title=title,body=body)
        message.save()
        return render(request,'aplikacija/thanks.html')
    else:
        form = ContactForm()
        return render(request,'aplikacija/contactmessage_form.html',{'form':form,'infoMsg':"please enter a valid email address"})

def reservationView(request):

    if request.method == "GET":
        return render(request,'aplikacija/reservations.html')
    else:
        form = ReservationForm(request.POST)
        if form.is_valid():
            code = form.cleaned_data['reservation_code']
            #IZ NEKOG RAZLOGA NE PRIHVATA VALIDNE KODOVE, A ZA NEVALIDNE VRACA DoesNotExist error
            try:
                client = Client.objects.filter(reservation_code=code)
                tour = client.tour.destination
                client.delete()
                return render(request,'aplikacija/reservations.html',{'infoMsg':f'You have successfully cancelled your trip to {tour}'})
            except:
                form = ReservationForm()
                return render(request,'aplikacija/cancelReservation.html',{'form':form,'infoMsg':'INVALID RESERVATION CODE'})
            
        else:
            form = ReservationForm()
            return render(request,'aplikacija/cancelReservation.html',{'form':form,'infoMsg':'FORM INVALID'})

def checkReservationView(request):

    form = ReservationForm()
    return render(request,'aplikacija/checkReservation.html',{'form':form})

def cancelReservationView(request):

    form = ReservationForm()
    return render(request,'aplikacija/cancelReservation.html',{'form':form})    

def reservationDetailView(request):

    form = ReservationForm(request.POST)
    if form.is_valid():
        code = form.cleaned_data['reservation_code']
        #IZ NEKOG RAZLOGA NE PRIHVATA VALIDNE KODOVE, A ZA NEVALIDNE VRACA DoesNotExist error
        try:
            client = Client.objects.get(reservation_code=code)
            return render(request,'aplikacija/detailedReservation.html',{'client':client})
        except:
            form = ReservationForm()
            return render(request,'aplikacija/checkReservation.html',{'form':form,'infoMsg':'INVALID RESERVATION CODE'})
            
    else:
        form = ReservationForm()
        return render(request,'aplikacija/checkReservation.html',{'form':form,'infoMsg':'FORM INVALID'})

class TourListView(ListView):

    model = Tour

    def get_queryset(self):

        return Tour.objects.all()


class TourDetailView(DetailView):

    model = Tour

class CreateClientView(CreateView):

    redirect_field_name = "/aplikacija/home.html"
    model = Client
    form_class = ClientForm


class contactView(CreateView):

    redirect_field_name="/aplikacija/thanks.html"
    model = ContactMessage
    form_class=ContactForm
    
