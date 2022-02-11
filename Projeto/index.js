import { Cliente } from "./Cliente.js";
import { Gerente } from "./funcionarios/Gerente.js";
import { Diretor } from "./funcionarios/Diretor.js";
import { SistemaAutenticacao } from "./SistemaAutenticacao.js";

const diretor = new Diretor("Pedro", 20000, 12345678900);
diretor.cadastrarSenha("senha123");

const gerente = new Gerente("Paulo", 9500, 22233344419);
gerente.cadastrarSenha("123");

const logado = SistemaAutenticacao.login(gerente, "123");

console.log(logado);