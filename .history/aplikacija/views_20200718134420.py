from django.shortcuts import render
from aplikacija.models import Tour,Client,ContactMessage
from django.views.generic import ListView,DetailView,TemplateView,CreateView
from aplikacija.forms import ClientForm,ContactForm


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
                client.generate_reservation_code()
                client.save()
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

    return render(request,'aplikacija/reservations.html')

def checkReservationView(request):

    form = ClientForm()
    return render(request,'aplikacija/checkReservation.html',{'form':form})    

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
    
