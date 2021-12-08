export class conta_corrente {
    agencia;
    _saldo = 0;

    sacar(valor) {
        if (this._saldo >= valor) {
            this._saldo -= valor;
            return valor;
        }else {
            console.log('Valor passou do limite');
        }
    }

    deposito(valor) {
        if (valor <= 0) {
            return;
        }
        this._saldo += valor;
    }
}
