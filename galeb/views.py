from django.shortcuts import render
from django.shortcuts import get_object_or_404
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView,UpdateView,DeleteView

from . models import (AdminOvlasti,AdminRadnje,Dobavljac,
InstaliraniProgrami,Komponente,Konfiguracija,Korisnik,
Nabava,Odjel,OrganizacijskaJedinica,Programi,Prostorija,Uredaj,Zahtjev,Zgrada)

from .forms import  (ZahtjevModelForm,ZgradaModelForm,ProstorijaModelForm,
UredajModelForm,OrganizacijskaJedinicaModelForm,OdjelModelForm,KorisnikModelForm,
ProgramiModelForm,KomponenteModelForm,AdminRadnjeModelForm,InstaliraniProgramiModelForm,
NabavaModelForm,DobavljacModelForm,KonfiguracijaModelForm,
AdminOvlastiModelForm)

# Create your views here.
def ulazna(request):
    print("Ulazna stranica za prijavu")
    print (str(request))
    return render(request,"galeb/ulazna.html",{})

class ZahtjevListView(ListView):
    model = Zahtjev
    context_object_name = 'zahtjevi'
    paginate_by = 10

class ZahtjevDetailView(DetailView):
    model = Zahtjev
    context_object_name = 'zahtjev'

class ZahtjevCreateView(CreateView):
    model = Zahtjev
    form_class = ZahtjevModelForm
    def get_initial(self, *args, **kwargs):
        print("ZahtjevCreateView.get_initial: "+str(self.request.path))
        initial = super(ZahtjevCreateView, self).get_initial(**kwargs)
        return initial
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class ZahtjevUpdateView(UpdateView):
    model = Zahtjev
    form_class = ZahtjevModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class ZahtjevDeleteView(DeleteView):
    model = Zahtjev
    context_object_name = 'zahtjev'
    success_url = reverse_lazy('ZahtjevListView')

class ZgradaListView(ListView):
    model = Zgrada
    context_object_name = 'zgrade'

class ZgradaDetailView(DetailView):
    model = Zgrada
    context_object_name = 'zgrada'

class ZgradaCreateView(CreateView):
    model = Zgrada
    form_class = ZgradaModelForm
    
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class ZgradaUpdateView(UpdateView):
    model = Zgrada
    form_class = ZgradaModelForm
    
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class ZgradaDeleteView(DeleteView):
    model = Zgrada
    context_object_name = 'zgrada'
    success_url = reverse_lazy('ZgradaListView')

#ProstorijaListView je u ZgradaDetailView
class ProstorijaDetailView(DetailView):
    model = Prostorija
    context_object_name = 'prostorija'


class ProstorijaCreateView(CreateView):
    model = Prostorija
    form_class = ProstorijaModelForm

    def get_initial(self, *args, **kwargs):
        print(str(self.request.path))
        ozn_zgr = self.request.path.split('/')[2]
        print("Oznaka zgrade: "+ozn_zgr)
        initial = super(ProstorijaCreateView, self).get_initial(**kwargs)
        initial['oznaka_zgrade'] = ozn_zgr
        return initial

    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)
        
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        ozn_zgr = str(self.request.path.split('/')[2])
        kontekst['ozn_zgr'] = ozn_zgr
        return kontekst

class ProstorijaUpdateView(UpdateView):
    model = Prostorija
    form_class = ProstorijaModelForm

    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        ozn_zgr = str(self.request.path.split('/')[2])
        kontekst['ozn_zgr'] = ozn_zgr
        return kontekst

class ProstorijaDeleteView(DeleteView):
    model = Prostorija
    context_object_name = 'prostorija'
   
    def get_success_url(self):
        print("ProstorijeDeleteView.get_success_url() request:"+str(self.request))
        ozn_zgr = self.request.path.split('/')[2]

        return reverse_lazy('ZgradaDetailView',kwargs={'pk':ozn_zgr})

