# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.urls import reverse
import datetime

class AdminOvlasti(models.Model):
    id_uredaj = models.OneToOneField('Uredaj', models.DO_NOTHING, db_column='id_uredaj', primary_key=True)
    lokalni_admin = models.CharField(max_length=45)
    datum_kreiranja = models.DateField(blank=True, null=True,default=datetime.date.today)
    id_zahtjev = models.ForeignKey('Zahtjev', models.DO_NOTHING, db_column='id_zahtjev', blank=True, null=True)

    def __str__(self):
        return str(self.id_uredaj or '')+' lokalni_admin: '+str(self.lokalni_admin or 'nepoznat')+' datum kreiranja: '+str(self.datum_kreiranja)+" zahtjev: "+str(self.id_zahtjev or ' nepoznat')

    def get_absolute_url(self):
        return reverse('UredajDetailView', kwargs = {'pk':self.id_uredaj.id_uredaj})

    class Meta:
        managed = False
        db_table = 'admin_ovlasti'
        unique_together = (('id_uredaj', 'lokalni_admin'),)
        verbose_name_plural = "Adminovlasti"
        ordering = ["-datum_kreiranja"]


class AdminRadnje(models.Model):
    id_radnje = models.AutoField(primary_key=True)
    id_zahtjev = models.ForeignKey('Zahtjev', models.DO_NOTHING, db_column='id_zahtjev', blank=False, null=True)
    datum = models.DateField(blank=True, null=True, default=datetime.date.today )
    opis = models.TextField(max_length=500, blank=False, null=False)
    napomena = models.TextField(max_length=500, blank=True, null=True)
    id_uredaj = models.ForeignKey('Uredaj', models.DO_NOTHING, db_column='id_uredaj', blank=True, null=True)

    def __str__(self):
        return str(self.datum or '')+" "+str(self.opis or '')+str(self.napomena or '')

    def get_absolute_url(self):
        print("AmdinRadnje.get_absolute_url() id_zahtjev = " +str(self.id_zahtjev)+" self.pk = "+str(self.pk))
        return reverse('AdminRadnjeDetailView', kwargs = {'fk':self.id_zahtjev.id_zahtjev,'pk':self.pk})

    class Meta:
        managed = False
        db_table = 'admin_radnje'
        verbose_name_plural = "Aminradnje"
        ordering = ["-datum"]


class Dobavljac(models.Model):
    oznaka_dobavljaca = models.CharField(primary_key=True, max_length=15)
    puni_naziv = models.CharField(max_length=45, blank=True, null=True)
    adresa = models.CharField(max_length=45, blank=True, null=True)
    kontakt = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return str(self.oznaka_dobavljaca)+" "+str(self.puni_naziv  or '')+" "+str(self.adresa or '')

    def get_absolute_url(self):
        return reverse('DobavljacDetailView',kwargs={'pk':self.pk})

    class Meta:
        managed = False
        db_table = 'dobavljac'
        verbose_name_plural = "Dobavljaci"


class InstaliraniProgrami(models.Model):
    id_instalacije = models.AutoField(primary_key=True)
    id_programa = models.ForeignKey('Programi', models.DO_NOTHING, db_column='id_programa', blank=False, null=False)
    id_uredaj = models.ForeignKey('Uredaj', models.DO_NOTHING, db_column='id_uredaj', blank=False, null=False)
    id_radnje = models.ForeignKey(AdminRadnje, models.DO_NOTHING, db_column='id_radnje', blank=True, null=True)

    def __str__(self):
        s = str(self.id_programa.naziv_programa or '')+" "+str(self.id_uredaj.hostname_ip or '')
        if(self.id_radnje):
            s +=" "+str(self.id_radnje.datum or '')+" "+str(self.id_radnje.opis or '')
        return s

    def get_absolute_url(self):
        return reverse('UredajDetailView', kwargs = {'pk':self.id_uredaj.id_uredaj})

    class Meta:
        managed = False
        db_table = 'instalirani_programi'
        unique_together = (('id_programa', 'id_uredaj'),)
        verbose_name_plural = "Instaliraniprogrami"


class Komponente(models.Model):
    id_komponente = models.AutoField(primary_key=True)
    vrsta = models.CharField(max_length=45, blank=True, null=True)
    proizvodac = models.CharField(max_length=45, blank=True, null=True)
    model = models.CharField(max_length=45, blank=True, null=True)
    opis = models.TextField(max_length=250, blank=True, null=True)

    def __str__(self):
        return str(self.vrsta or '')+" "+str(self.proizvodac or '')+" "+str(self.model or '')+str(self.opis or '')

    def get_absolute_url(self):
        return reverse('KomponenteDetailView', kwargs={'pk': self.pk})

    class Meta:
        managed = False
        db_table = 'komponente'
        verbose_name_plural = "Komponente"


