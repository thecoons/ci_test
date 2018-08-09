from rest_framework import serializers
from rest_framework.reverse import reverse

from .models import Patient


class PatientSerializer(serializers.ModelSerializer):

    class Meta:
        model = Patient
        fields = ('id', 'name', 'is_smoker', 'registration_date', 'links', )

    links = serializers.SerializerMethodField()

    def get_links(self, obj):
        request = self.context['request']
        return {
            'self': reverse(
                'patient-detail',
                kwargs={'pk': obj.pk},
                request=request,
            ),
        }
