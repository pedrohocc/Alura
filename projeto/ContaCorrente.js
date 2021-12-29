import {Cliente} from "./Cliente.js"
export class ContaCorrente{
    static NumeroDeContas = 0;

    constructor(agencia, cliente) {
        this.agencia = agencia;
        this.cliente = cliente;
        this._saldo = 0;
        ContaCorrente.NumeroDeContas += 1;
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
    
    sacar(valor){
        if(this._saldo >= valor){
            this._saldo -= valor;
            return valor;
        }
    }

    depositar(valor){
        if(valor <= 0)
        {
            return;
        } 
        this._saldo += valor;  
        return valor;         
    }

    transferir(valor, conta) {
        const ValorSacado = this.sacar(valor);
        conta.depositar(ValorSacado);
    }
}