import { Negociacao } from "./negociacao.js";

export class Negociacoes {
    private negocicacoes: Negociacao[] = [];

    adiciona(negociacao: Negociacao) {
        this.negocicacoes.push(negociacao);
    }

    lista(): readonly Negociacao[] {
        return this.negocicacoes;
    }
}