class Konfiguracija(models.Model):

    stanja_komponente = [('ispravno','ispravno'),('upitno','upitno'),('kvar','kvar'),('zamjenjena','zamjenjena')]
    id_konfiguracija = models.AutoField(primary_key=True)
    id_komponente = models.ForeignKey(Komponente, models.DO_NOTHING, db_column='id_komponente', blank=True, null=True)
    stanje = models.CharField(max_length=31, blank=True, null=True,choices=stanja_komponente,default="ispravno")
    napomena = models.TextField(max_length=500, blank=True, null=True)
    id_uredaj = models.ForeignKey('Uredaj', models.DO_NOTHING, db_column='id_uredaj', blank=True, null=True)
    id_radnje = models.ForeignKey(AdminRadnje, models.DO_NOTHING, db_column='id_radnje', blank=True, null=True)

    def __str__(self):
        s = ''
        if(self.id_komponente):
            s += str(self.id_komponente.vrsta or '')+" "+str(self.id_komponente.proizvodac or '')+" "+str(self.id_komponente.model or '')
        return s

    def get_absolute_url(self):
         return reverse('UredajDetailView', kwargs = {'pk':self.id_uredaj.id_uredaj})


    class Meta:
        managed = False
        db_table = 'konfiguracija'
        verbose_name_plural = "Konfiguracije"


class Korisnik(models.Model):
    id_korisnik = models.AutoField(primary_key=True)
    ime = models.CharField(max_length=45, blank=False, null=False)
    prezime = models.CharField(max_length=45, blank=False, null=False)
    email = models.CharField(max_length=45, blank=True, null=True)
    telefon = models.CharField(max_length=45, blank=True, null=True)
    radno_mjesto = models.CharField(max_length=45, blank=True, null=True)
    oznaka_odjela = models.ForeignKey('Odjel', models.DO_NOTHING, db_column='oznaka_odjela', blank=True, null=True)

    def __str__(self):
        return str(self.ime)+" "+str(self.prezime)\
        +" ("+str(self.email or '')+")  - "+str(self.radno_mjesto or '')\
        +" "+str(self.oznaka_odjela.naziv or '')\
        +"  "+str(self.oznaka_odjela.oznaka_org_jed.naziv)+" tel:"+str(self.telefon or '')

    def get_absolute_url(self):
        return reverse('KorisnikDetailView', kwargs={'pk': self.pk})

    class Meta:
        managed = False
        db_table = 'korisnik'
        verbose_name_plural = "Korisnici"


class Nabava(models.Model):
    id_nabave = models.AutoField(primary_key=True)
    oznaka_org_jed = models.ForeignKey('OrganizacijskaJedinica', models.DO_NOTHING, db_column='oznaka_org_jed')
    oznaka_dobavljaca = models.ForeignKey(Dobavljac, models.DO_NOTHING, db_column='oznaka_dobavljaca', blank=True, null=True)
    datum = models.DateField(blank=True, null=True, default=datetime.date.today )
    napomena = models.TextField(max_length=500, blank=True, null=True)

    def __str__(self):
        return str(self.datum or '')+"  "+str(self.oznaka_org_jed.naziv or '')\
        +" - dobavljač: "+str(self.oznaka_dobavljaca.puni_naziv or '')+" "+str(self.oznaka_dobavljaca.adresa or '')

    def get_absolute_url(self):
        return reverse('NabavaDetailView',kwargs={'pk':self.pk})


    class Meta:
        managed = False
        db_table = 'nabava'
        verbose_name_plural = "Nabave"
        ordering = ["-datum"]


class Odjel(models.Model):
    oznaka_odjela = models.CharField(primary_key=True, max_length=15)
    naziv = models.CharField(max_length=45)
    oznaka_org_jed = models.ForeignKey('OrganizacijskaJedinica', models.DO_NOTHING, db_column='oznaka_org_jed')

    def __str__(self):
        return str(self.oznaka_odjela or '')+" "+str(self.naziv or '') +" ("+str(self.oznaka_org_jed.naziv or '')+")"

    def get_absolute_url(self):
        return reverse('OdjelDetailView', kwargs={'fk':self.oznaka_org_jed.oznaka_org_jed,'pk': self.pk})


    class Meta:
        managed = False
        db_table = 'odjel'
        verbose_name_plural = "Odjeli"



class OrganizacijskaJedinica(models.Model):
    oznaka_org_jed = models.CharField(primary_key=True, max_length=10)
    naziv = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return str(self.oznaka_org_jed or '')+"  "+str(self.naziv or '')

    def get_absolute_url(self):
        return reverse('OrganizacijskaJedinicaDetailView', kwargs={'pk': self.pk})

    class Meta:
        managed = False
        db_table = 'organizacijska_jedinica'
        verbose_name_plural = "Organizacijskejedinice"


class Programi(models.Model):
    id_programa = models.AutoField(primary_key=True)
    naziv_programa = models.CharField(max_length=45)
    proizvodac = models.CharField(max_length=45, blank=True, null=True)
    licenca = models.CharField(max_length=45, blank=True, null=True)
    napomena = models.TextField(max_length=500, blank=True, null=True)

    def __str__(self):
        return str(self.naziv_programa or '')+" "+str(self.proizvodac or '')+" "+str(self.licenca or '')+" "+str(self.napomena or '')

    def get_absolute_url(self):
        return reverse('ProgramiDetailView', kwargs={'pk': self.pk})

    class Meta:
        managed = False
        db_table = 'Programi'
        verbose_name_plural = "Programi"


