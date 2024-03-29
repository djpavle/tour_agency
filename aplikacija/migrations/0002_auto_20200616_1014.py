# Generated by Django 3.0.6 on 2020-06-16 08:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplikacija', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='client',
            name='wishlist',
            field=models.ManyToManyField(related_name='wishlist', to='aplikacija.Tour'),
        ),
        migrations.AddField(
            model_name='tour',
            name='photo',
            field=models.ImageField(default='photos/def.jpg', upload_to='photos'),
        ),
    ]
