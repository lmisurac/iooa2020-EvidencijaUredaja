# Generated by Django 3.0.5 on 2020-06-04 19:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('galeb', '0002_auto_20200604_1449'),
    ]

    operations = [
        migrations.CreateModel(
            name='Komponente',
            fields=[
                ('id_komponente', models.AutoField(primary_key=True, serialize=False)),
                ('vrsta', models.CharField(blank=True, max_length=45, null=True)),
                ('proizvodac', models.CharField(blank=True, max_length=45, null=True)),
                ('model', models.CharField(blank=True, max_length=45, null=True)),
                ('opis', models.CharField(blank=True, max_length=250, null=True)),
            ],
            options={
                'verbose_name_plural': 'Komponenete',
                'db_table': 'komponenete',
                'managed': False,
            },
        ),
        migrations.DeleteModel(
            name='Komponenete',
        ),
    ]