class UredajListView(ListView):
    model = Uredaj
    context_object_name = 'uredaji'
    paginate_by = 10
    
class UredajDetailView(DetailView):
    model = Uredaj
    context_object_name = 'uredaj'

class UredajCreateView(CreateView):
    model = Uredaj
    form_class = UredajModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class UredajUpdateView(UpdateView):
    model = Uredaj
    form_class = UredajModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class UredajDeleteView(DeleteView):
    model = Uredaj
    context_object_name = 'uredaj'
    success_url = reverse_lazy('UredajListView')

class OrganizacijskaJedinicaListView(ListView):
    model = OrganizacijskaJedinica
    context_object_name = 'org_jedinice'
    paginate_by = 10

class OrganizacijskaJedinicaDetailView(DetailView):
    model = OrganizacijskaJedinica
    context_object_name = 'org_jedinica'

class OrganizacijskaJedinicaCreateView(CreateView):
    model = OrganizacijskaJedinica
    form_class = OrganizacijskaJedinicaModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class OrganizacijskaJedinicaUpdateView(UpdateView):
    model = OrganizacijskaJedinica
    form_class = OrganizacijskaJedinicaModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class OrganizacijskaJedinicaDeleteView(DeleteView):
    model = OrganizacijskaJedinica
    context_object_name = 'org_jedinica'
    success_url = reverse_lazy('OrganizacijskaJedinicaListView')

class OdjelDetailView(DetailView):
    model = Odjel
    context_object_name = 'odjel'

class OdjelCreateView(CreateView):
    model = Odjel
    form_class = OdjelModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)
    def get_initial(self, *args, **kwargs):
        print(str(self.request.path))
        oz_org_jed = self.request.path.split('/')[2]
        print("Oznaka organizacijske jedinice: "+oz_org_jed)
        initial = super(OdjelCreateView, self).get_initial(**kwargs)
        initial['oznaka_org_jed'] = oz_org_jed
        return initial
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        ozn_iz_url = str(self.request.path.split('/')[2])
        kontekst['ozn_org_jed'] = ozn_iz_url
        return kontekst


class OdjelUpdateView(UpdateView):
    model = Odjel
    form_class = OdjelModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        ozn_iz_url = str(self.request.path.split('/')[2])
        kontekst['ozn_org_jed'] = ozn_iz_url
        return kontekst

class OdjelDeleteView(DeleteView):
    model = Odjel
    context_object_name = 'odjel'
    def get_success_url(self):
        print("OdjelDeleteView.get_success_url() request:"+str(self.request))
        ozn_org_jed = self.request.path.split('/')[2]
        return reverse_lazy('OrganizacijskaJedinicaDetailView',kwargs={'pk':ozn_org_jed})

class KorisnikListView(ListView):
    model = Korisnik
    context_object_name = 'korisnici'
    paginate_by = 10

class KorisnikDetailView(DetailView):
    model = Korisnik
    context_object_name = 'korisnik'

class KorisnikCreateView(CreateView):
    model = Korisnik
    form_class = KorisnikModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class KorisnikUpdateView(UpdateView):
    model = Korisnik
    form_class = KorisnikModelForm
    def form_valid(self, form):
        print(form.cleaned_data)
        return super().form_valid(form)

class KorisnikDeleteView(DeleteView):
    model = Korisnik
    context_object_name = 'korisnik'
    success_url = reverse_lazy('KorisnikListView')

class ProgramiListView(ListView):
    model = Programi
    context_object_name = 'programi'
    paginate_by=10

class ProgramiDetailView(DetailView):
    model = Programi
    context_object_name = 'program'
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_programa_iz_url = str(self.request.path.split('/')[2])
        instalirani_programi = InstaliraniProgrami.objects.filter(id_programa =  id_programa_iz_url)
        print('ProgramiDetailView.get_context_data() instalirani_programi = '+str(instalirani_programi))
        kontekst['instalirani_programi'] = instalirani_programi
        return kontekst

