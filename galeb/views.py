from django.shortcuts import render
from django.http import HttpResponse
from . models import AdminOvlasti,AdminRadnje,Dobavljac,InstaliraniProgrami,Komponenete,Konfiguracija,Korisnik,\
                     Nabava,Odjel,OrganizacijskaJedinica,Programi,Prostorija,Uredaj,Zahtjev,Zgrada

# Create your views here.
def ulazna(request):
    print("Ulazna stranica za prijavu")
    print (str(request))
    return render(request,"galeb/ulazna.html",{})

def zahtjevi(request):
    zahtjevi = Zahtjev.objects.all()
    print("Zahtjevi")
    print (str(request))
    for z in zahtjevi:
        print(z)
    kontekst = {"zahtjevi":zahtjevi}
    return render(request,"galeb/zahtjevi.html",kontekst)

#zgrade prostorije uredaji
def lokacije(request):
    zgrade = Zgrada.objects.all()
    prostorije = Prostorija.objects.all()
    uredaji = Uredaj.objects.all()
    print("Zgrade")
    print (str(request))
    '''
    for z in zgrade:
        print(z.naziv)
        prostorije_zgrada = Prostorija.objects.filter(oznaka_zgrade=z.oznaka_zgrade) 
        if prostorije_zgrada.exists():
            for p in prostorije_zgrada:
                print(p.oznaka_prostorije)
    '''
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

















