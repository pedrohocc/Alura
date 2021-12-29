import {Cliente} from "./Cliente.js";
import { Conta } from "./Conta.js";

const cliente1 = new Cliente("Ricardo", 11122233390);

const ContaCorrente1 = new Conta(0, cliente1, 1001);
ContaCorrente1.depositar(500);
ContaCorrente1.sacar(100);

const contaPoupanca = new Conta(50, cliente1, ContaCorrente1._agencia);

console.log(ContaCorrente1);
console.log(contaPoupanca);
