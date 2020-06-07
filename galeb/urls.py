from django.urls import path

from . import views
from . views import (
ZahtjevListView,ZahtjevDetailView,ZahtjevCreateView,ZahtjevUpdateView,ZahtjevDeleteView,
AdminRadnjeCreateView,AdminRadnjeUpdateView,AdminRadnjeDetailView,AdminRadnjeDeleteView,
ZgradaListView,ZgradaDetailView,ZgradaCreateView,ZgradaUpdateView,ZgradaDeleteView,
ProstorijaDetailView,ProstorijaCreateView,ProstorijaUpdateView,ProstorijaDeleteView,
UredajListView,UredajDetailView,UredajCreateView,UredajUpdateView,UredajDeleteView,
OrganizacijskaJedinicaListView,OrganizacijskaJedinicaDetailView,OrganizacijskaJedinicaCreateView,OrganizacijskaJedinicaUpdateView,OrganizacijskaJedinicaDeleteView,
OdjelDetailView,OdjelCreateView,OdjelUpdateView,OdjelDeleteView,
KorisnikListView,KorisnikDetailView,KorisnikCreateView,KorisnikUpdateView,KorisnikDeleteView,
ProgramiListView,ProgramiDetailView,ProgramiCreateView,ProgramiUpdateView,ProgramiDeleteView,
InstaliraniProgramiCreateView,InstaliraniProgramiUpdateView,InstaliraniProgramiDeleteView,
KomponenteListView,KomponenteDetailView,KomponenteCreateView,KomponenteUpdateView,KomponenteDeleteView,
KonfiguracijaCreateView,KonfiguracijaUpdateView,KonfiguracijaDeleteView,
NabavaListView,NabavaCreateView,NabavaDetailView,NabavaUpdateView,NabavaDeleteView,
DobavljacListView,DobavljacDetailView,DobavljacCreateView,DobavljacUpdateView,DobavljacDeleteView,
)

