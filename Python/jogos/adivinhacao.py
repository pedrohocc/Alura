import random
from unicodedata import name

def jogar():

    print('*'*50)
    print('Bem vindo ao jogo da adivinhação!')
    print('*'*50)

    numero_secreto = random.randrange(1,101)

    total_de_rodadas = 0

    pontos = 1000

    print('Escolha entre os níveis: fácil (1), médio (2) e difícil (3)')

    escolha_nivel = int(input('Escolha seu nível: '))

    if(escolha_nivel == 1):
        total_de_rodadas = 20
    elif(escolha_nivel == 2):
        total_de_rodadas = 10
    elif(escolha_nivel == 3):
        total_de_rodadas = 5
    else:
        print('Nivel inválido')
        total_de_rodadas = 0

    for rodada in range(1,total_de_rodadas+1):
        print('O número era {}'.format(numero_secreto))
        
        print('rodada {} de {}'.format(rodada, total_de_rodadas))
        
        resposta_usuario = input('Digite um número entre 1 e 100: ')

        resposta_usuario = int(resposta_usuario)
        
        if(resposta_usuario < 1 or resposta_usuario > 100):
            print('Número inválido')
            continue
            

        acertou = resposta_usuario == numero_secreto

        maior = resposta_usuario > numero_secreto

        menor = resposta_usuario < numero_secreto
        
        if (acertou == True):
            print('Você acertou!')
            print('Você fez {} pontos'.format(pontos))
            break
        else:
            if (maior):
                print('Seu palpite foi maior que o número secreto')
            elif(menor):
                print('Seu palpite foi menor que o número secreto')
            pontos_perdidos = abs(numero_secreto - resposta_usuario)
            pontos = pontos - pontos_perdidos

            

    print('fim do jogo!')
    
if (__name__ == '__main__'):
    jogar()