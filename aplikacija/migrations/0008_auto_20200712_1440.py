# Generated by Django 3.0.7 on 2020-07-12 12:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplikacija', '0007_contactmessage'),
    ]

    operations = [
        migrations.AlterField(
            model_name='client',
            name='total_price',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=15),
        ),
        migrations.AlterField(
            model_name='tour',
            name='price',
            field=models.DecimalField(decimal_places=2, max_digits=15),
        ),
    ]