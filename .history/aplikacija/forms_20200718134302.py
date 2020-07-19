from aplikacija.models import Client,ContactMessage
from django import forms

class ClientForm(forms.ModelForm):

    class Meta:

        model = Client
        fields = ('name','surname','email','number_of_guests','tour')
        widgets = { 'name' : forms.TextInput(attrs={"class":"clientFormField"}),
                    'surname' : forms.TextInput(attrs={"class":"clientFormField"}),
                    'email' : forms.TextInput(attrs={"class":"clientFormField"}),
                    'number_of_guests' : forms.NumberInput(attrs={"class":"clientFormField"}),
                    
                  
        }

class ContactForm(forms.ModelForm):


    class Meta:

        model = ContactMessage
        fields= ('sender','title','body')

        widgets = {
            'sender': forms.TextInput(attrs={'class': 'clientFormField'}),
            'title': forms.TextInput(attrs={'class': 'clientFormField'}),
             'body': forms.Textarea(attrs={'class': 'clientTextField'}),
        }


class ReservationForm(forms.ModelForm):

    class Meta:

        model = Client
        fields = ('reservation_code')
        widgets = {
            'reservation_code':forms.TextInput(attrs={'class':'clientFormField'})
        }