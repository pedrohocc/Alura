from django.urls import path
from apps.galeria.views import index, imagem, buscar, FotografiaCreateView, editar_fotografia, deletar_fotografia, filtro

urlpatterns = [
    path('', index, name='index'),
    path('imagem/<int:fotografia_id>', imagem, name='imagem'),
    path('buscar', buscar, name='buscar'),
    path('nova_fotografia', FotografiaCreateView.as_view(), name='nova_fotografia'),
    path('editar_fotografia/<int:fotografia_id>', editar_fotografia, name='editar_fotografia'),
    path('deletar_fotografia/<int:fotografia_id>', deletar_fotografia, name='deletar_fotografia'),
    path('filtro/<str:categoria>', filtro, name='filtro')
]
