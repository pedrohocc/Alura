def jogar():
    print('*'*50)
    print('Bem vindo ao jogo da forca!')
    print('*'*50)
    
    palavra_secreta = 'banana'
    
    enforcou = False
    
    acertou = False
    
    index = 0
    
    while(not enforcou and not acertou ):
        letra = input('Digite uma letra? ').strip().lower()
        for contador in palavra_secreta:
            if(letra == contador):
                print('Encotrei a letra "{}" na posição {}'.format(contador.upper(), index))
            index += 1
        print('jogando...')
                
    print('Fim de jogo.')
if (__name__ == '__main__'):
    jogar()