from django.urls import path

from . import views
from . views import ZahtjevListView,ZahtjevDetailView,ZahtjevCreateView

urlpatterns = [
    path('', views.ulazna, name='ulazna'),
    path('zahtjevi/',ZahtjevListView.as_view(),name="ZahtjevListView"),
    path('zahtjevi/<int:pk>',ZahtjevDetailView.as_view(),name="ZahtjevDetailView"),
    path('zahtjevi/novi',ZahtjevCreateView.as_view(),name="ZahtjevCreateView"),
    #path('zahtjevi/', views.zahtjevi, name='zahtjevi'),
    path('lokacije/', views.lokacije, name='lokacije'),
    path('org_struktura/',views.org_struktura,name='org_struktura'),
    path('uredaji/',views.uredaji, name='uredaji')
]