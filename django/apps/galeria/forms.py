from django import forms
from apps.galeria.models import Fotografia

class FotografiaForm(forms.ModelForm):    
    class Meta:
        model = Fotografia
        exclude = ['publicado', 'usuario']
        labels = {
            'nome': 'Nome: ',
            'descricao': 'Descrição: ',
            'categoria': 'Categoria: ',
            'legenda': 'Legenda: ',
            'foto': 'Fotografia: ',
            'data': 'Data da Fotografia: ',
            'usuario': 'Autor: ',
        }
        widgets = {
            'nome': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nome da Fotografia'}),
            'categoria': forms.Select(attrs={'class': 'form-control', 'placeholder': 'Categoria da Fotografia'}),
            'legenda': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Legenda da Fotografia'}), 
            'descricao': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Descrição da Fotografia'}),
            'foto': forms.FileInput(attrs={'class': 'form-control', 'placeholder': 'Fotografia da Fotografia'}),
            'data': forms.DateInput(
                format='%d/%m/%Y',
                attrs={
                    'class': 'form-control',
                    'type': 'date',
                    'placeholder': 'Data da Fotografia',
                    }
                ),
        }
        
    def save(self, commit=True, user=None):
        fotografia = super(FotografiaForm, self).save(commit=False)
        
        fotografia.usuario = user
        fotografia.publicado = True
        
        if commit:
            fotografia.save()
            
        return fotografia