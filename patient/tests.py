from django.test import TestCase

from rest_framework.test import APIRequestFactory

from patient.models import Patient
from patient.views import PatientViewSet


class PatientTest(TestCase):
    """
    Patient test suites
    """

    def setUp(self):
        self.factory = APIRequestFactory()
        self.post = Patient.objects.create(name='jdoe', is_smoker=True, )

    # Useless test but it will validate deployement environement
    def test_get_patients(self):
        view = PatientViewSet.as_view({'get': 'list'})
        request = self.factory.get('api/patients/')
        response = view(request)

        self.assertEqual(response.status_code, 200)

    def test_get_patient(self):
        view = PatientViewSet.as_view({'get': 'list'})
        request = self.factory.get('api/patients/1/')
        response = view(request)

        self.assertEqual(response.status_code, 200)

    def test_dumby(self):
        self.assertEqual(True, True)