class ProgramiCreateView(CreateView):
    model = Programi
    form_class = ProgramiModelForm
    def form_valid(self,form):
        return super().form_valid(form)

class ProgramiUpdateView(UpdateView):
    model = Programi
    form_class = ProgramiModelForm
    def form_valid(self,form):
        return super().form_valid(form)

class ProgramiDeleteView(DeleteView):
    model = Programi
    context_object_name = 'program'
    success_url = reverse_lazy('ProgramiListView')

class InstaliraniProgramiCreateView(CreateView):
    model = InstaliraniProgrami
    form_class = InstaliraniProgramiModelForm
    form_class.base_fields['id_uredaj'].disabled = True
    def form_valid(self,form):
        print('InstaliraniProgramiCreateView.form_valid()')
        return super().form_valid(form)
    def get_initial(self, *args, **kwargs):
        print(str(self.request.path))
        id_uredaj = self.request.path.split('/')[2]
        print("InstaliraniProgramiCreateView.get_initial() id_uredaj = "+ id_uredaj)
        initial = super(InstaliraniProgramiCreateView, self).get_initial(**kwargs)
        initial['id_uredaj'] =  id_uredaj
        return initial
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_uredaj = str(self.request.path.split('/')[2])
        print('InstaliraniProgramiCreateView.get_context_data() id_uredaj = '+str(id_uredaj))
        kontekst['id_uredaj'] = id_uredaj
        return kontekst

class InstaliraniProgramiUpdateView(UpdateView):
    model = InstaliraniProgrami
    form_class = InstaliraniProgramiModelForm
    form_class.base_fields['id_uredaj'].disabled = True
    def form_valid(self,form):
        return super().form_valid(form)
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_uredaj = str(self.request.path.split('/')[2])
        print('InstaliraniUpdateView.get_context_data() id_uredaj = '+str(id_uredaj))
        kontekst['id_uredaj'] = id_uredaj
        return kontekst
        
class InstaliraniProgramiDeleteView(DeleteView):
    model = InstaliraniProgrami
    context_object_name = 'instaliraniprogram'
    def get_success_url(self): 
        print("InstaliraniProgramiDeleteView.get_success_url() request:"+str(self.request))
        id_uredaj = str(self.request.path.split('/')[2])
        print("InstaliraniProgramiDeleteView.get_success_url() id_uredaj:"+str(id_uredaj))
        return reverse_lazy('UredajDetailView',kwargs={'pk':id_uredaj})

class KomponenteListView(ListView):
    model = Komponente
    context_object_name = 'komponente'
    paginate_by=10
    
class KomponenteDetailView(DetailView):
    model = Komponente
    context_object_name = 'komponenta'

class KomponenteCreateView(CreateView):
    model = Komponente
    form_class = KomponenteModelForm
    def form_valid(self,form):
        return super().form_valid(form)

class KomponenteUpdateView(UpdateView):
    model = Komponente
    form_class = KomponenteModelForm
    def form_valid(self,form):
        return super().form_valid(form)

class KomponenteDeleteView(DeleteView):
    model = Komponente
    context_object_name = 'komponenta'
    success_url = reverse_lazy('KomponenteListView')

class KonfiguracijaCreateView(CreateView):
    model = Konfiguracija
    form_class = KonfiguracijaModelForm
    form_class.base_fields['id_uredaj'].disabled = True
    def form_valid(self,form):
        return super().form_valid(form)
    def get_initial(self, *args, **kwargs):
        print(str(self.request.path))
        id_uredaj = self.request.path.split('/')[2]
        print("KonfiguracijaCreateView.get_initial() id_uredaj = "+ id_uredaj)
        initial = super(KonfiguracijaCreateView, self).get_initial(**kwargs)
        initial['id_uredaj'] =  id_uredaj
        return initial
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_uredaj = str(self.request.path.split('/')[2])
        print('KonfiguracijaCreateView.get_context_data() id_uredaj = '+str(id_uredaj))
        kontekst['id_uredaj'] = id_uredaj
        return kontekst

