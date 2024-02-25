from django.shortcuts import render
from usuarios.forms import LoginFormulario, CadastroForms

def login(request):
    form = LoginFormulario()
    return render(request, 'usuarios/login.html', {"form": form})

def cadastro(request):
    form = CadastroForms()
    return render(request, 'usuarios/cadastro.html', {"form": form})