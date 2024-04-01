from django import forms

class LoginFormulario(forms.Form):
    login=forms.CharField(
        label='Login',
        required=True,
        max_length=100,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Digite seu login',
        }),
    )
    senha=forms.CharField(
        label='Senha',
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Digite sua senha',
        }),
        required=True,
        max_length=70,
    )
    
class CadastroForms(forms.Form):
    nome_cadastro=forms.CharField(
        label='Nome Completo',
        required=True,
        max_length=100,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Digite seu login',
        }),
    )
    email=forms.EmailField(
        label='Email',
        required=True,
        max_length=100,
        widget=forms.EmailInput(attrs={
            'class': 'form-control',
            'placeholder': 'Ex: usuario@email.com',
        })
    )
    senha=forms.CharField(
        label='Senha',
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Digite sua senha',
        }),
        required=True,
        max_length=70,
    )
    senha_confirmacao=forms.CharField(
        label='Confirme sua senha',
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Confirme sua senha',
        }),
        required=True,
        max_length=70,
    )
    
    def clean_nome_cadastro(self):
        nome = self.cleaned_data.get('nome_cadastro')
        
        if " " in nome:
            raise forms.ValidationError("O nome não pode conter espaços")
        else:
            return nome
        
    def clean_senha_confirmacao(self):
        senha = self.cleaned_data.get('senha')
        senha_confirmacao = self.cleaned_data.get('senha_confirmacao')
        
        if senha != senha_confirmacao:
            raise forms.ValidationError("As senhas não conferem")
        else:
            return senha_confirmacao