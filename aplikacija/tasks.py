from celery import shared_task
from django.core.mail import send_mail


@shared_task
def send_email_confirmaiton(tour, email_message, email_list, host):
    send_mail(f'Globe tour reservation to {tour}',
              email_message, host, email_list, fail_silently=False)
