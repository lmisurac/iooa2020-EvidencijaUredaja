# Generated by Django 3.0.5 on 2020-06-07 17:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('galeb', '0005_auto_20200604_2112'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='adminovlasti',
            options={'managed': False, 'ordering': ['-datum_kreiranja'], 'verbose_name_plural': 'Adminovlasti'},
        ),
        migrations.AlterModelOptions(
            name='adminradnje',
            options={'managed': False, 'ordering': ['-datum'], 'verbose_name_plural': 'Aminradnje'},
        ),
        migrations.AlterModelOptions(
            name='nabava',
            options={'managed': False, 'ordering': ['-datum'], 'verbose_name_plural': 'Nabave'},
        ),
    ]