class Prostorija(models.Model):
    oznaka_prostorije = models.CharField(primary_key=True, max_length=15)
    oznaka_zgrade = models.ForeignKey('Zgrada', models.DO_NOTHING, db_column='oznaka_zgrade')
    kat = models.IntegerField(blank=True, null=True)
    namjena = models.CharField(max_length=45, blank=True, null=True)
    napomena = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return str(self.oznaka_prostorije or '')+"  "+str(self.namjena or '')+"    ("+str(self.oznaka_zgrade.naziv or '')+" "+str(self.kat or '')+".kat)"

    def get_absolute_url(self):
        return reverse('ProstorijaDetailView', kwargs={'fk':self.oznaka_zgrade.oznaka_zgrade,'pk': self.pk})
    
    class Meta:
        managed = False
        db_table = 'prostorija'
        verbose_name_plural = "Prostorije"


class Uredaj(models.Model):
    vrste_uredaja =[('PC','PC'),('Laptop','Laptop'),('Printer/Scanner','Printer/Scanner'),('Telefon','Telefon'),('Switch','Switch'),('Ostalo','Ostalo')]
    id_uredaj = models.AutoField(primary_key=True)
    vrsta = models.CharField(max_length=47, choices=vrste_uredaja,default='PC')
    hostname_ip = models.CharField(db_column='hostname_IP', max_length=45, blank=True, null=True)  # Field name made lowercase.
    oznaka_prostorije = models.ForeignKey(Prostorija, models.DO_NOTHING, db_column='oznaka_prostorije', blank=True, null=True)
    id_korisnik = models.ForeignKey(Korisnik, models.DO_NOTHING, db_column='id_korisnik', blank=True, null=True)
    napomena = models.TextField(max_length=500, blank=True, null=True)
    id_nabave = models.ForeignKey(Nabava, models.DO_NOTHING, db_column='id_nabave', blank=True, null=True)
    istek_garancije = models.DateField(blank=True, null=False, default=datetime.date.today )
    proizvodac = models.CharField(max_length=45, blank=True, null=True)
    model = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        s = str(self.vrsta or '')+": "
        if(self.hostname_ip):
            s +=str(self.hostname_ip or 'tvornički naziv ' )+"  "
        if(self.proizvodac):
            s += str(self.proizvodac or ' nepoznat proizvođal')+" "
        if(self.model):
            s +="("+str(self.model or ' nepoznat model ')+")"
        if(self.id_korisnik):
            s +="  "+str(self.id_korisnik.ime or '')+" "+str(self.id_korisnik.prezime or '')+" ("+str(self.id_korisnik.email or '')+")"+" "+str(self.id_korisnik.radno_mjesto or '')
        return s

    def get_absolute_url(self):
        return reverse('UredajDetailView', kwargs={'pk': self.pk})

    class Meta:
        managed = False
        db_table = 'uredaj'
        verbose_name_plural = "Uredaji"


class Zahtjev(models.Model):
    #status_zahtjeva [('Vrijednost','Prikaz)]
    statusi_zahtjeva =[('Novi','Novi'),('Preuzet','Preuzet'),('Riješen','Riješen'),('Neriješiv','Neriješiv')] 
    nacini_podnosenja =[('Email','Email'),('Telefon','Telefon'),('Formaln sastanak','Formalni sastanak'),('Dogovor','Dogovor')]
    id_zahtjev = models.AutoField(primary_key=True)
    id_korisnik = models.ForeignKey(Korisnik, models.DO_NOTHING, db_column='id_korisnik', blank=False, null=False)
    datum = models.DateField(blank=True, null=False, default=datetime.date.today )
    nacin_podnosenja = models.CharField(max_length=40,choices=nacini_podnosenja,default="Email")
    opis = models.TextField(max_length=500)
    status = models.CharField(max_length=29,choices=statusi_zahtjeva, default='Novi')
    napomena = models.TextField(max_length=500, blank=True, null=True)

    def __str__(self):
        return str(self.status or '')+":  "+str(self.datum or '')+"  "+str(self.id_korisnik.ime or '')+" "+str(self.id_korisnik.prezime or '')\
        +" ("+str(self.id_korisnik.email or '')+") - "+str(self.opis or '')

    def get_absolute_url(self):

        return reverse('ZahtjevDetailView', kwargs={'pk': self.pk})

    class Meta:
        managed = False
        db_table = 'zahtjev'
        verbose_name_plural = "Zathjevi"
        ordering = ["-datum"]


class Zgrada(models.Model):
    oznaka_zgrade = models.CharField(primary_key=True, max_length=15)
    naziv = models.CharField(max_length=45)
    adresa = models.CharField(max_length=45, blank=True, null=True)

    def __str__(self):
        return str(self.oznaka_zgrade or '')+" "+str(self.naziv or '')+" ("+str(self.adresa or '')+")"

    def get_absolute_url(self):
        return reverse('ZgradaDetailView', kwargs={'pk': self.pk})
    
    class Meta:
        managed = False
        db_table = 'zgrada'
        verbose_name_plural = "Zgrade"
