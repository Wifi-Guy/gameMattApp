from django.db import models
import uuid

# Create your models here.


class Game(models.Model):
    game_id = models.UUIDField(
        primary_key=True,
        default=uuid.uuid4,
        editable=False)
    game_name = models.CharField(max_length=200)
    release_date = models.DateTimeField()
    already_bought = models.BooleanField()
