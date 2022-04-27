import { Negociacao } from "./negociacao.js";

export class Negociacoes {
    private negocicacoes: Array<Negociacao> = [];

    adiciona(negociacao: Negociacao) {
        this.negocicacoes.push(negociacao);
    }

    lista(): ReadonlyArray<Negociacao> {
        return this.negocicacoes;
    }
}