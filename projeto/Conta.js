//classe abstrata
export class Conta{
    constructor(saldoInicial, cliente, agencia){
        if(this.constructor == Conta){
            throw new Error("Não é permitido instanciar objeto do tipo conta diretamente, pois essa é uma classe abstrata");
        }
        this._saldo = saldoInicial;
        this._cliente = cliente;
        this._agencia = agencia;
    }

    set cliente(nome){
        if(nome instanceof Cliente){
            this._cliente = nome; 
        }
    }

    get cliente(){
        return this._cliente;
    }

    get saldo(){
        return this._saldo;
    }

    //método abstrato
    sacar(valor){
        throw new Error('O método sacar da Conta é abstrato, favor sobscrever')
    }

    _sacar(valor, taxa){
        const ValorSacado = taxa * valor;
        if(this._saldo >= ValorSacado){
            this._saldo -= ValorSacado;
            return ValorSacado;
        }
        return 0;
    }

    depositar(valor){
        this._saldo += valor;  
        return valor;         
    }

    transferir(valor, conta) {
        const ValorSacado = this.sacar(valor);
        conta.depositar(ValorSacado);
    }
}