class KonfiguracijaUpdateView(UpdateView):
    model = Konfiguracija
    form_class = KonfiguracijaModelForm
    form_class.base_fields['id_uredaj'].disabled = True
    def form_valid(self,form):
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_uredaj = str(self.request.path.split('/')[2])
        print('KonfiguracijaCreateView.get_context_data() id_uredaj = '+str(id_uredaj))
        kontekst['id_uredaj'] = id_uredaj
        return kontekst

class KonfiguracijaDeleteView(DeleteView):
    model = Konfiguracija
    context_object_name = 'konfiguracija'
    def get_success_url(self): 
        print("InstaliraniProgramiDeleteView.get_success_url() request:"+str(self.request))
        id_uredaj = str(self.request.path.split('/')[2])
        print("InstaliraniProgramiDeleteView.get_success_url() id_uredaj:"+str(id_uredaj))
        return reverse_lazy('UredajDetailView',kwargs={'pk':id_uredaj})

class NabavaListView(ListView):
    model = Nabava
    context_object_name = 'nabave'
    paginate_by = 10

class NabavaDetailView(DetailView):
    model = Nabava
    context_object_name = 'nabava'

class NabavaCreateView(CreateView):
    model = Nabava
    form_class = NabavaModelForm
    def form_valid(self,form):
        return super().form_valid(form)

class NabavaUpdateView(UpdateView):
    model = Nabava
    form_class = NabavaModelForm
    def form_valid(self,form):
        return super().form_valid(form)

class NabavaDeleteView(DeleteView):
    model = Nabava
    context_object_name = 'nabava'
    success_url = reverse_lazy('NabavaListView')
    
class DobavljacListView(ListView):
    model = Dobavljac
    context_object_name = 'dobavljaci'
    paginate_by = 10
    
class DobavljacDetailView(DetailView):
    model = Dobavljac
    context_object_name = 'dobavljac'

class DobavljacCreateView(CreateView):
    model = Dobavljac
    form_class = DobavljacModelForm
    def form_valid(self,form):
        return super().form_valid(form)
        
class DobavljacUpdateView(UpdateView):
    model = Dobavljac
    form_class = DobavljacModelForm
    def form_valid(self,form):
        return super().form_valid(form)

class DobavljacDeleteView(DeleteView):
    model = Dobavljac
    context_object_name = 'dobavljac'
    success_url = reverse_lazy('DobavljacListView') 

class AdminRadnjeCreateView(CreateView):
    model = AdminRadnje
    form_class = AdminRadnjeModelForm
    form_class.base_fields['id_zahtjev'].disabled = True
    def form_valid(self,form):
        return super().form_valid(form)
    def get_initial(self, *args, **kwargs):
        print(str(self.request.path))
        id_zahtjev = self.request.path.split('/')[2]
        print("AdminRadnjeCreateView.get_initial() zahtjev_id = "+ id_zahtjev)
        initial = super(AdminRadnjeCreateView, self).get_initial(**kwargs)
        initial['id_zahtjev'] =  id_zahtjev
        return initial
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_zahtjev = str(self.request.path.split('/')[2])
        print('AdminRadnjeCreateView.get_context_data() id_zahtjev = '+str(id_zahtjev))
        kontekst['id_zahtjev'] = id_zahtjev
        return kontekst

class AdminRadnjeUpdateView(UpdateView):
    model = AdminRadnje
    form_class = AdminRadnjeModelForm
    form_class.base_fields['id_zahtjev'].disabled = True
    def form_valid(self,form):
        return super().form_valid(form)
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_zahtjev = str(self.request.path.split('/')[2])
        kontekst['id_zahtjev'] = id_zahtjev
        return kontekst

