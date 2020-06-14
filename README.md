# iooa2020-EvidencijaUredaja
Projekt IOOA
"Administratorski galeb" web aplikacija za evidenciju administratorskih radnji na uređajima

Preduvijeti za pokretanje instalirati:
Python 3.7.7 https://www.python.org/download/releases/3.0/
(opcionalno virtualenv ili slična virtualna okolina)
MySQL 8.0 (MySQL Community Server ) RDBMS https://dev.mysql.com/downloads/mysql/
mysql connector python 8.0.19 konektor za povezivanje MySQL sa Pythonom 
Django 3.0.5 Python framework https://www.djangoproject.com/

Redoslijed radnji na Windows OS (na Linux i ostalima galvni postupci se razlikuju u manjim detaljima) :

1.Instalirati Python i dodati python.exe u Enviroment varijablu,  da se može pokrenuti iz CMD (Command Prompt)

2. Instalirati MySQL (po potrebi napraviti novog korisnika)
Najnoviju verziju baze iz mape baza_dump importati u MySQL
Instalirtati mysql connector python 8.0.19

3. Na disku napraviti novu mapu i kopirati cijelokupan sadržaj sa github-a u nju.
Osnovna struktra direktorija bi trebala biti:

"Nova mapa" aplikacije (naziva prema želji) mora pratiti točnu strukturu obavezno sa datotekom "manage.py" u korjenskoj razini:
"manage.py"
"readme.md"
├───admingaleb
│   └───__pycache__
├───galeb
│   ├───migrations
│   │   └───__pycache__
│   ├───static
│   │   └───galeb
│   │       ├───css
│   │       ├───js
│   │       └───slike
│   │           └───favicon_io
│   ├───templates
│   │   └───galeb
│   └───__pycache__
└───Testiranje

4. U direktoriju "admingaleb" pronaći i sa nekim editorom (Notepad++, SublimeText ...)
otvoriti "settings.py" 
Pronaći dio sa postavkana za spajenje na bazu i namjestiti parametre prema postavkama iz koraka 2 :
DATABASES = {
     'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'admingaleb', 
        'USER': 'korisnik',
        'PASSWORD': 'lozinka',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    } 
Ako spajanje na bazu iz nekog razloga ne bude moguće može se koristiti prazna SQLlite baza. U tom slučaju će trebati
pobrisati ili zakomentirati linije za spajanje sa MySQL-om i upisati:

DATABASES = {
   'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

5.Otvoriti cmd i pozicionirati se u korjensku razinu novog direktorija (pored datoteke "manage.py")
  pokrenuti naredbu python manage.py runserver (opcionalno upisati broj porta, default je 8000)
  Otvoriti web preglednik i upisati localhost:8000 ili 127.0.0.1:8000 (ili promjenjeni broj porta)



