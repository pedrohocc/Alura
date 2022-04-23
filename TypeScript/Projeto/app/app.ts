import { NegociacaoController } from "./controllers/negociacao-controller.js";

const controller = new NegociacaoController();
const from = document.querySelector('.form')

from.addEventListener('submit', Event => {
    Event.preventDefault()
    controller.adiciona();
})