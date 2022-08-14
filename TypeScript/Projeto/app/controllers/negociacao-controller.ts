import { Negociacao } from "../models/negociacao.js";
import { Negociacoes } from "../models/negociacoes.js";
import { Negociacoesview } from "../views/negociacoes-view.js";

export class NegociacaoController {
    private inputData: HTMLInputElement;
    private inputQuantidade: HTMLInputElement;
    private inputValor: HTMLInputElement;
    private negociacoes = new Negociacoes();
    private negociacoesview = new Negociacoesview("#negociacoesview");

    constructor() {
        this.inputData = document.querySelector('#data');
        this.inputQuantidade = document.querySelector('#quantidade');
        this.inputValor = document.querySelector('#valor');
        this.negociacoesview.update(this.negociacoes);
    }

    adiciona(): void {

        const negociacao = this.criaNegociacao()

        this.negociacoes.adiciona(negociacao)

        negociacao.data.setTime(12)

        this.negociacoesview.update(this.negociacoes)

        this.limpar()
    }
    
    criaNegociacao(): Negociacao {
        
        const exp = /-/g;
        const date = new Date(this.inputData.value.replace(exp, ','))
        const quantidade = parseInt(this.inputQuantidade.value)
        const valor = parseFloat(this.inputValor.value)
    
        return new Negociacao(date, quantidade, valor);
        
    }


    limpar(): void {
        this.inputData.value = ''
        this.inputQuantidade.value = ''
        this.inputValor.value = ''
        this.inputData.focus();
    }
}