from django.db import models


class Patient(models.Model):
    """
    Patient model class.
    """
    name = models.CharField(max_length=100, blank=True, default='')
    is_smoker = models.BooleanField(default=False)
    registration_date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name
