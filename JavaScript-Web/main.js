function toca_som(seletorAudio) {

    const elemento = document.querySelector(seletorAudio);
    
    if (elemento && elemento.localName === 'audio') {
        
        elemento.play()
        
    } else {
        console.error('Elemento não encontrado ou Seletor inválido')
    }
    
}

const lista_teclas = document.querySelectorAll('.tecla');

for (let contador = 0; contador < lista_teclas.length; contador++) {

    const tecla = lista_teclas[contador]
    const nome = tecla.classList[1];
    const idAudio = `#som_${nome}`;

    tecla.onclick = function () {

        toca_som(idAudio);

    }

    tecla.onkeydown = function(evento_tecla) {

        let tecla_apertada = evento_tecla.code;

        tecla_apertada === 'Enter' || tecla_apertada === 'Space' ? tecla.classList.add('ativa') : console.log(false);

    }

    tecla.onkeyup = function() {
        
        tecla.classList.remove('ativa');
        
    }

}
