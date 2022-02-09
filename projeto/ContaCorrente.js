import { Conta } from "./Conta.js";

export class ContaCorrente extends Conta{
    static NumeroDeContas = 0;
    constructor(cliente, agencia) {
        super(0, cliente, agencia);
        ContaCorrente.NumeroDeContas += 1;
    }

    //sobreescrevendo o comportamento de sacar
    sacar(valor){
        let taxa = 1.1;
        return this._sacar(valor, taxa);
    }
}