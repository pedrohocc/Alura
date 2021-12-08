import { cliente } from "./Cliente.js"; import { conta_corrente } from "./Conta_corrente.js";
const cliente1 = new cliente();
cliente1.nome = 'Ricardo';
cliente1.cpf = 11122233309;

const conta_corrente_cliente1 = new conta_corrente();
conta_corrente_cliente1.agencia = 1001;
conta_corrente_cliente1.deposito(100);
conta_corrente_cliente1.deposito(100);
conta_corrente_cliente1.deposito(100);
conta_corrente_cliente1.deposito(100);
const valor_sacado = conta_corrente_cliente1.sacar(100);

console.log(valor_sacado);
console.log(conta_corrente_cliente1);