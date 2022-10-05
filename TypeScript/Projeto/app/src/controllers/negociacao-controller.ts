import { tempoExecucao } from '../decorators/logar-tempo.js';
import { DiaDaSemana } from '../enums/diasDaSemana.js';
import { Negociacao } from '../models/negociacao.js';
import { Negociacoes } from '../models/negociacoes.js';
import { NegociacoesService } from '../services/negociacoes-service.js';
import { MensagemView } from '../views/mensagem-view.js';
import { NegociacoesView } from '../views/negociacoes-view.js';

export class NegociacaoController {
    private inputData: HTMLInputElement;
    private inputQuantidade: HTMLInputElement;
    private inputValor: HTMLInputElement;
    private negociacoes = new Negociacoes();
    private negociacoesView = new NegociacoesView('#negociacoesView');
    private mensagemView = new MensagemView('#mensagemView');
    private negociacaoService = new NegociacoesService();

    constructor() {
        this.inputData = document.querySelector('#data') as HTMLInputElement;
        this.inputQuantidade = document.querySelector('#quantidade') as HTMLInputElement;
        this.inputValor = document.querySelector('#valor') as HTMLInputElement;
        this.negociacoesView.update(this.negociacoes);
    }

    @tempoExecucao()
    public adiciona(): void {
        const negociacao = Negociacao.criacao(
            this.inputData.value, 
            this.inputQuantidade.value, 
            this.inputValor.value
        );

        if(!this.diaUtil(negociacao.data)) {
            this.mensagemView.update("As operções só são aceitas em dias úteis (seg - sex)");
            return;
        } 
        
        this.negociacoes.adiciona(negociacao);
        this.limparFormulario();
        this.atualizaView();
    }

    public importaDados(): void {
        this.negociacaoService.obterNegociacoesDoDia()
        .then(negociacoesDeHoje => {
            negociacoesDeHoje.forEach( negociacao => {
                this.negociacoes.adiciona(negociacao);
            });
            this.negociacoesView.update(this.negociacoes);
        });
    }

    private diaUtil(data: Date): boolean { 
        return data.getDay() > DiaDaSemana.domingo && data.getDay() < DiaDaSemana.sabado;
    }

    

    private limparFormulario(): void {
        this.inputData.value = '';
        this.inputQuantidade.value = '';
        this.inputValor.value = '';
        this.inputData.focus();
    }

    private atualizaView(): void {
        this.negociacoesView.update(this.negociacoes);
        this.mensagemView.update('Negociação adicionada com sucesso');
    };
}
