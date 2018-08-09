from rest_framework.routers import DefaultRouter

from . import views

patients_router = DefaultRouter()
patients_router.register(r'patients', views.PatientViewSet)
