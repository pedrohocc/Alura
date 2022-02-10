import {Cliente} from "./Cliente.js";
import { ContaCorrente } from "./ContaCorrente.js";
import { ContaPoupanca } from "./ContaPoupanca.js";
import { Conta } from "./Conta.js";

const cliente1 = new Cliente("Ricardo", 11122233390);

const ContaCorrente1 = new ContaCorrente(cliente1, 1001);
const contaPoupanca = new ContaPoupanca(50, cliente1, 1002);
const conta = new Conta(0, cliente1, 1003);

console.log(conta);