class AdminRadnjeDetailView(DetailView):
    model = AdminRadnje
    context_object_name = 'adminradnja'

class AdminRadnjeDeleteView(DeleteView):
    model = AdminRadnje
    context_object_name = 'adminradnja'
    def get_success_url(self):
        print("AdminRadnjeDeleteView.get_success_url() request:"+str(self.request))
        id_zahtjev = self.request.path.split('/')[2]
        print("AdminRadnjeDeleteView.get_success_url() id_zahtjev:"+str(id_zahtjev))
        return reverse_lazy('ZahtjevDetailView',kwargs={'pk':id_zahtjev})

class AdminOvlastiCreateView(CreateView):
    model = AdminOvlasti
    form_class = AdminOvlastiModelForm
    form_class.base_fields['id_uredaj'].disabled = True
    def form_valid(self,form):
        return super().form_valid(form)
        
    def get_initial(self, *args, **kwargs):
        print(str(self.request.path))
        id_uredaj = self.request.path.split('/')[2]
        print("AdminOvlastiCreateView.get_initial() id_uredaj = "+ id_uredaj)
        initial = super(AdminOvlastiCreateView, self).get_initial(**kwargs)
        initial['id_uredaj'] =  id_uredaj
        return initial

    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_uredaj = str(self.request.path.split('/')[2])
        print('AdminOvlastiCreateView.get_context_data() id_uredaj = '+str(id_uredaj))
        kontekst['id_uredaj'] = id_uredaj
        return kontekst

class AdminOvlastiListView(ListView):
    model = AdminOvlasti
    context_object_name = 'adminovlasti'
    paginate_by = 10

class AdminOvlastiUpdateView(UpdateView):
    model = AdminOvlasti
    form_class = AdminOvlastiModelForm
    form_class.base_fields['id_uredaj'].disabled = True
    def form_valid(self,form):
        return super().form_valid(form)
    def get_context_data(self, **kwargs):
        kontekst = super().get_context_data(**kwargs)
        id_uredaj = str(self.request.path.split('/')[2])
        print('AdminOvlastiCreateView.get_context_data() id_uredaj = '+str(id_uredaj))
        kontekst['id_uredaj'] = id_uredaj
        return kontekst

class AdminOvlastiDeleteView(DeleteView):
    model = AdminOvlasti
    context_object_name = 'adminovlast'
    def get_success_url(self):
        print(" AdminOvlastiDeleteView.get_success_url() request:"+str(self.request))
        id_uredaj = self.request.path.split('/')[2]
        print(" AdminOvlastiDeleteView.get_success_url() id_uredaj:"+str(id_uredaj))
        return reverse_lazy('UredajDetailView',kwargs={'pk':id_uredaj})

#zgrade prostorije uredaji
def lokacije(request):
    zgrade = Zgrada.objects.all()
    prostorije = Prostorija.objects.all()
    uredaji = Uredaj.objects.all()
    print("Zgrade")
    print (str(request))
    kontekst = {"zgrade":zgrade,
                "prostorije":prostorije,
                "uredaji":uredaji}
    return render(request,"galeb/lokacije.html", kontekst)

#org jedinice odjeli korisnici
def org_struktura(request):
    print('Organizacijska strutkura')
    print (str(request))
    org_jedinice = OrganizacijskaJedinica.objects.all()
    odjeli = Odjel.objects.all()
    korisnici = Korisnik.objects.all()
    kontekst ={
        "org_jedinice":org_jedinice,
        "odjeli":odjeli,
        "korisnici":korisnici
    }
    return render(request,"galeb/org_struktura.html", kontekst)

#uredaji
def uredaji(request):
    print('Uredaji')
    print (str(request))
    uredaji = Uredaj.objects.all()
    kontekst ={
        "uredaji":uredaji,
    }
    return render(request,"galeb/uredaji.html", kontekst)

















