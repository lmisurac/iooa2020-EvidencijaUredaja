# Generated by Django 3.0.5 on 2020-06-04 19:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('galeb', '0004_auto_20200604_2111'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='komponente',
            options={'managed': False, 'verbose_name_plural': 'Komponente'},
        ),
        migrations.AlterModelOptions(
            name='konfiguracija',
            options={'managed': False, 'verbose_name_plural': 'Konfiguracije'},
        ),
        migrations.AlterModelTable(
            name='komponente',
            table='komponente',
        ),
    ]
