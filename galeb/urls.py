from django.urls import path

from . import views

urlpatterns = [
    path('', views.ulazna, name='ulazna'),
    path('zahtjevi/', views.zahtjevi, name='zahtjevi'),
    path('lokacije/', views.lokacije, name='lokacije'),
    path('org_struktura/',views.org_struktura,name='org_struktura'),
    path('uredaji/',views.uredaji, name='uredaji')
]