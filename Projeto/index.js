import { Cliente } from "./Cliente.js";
import { Gerente } from "./funcionarios/Gerente.js";
import { Diretor } from "./funcionarios/Diretor.js";
import { SistemaAutenticacao } from "./SistemaAutenticacao.js";

const diretor = new Diretor("Pedro", 20000, 12345678900);
diretor.cadastrarSenha("senha123");
const diretorLogado = SistemaAutenticacao.login(diretor, "senha123");

const gerente = new Gerente("Paulo", 9500, 22233344419);
gerente.cadastrarSenha("senha456");
const gerenteLogado = SistemaAutenticacao.login(gerente, "senha456");

const mylena = new Cliente("Mylena", 2344349343, 1978);
const mylenaLogado = SistemaAutenticacao.login(mylena, "1978");

console.log(mylenaLogado, gerenteLogado, diretorLogado);
