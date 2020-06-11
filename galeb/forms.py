from django import forms 
from . models import (Zahtjev,Zgrada,Prostorija,Uredaj,OrganizacijskaJedinica,Odjel,Korisnik,
Programi,Komponente,AdminRadnje,InstaliraniProgrami,Nabava,Dobavljac,Konfiguracija, AdminOvlasti)

class ZahtjevModelForm(forms.ModelForm):
    class Meta:
        model = Zahtjev
        fields = ['id_korisnik','datum','nacin_podnosenja','opis','status','napomena']
        widgets = {
            'datum': forms.SelectDateWidget(),
        }

class ZgradaModelForm(forms.ModelForm):
    class Meta:
        model = Zgrada
        fields ='__all__'

class ProstorijaModelForm(forms.ModelForm):
    class Meta:
        model = Prostorija
        fields ='__all__'

class UredajModelForm(forms.ModelForm):
    class Meta:
        model = Uredaj
        fields =[ 'vrsta','hostname_ip','oznaka_prostorije','id_korisnik','napomena','id_nabave','istek_garancije','proizvodac','model']
        widgets = {
            'istek_garancije': forms.SelectDateWidget(),
        }

class OrganizacijskaJedinicaModelForm(forms.ModelForm):
    class Meta:
        model = OrganizacijskaJedinica
        fields ='__all__'

class OdjelModelForm(forms.ModelForm):
    class Meta:
        model = Odjel
        fields ='__all__'

class KorisnikModelForm(forms.ModelForm):
    class Meta:
        model = Korisnik
        fields =['oznaka_odjela','ime','prezime','email','telefon','radno_mjesto']

class ProgramiModelForm(forms.ModelForm):
    class Meta:
        model = Programi
        fields = [ 'naziv_programa','proizvodac','licenca','napomena']
        
class InstaliraniProgramiModelForm(forms.ModelForm):
    class Meta:
        model = InstaliraniProgrami
        fields = '__all__' 

class KomponenteModelForm(forms.ModelForm):
    class Meta:
        model = Komponente
        fields = [ 'vrsta','proizvodac','model','opis' ]

class KonfiguracijaModelForm(forms.ModelForm):
    class Meta:
        model = Konfiguracija
        fields = ['id_uredaj','id_komponente','id_radnje','stanje','napomena'] 

class AdminRadnjeModelForm(forms.ModelForm):
    class Meta:
        model = AdminRadnje
        fields = ['id_zahtjev','datum','opis','napomena','id_uredaj']
        widgets = {
            'datum': forms.SelectDateWidget(),
        }

class NabavaModelForm(forms.ModelForm):
    class Meta:
        model = Nabava
        fields = ['datum','oznaka_org_jed','oznaka_dobavljaca','napomena']
        widgets = {
            'datum': forms.SelectDateWidget(),
        }

class DobavljacModelForm(forms.ModelForm):
    class Meta:
        model = Dobavljac
        fields = '__all__'


class AdminOvlastiModelForm(forms.ModelForm):
    class Meta:
        model = AdminOvlasti
        fields = ['id_uredaj','datum_kreiranja','lokalni_admin','id_zahtjev',]
        widgets = {
            'datum_kreiranja': forms.SelectDateWidget(),
        }