from django.shortcuts import  redirect, render, get_object_or_404
from django.urls import reverse_lazy
from apps.galeria.forms import FotografiaForm
from apps.galeria.models import Fotografia
from django.contrib import messages
from django.views.generic import CreateView
from django.contrib.auth.mixins import LoginRequiredMixin

def index(request):
    if not request.user.is_authenticated:
        messages.error(request, 'Você precisa estar logado para acessar a página de galeria.')
        return redirect('login')
    
    fotografias = Fotografia.objects.order_by('-data_fotografia').filter(publicado=True)
    return render(request, 'galeria/index.html', {"cards": fotografias})

def imagem(request, fotografia_id):
    fotografia = get_object_or_404(Fotografia, pk=fotografia_id)
    return render(request, 'galeria/imagem.html', {"fotografia": fotografia})

def buscar(request):
    if not request.user.is_authenticated:
        messages.error(request, 'Você precisa estar logado para acessar a página de galeria.')
        return redirect('login')
    
    
    fotografias = Fotografia.objects.order_by('-data_fotografia').filter(publicado=True)
    
    if request.GET:
        pesquisa = request.GET['pesquisa']
        if pesquisa:
            fotografias = fotografias.filter(nome__icontains=pesquisa)
            
    return render(request, 'galeria/index.html', {"cards": fotografias})

class FotografiaCreateView( LoginRequiredMixin, CreateView):
    model = Fotografia
    template_name = 'galeria/nova_fotografia.html'
    form_class = FotografiaForm
    success_url = reverse_lazy('index')
    login_url = reverse_lazy('login')
    
    def form_valid(self, form):
        form.save(commit=True, user=self.request.user)
        return super().form_valid(form)
    
def editar_fotografia(request, fotografia_id):
    fotografia = get_object_or_404(Fotografia, pk=fotografia_id)
    
    if request.method == 'POST':
        form = FotografiaForm(request.POST, request.FILES, instance=fotografia)
        
        if form.is_valid():
            form.save()
            return redirect('index')
        
    form = FotografiaForm(instance=fotografia)
        
    return render(request, 'galeria/editar_fotografia.html', {"form": form, 'fotografia_id': fotografia_id})

def deletar_fotografia(request, fotografia_id):
    
    fotografia = get_object_or_404(Fotografia, pk=fotografia_id)
    fotografia.delete()
    
    return redirect('index')

def filtro(request, categoria):
    fotografias = Fotografia.objects.order_by('-data_fotografia').filter(publicado=True, categoria=categoria)
    return render(request, 'galeria/index.html', {"cards": fotografias})