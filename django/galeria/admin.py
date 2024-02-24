from django.contrib import admin

from galeria.models import Fotografia

class ListaFotografia(admin.ModelAdmin):
    list_display = ('id', 'nome', 'legenda', 'categoria', 'publicado')
    list_editable = ('publicado',)
    list_display_links = ('id', 'nome')
    search_fields = ('nome', 'id')
    list_filter = ('categoria',)
    list_per_page = 10


admin.site.register(Fotografia, ListaFotografia)