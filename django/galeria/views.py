from django.shortcuts import render, get_object_or_404
from galeria.models import Fotografia

def index(request):
    fotografias = Fotografia.objects.order_by('-data_fotografia').filter(publicado=True)
    return render(request, 'galeria/index.html', {"cards": fotografias})

def imagem(request, fotografia_id):
    fotografia = get_object_or_404(Fotografia, pk=fotografia_id)
    return render(request, 'galeria/imagem.html', {"fotografia": fotografia})

def buscar(request):
    fotografias = Fotografia.objects.order_by('-data_fotografia').filter(publicado=True)
    
    if request.GET:
        pesquisa = request.GET['pesquisa']
        if pesquisa:
            fotografias = fotografias.filter(nome__icontains=pesquisa)
            
    return render(request, 'galeria/buscar.html', {"cards": fotografias})