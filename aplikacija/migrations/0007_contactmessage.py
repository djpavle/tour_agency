# Generated by Django 3.0.6 on 2020-06-22 12:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplikacija', '0006_auto_20200622_1319'),
    ]

    operations = [
        migrations.CreateModel(
            name='ContactMessage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sender', models.EmailField(max_length=254)),
                ('title', models.CharField(max_length=256)),
                ('body', models.TextField()),
            ],
        ),
    ]
