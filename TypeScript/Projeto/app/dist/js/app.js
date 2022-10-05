import { NegociacaoController } from './controllers/negociacao-controller.js';
const controller = new NegociacaoController();
const form = document.querySelector('.form');
if (form) {
    form.addEventListener('submit', event => {
        event.preventDefault();
        controller.adiciona();
    });
}
else {
    throw Error("verifique o form");
}
const botaoImportar = document.querySelector('#bnt-importar');
if (botaoImportar) {
    botaoImportar.addEventListener('click', () => {
        controller.importaDados();
    });
}
else {
    throw Error("Erro na ação de importar ");
}
