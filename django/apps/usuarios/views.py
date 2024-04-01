from django.shortcuts import redirect, render
from apps.usuarios.forms import LoginFormulario, CadastroForms
from django.contrib.auth.models import User
from django.contrib import auth, messages

def login(request):
    form = LoginFormulario()
    
    if request.method == 'POST':
        form = LoginFormulario(request.POST)
        
        if form.is_valid():
            nome = form['login'].value()
            senha = form['senha'].value()
            
            usuario = auth.authenticate(
                username=nome,
                password=senha
            )
            
            if usuario is not None:
                auth.login(request, usuario)
                messages.success(request, "Login efetuado com sucesso")
                return redirect('index')
            else:
                messages.error(request, "Usuário ou senha inválidos")
                return redirect('login')
    
    return render(request, 'usuarios/login.html', {"form": form})

def cadastro(request):
    form = CadastroForms()

    if request.method == "POST":
        form = CadastroForms(request.POST)
            
        if form.is_valid():
            nome = form['nome_cadastro'].value()    
            email = form['email'].value()
            senha = form['senha'].value()
            
            if User.objects.filter(username=nome).exists():
                messages.error(request, "Usuário já existe")
                return redirect('cadastro')
                
            usuario = User.objects.create_user(
                username=nome,
                email=email,
                password=senha
            )
            usuario.save()
            messages.success(request, "Usuário cadastrado com sucesso")
            return  redirect('login')
    
    return render(request, 'usuarios/cadastro.html', {"form": form})

def logout(request):
    auth.logout(request)
    messages.success(request, "Logout efetuado com sucesso")
    return redirect('login')