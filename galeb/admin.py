from django.contrib import admin
from . models import AdminOvlasti,AdminRadnje,Dobavljac,InstaliraniProgrami,Komponenete,Konfiguracija,Korisnik,\
                     Nabava,Odjel,OrganizacijskaJedinica,Programi,Prostorija,Uredaj,Zahtjev,Zgrada

# Register your models here.

admin.site.register(AdminOvlasti)
admin.site.register(AdminRadnje)
admin.site.register(Dobavljac)
admin.site.register(Komponenete)
admin.site.register(Konfiguracija)
admin.site.register(Korisnik)
admin.site.register(Nabava)
admin.site.register(Odjel)
admin.site.register(OrganizacijskaJedinica)
admin.site.register(Programi)
admin.site.register(InstaliraniProgrami)
admin.site.register(Prostorija)
admin.site.register(Uredaj)
admin.site.register(Zahtjev)
admin.site.register(Zgrada)
