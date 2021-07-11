from django.http import HttpResponse
from .models import Game
from django.template import loader


def index(request):
    template = loader.get_template('soon_index.html')

    return HttpResponse(template.render({'game_list': Game.objects.all()}, request))
