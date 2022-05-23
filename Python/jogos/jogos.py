import forca
import adivinhacao

def menu():
    print('*'*50)
    print('Escolha seu jogo!')
    print('*'*50)

    print('Jogo da forca (1) ou jogo da adivinhação (2)')

    escolha_do_jogo = int(input('Digite o jogo escolhido'))

    if (escolha_do_jogo == 1):
        print('jogando forca')
        forca.jogar()
    elif (escolha_do_jogo == 2):
        print('jogando adivinhação')
        adivinhacao.jogar()
    else:
        print('error')        
        
if (__name__ == '__main__'):
    menu()