urlpatterns = [
    path('', views.ulazna, name='ulazna'),
    #Generic view klase
    path('zahtjevi/',ZahtjevListView.as_view(),name="ZahtjevListView"),
    path('zahtjevi/<int:pk>/',ZahtjevDetailView.as_view(),name="ZahtjevDetailView"),
    path('zahtjevi/novi/',ZahtjevCreateView.as_view(),name="ZahtjevCreateView"),
    path('zahtjevi/uredivanje/<int:pk>/',ZahtjevUpdateView.as_view(),name="ZahtjevUpdateView"),
    path('zahtjevi/brisanje/<int:pk>/',ZahtjevDeleteView.as_view(),name="ZahtjevDeleteView"),
    path('zahtjevi/<int:fk>/adminradnje/nova',AdminRadnjeCreateView.as_view(),name="AdminRadnjeCreateView"),
    path('zahtjevi/<int:fk>/adminradnje/<int:pk>/',AdminRadnjeDetailView.as_view(),name="AdminRadnjeDetailView"),
    path('zahtjevi/<int:fk>/adminradnje/brisanje/<int:pk>/',AdminRadnjeDeleteView.as_view(),name="AdminRadnjeDeleteView"),
     path('zahtjevi/<int:fk>/adminradnje/uredivanje/<int:pk>/',AdminRadnjeUpdateView.as_view(),name="AdminRadnjeUpdateView"),
    path('zgrade/',ZgradaListView.as_view(),name="ZgradaListView"),
    path('zgrade/<str:pk>/',ZgradaDetailView.as_view(),name="ZgradaDetailView"),
    path('zgrada/nova/',ZgradaCreateView.as_view(),name="ZgradaCreateView"),
    path('zgrade/uredivanje/<str:pk>/',ZgradaUpdateView.as_view(),name="ZgradaUpdateView"),
    path('zgrade/brisanje/<str:pk>/',ZgradaDeleteView.as_view(),name="ZgradaDeleteView"),
    path('zgrade/<str:fk>/prostorija/<str:pk>/',ProstorijaDetailView.as_view(),name="ProstorijaDetailView"),
    path('zgrade/<slug:fk>/prostorije/nova/',ProstorijaCreateView.as_view(),name="ProstorijaCreateView"),
    path('zgrade/<str:fk>/prostorija/uredivanje/<str:pk>/',ProstorijaUpdateView.as_view(),name="ProstorijaUpdateView"),
    path('zgrade/<str:fk>/prostorije/brisanje/<str:pk>/',ProstorijaDeleteView.as_view(),name="ProstorijaDeleteView"),
    path('uredaji/',UredajListView.as_view(),name='UredajListView'),
    path('uredaji/<int:pk>/',UredajDetailView.as_view(),name='UredajDetailView'),
    path('uredaji/novi/',UredajCreateView.as_view(),name='UredajCreateView'),
    path('uredaji/uredivanje/<int:pk>/',UredajUpdateView.as_view(),name='UredajUpdateView'),
    path('uredaji/brisanje/<int:pk>/',UredajDeleteView.as_view(),name='UredajDeleteView'),
    path('uredaji/<int:pk>/instaliraniprogrami/novi/',InstaliraniProgramiCreateView.as_view(),name='InstaliraniProgramiCreateView'),
    path('uredaji/<int:fk>/instaliraniprogrami/uredivanje/<int:pk>/',InstaliraniProgramiUpdateView.as_view(),name='InstaliraniProgramiUpdateView'),
    path('uredaji/<int:fk>/instaliraniprogrami/brisanje/<int:pk>/',InstaliraniProgramiDeleteView.as_view(),name='InstaliraniProgramiDeleteView'),
    
    
    path('uredaji/<int:pk>/konfiguracija/nova/',KonfiguracijaCreateView.as_view(),name='KonfiguracijaCreateView'),
    path('uredaji/<int:fk>/konfiguracija/uredivanje/<int:pk>/',KonfiguracijaUpdateView.as_view(),name='KonfiguracijaUpdateView'),
    path('uredaji/<int:fk>/konfiguracija/brisanje/<int:pk>/',KonfiguracijaDeleteView.as_view(),name='KonfiguracijaDeleteView'),

    path('organizacijskejedinice/',OrganizacijskaJedinicaListView.as_view(),name="OrganizacijskaJedinicaListView"),
    path('organizacijskejedinice/<str:pk>/',OrganizacijskaJedinicaDetailView.as_view(),name="OrganizacijskaJedinicaDetailView"),
    path('organizacijskajedinica/nova/',OrganizacijskaJedinicaCreateView.as_view(),name="OrganizacijskaJedinicaCreateView"),
    path('organizacijskejedinice/uredivanje/<str:pk>/',OrganizacijskaJedinicaUpdateView.as_view(),name="OrganizacijskaJedinicaUpdateView"),
    path('organizacijskejedinice/',OrganizacijskaJedinicaListView.as_view(),name="OrganizacijskaJedinicaListView"),
    path('organizacijskejedinice/brisanje/<str:pk>/',OrganizacijskaJedinicaDeleteView.as_view(),name="OrganizacijskaJedinicaDeleteView"),
    path('organizacijskejedinice/<str:fk>/odjel/<str:pk>/',OdjelDetailView.as_view(),name="OdjelDetailView"),
    path('organizacijskejedinice/<str:fk>/odjeli/novi/',OdjelCreateView.as_view(),name="OdjelCreateView"),
    path('organizacijskejedinice/<str:fk>/odjeli/uredi/<str:pk>/',OdjelUpdateView.as_view(),name="OdjelUpdateView"),
    path('organizacijskejedinice/<str:fk>/odjeli/brisanje/<str:pk>/',OdjelDeleteView.as_view(),name="OdjelDeleteView"),
    path('korisnici/',KorisnikListView.as_view(),name="KorisnikListView"),
    path('korisnici/<int:pk>/',KorisnikDetailView.as_view(),name="KorisnikDetailView"),
    path('korisnici/novi/',KorisnikCreateView.as_view(),name="KorisnikCreateView"),
    path('korisnici/uredivanje/<int:pk>/',KorisnikUpdateView.as_view(),name="KorisnikUpdateView"),
    path('korisnici/brisanje/<int:pk>/',KorisnikDeleteView.as_view(),name="KorisnikDeleteView"),
    path('programi/',ProgramiListView.as_view(),name="ProgramiListView"),
    path('programi/<int:pk>/',ProgramiDetailView.as_view(),name="ProgramiDetailView"),
    path('programi/novi/',ProgramiCreateView.as_view(),name="ProgramiCreateView"),
    path('programi/uredivanje/<int:pk>/',ProgramiUpdateView.as_view(),name="ProgramiUpdateView"),
    path('programi/brisanje/<int:pk>/',ProgramiDeleteView.as_view(),name="ProgramiDeleteView"),
    
    path('komponente/',KomponenteListView.as_view(),name="KomponenteListView"),
    path('komponente/<int:pk>/',KomponenteDetailView.as_view(),name="KomponenteDetailView"),
    path('komponente/nova/',KomponenteCreateView.as_view(),name="KomponenteCreateView"),
    path('komponente/uredivanje/<int:pk>/',KomponenteUpdateView.as_view(),name="KomponenteUpdateView"),
    path('komponente/brisanje/<int:pk>/',KomponenteDeleteView.as_view(),name="KomponenteDeleteView"),
  
    
    path('nabave/',NabavaListView.as_view(),name="NabavaListView"),
    path('nabava/<int:pk>/',NabavaDetailView.as_view(),name="NabavaDetailView"),
    path('nabava/uredivanje/<int:pk>/',NabavaUpdateView.as_view(),name="NabavaUpdateView"),
    path('nabava/nova/',NabavaCreateView.as_view(),name="NabavaCreateView"),
    path('nabava/brisanje/<int:pk>/',NabavaDeleteView.as_view(),name="NabavaDeleteView"),
    
    path('dobavljaci/',DobavljacListView.as_view(),name="DobavljacListView"),
    path('dobavljac/<str:pk>/',DobavljacDetailView.as_view(),name="DobavljacDetailView"),
    path('dobavljaci/novi/',DobavljacCreateView.as_view(),name="DobavljacCreateView"),
    path('dobavljac/uredivanje/<str:pk>/',DobavljacUpdateView.as_view(),name="DobavljacUpdateView"),
    path('dobavljac/brisanje/<str:pk>/',DobavljacDeleteView.as_view(),name="DobavljacDeleteView"),
    
    #funkcijski pogledi
    path('lokacije/', views.lokacije, name='lokacije'),
    path('org_struktura/',views.org_struktura,name='org_struktura'),
    path('uredaji/',views.uredaji, name='uredaji'),
    
]