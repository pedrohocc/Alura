using bytebank_ADM.funcionarios;
using bytebank_ADM.Utilitarios;
using bytebank_ADM.sistema_interno;

void CalcularBonificacao()
{
    GerenciadoDeBonificacao gerenciador = new();

    Designer pedro = new("Pedro", "000.000.000-01");

    Diretor jorge = new("Jorge", "000.000.000-02");

    Auxiliar rebeca = new("Rebeca", "000.000.000-03");

    Parceiro paula = new("Paula", "000.000.000-04");

    Desenvolvedor maria = new("Maria", "000.000.000-05");

    gerenciador.Registrar(pedro);
    gerenciador.Registrar(jorge);
    gerenciador.Registrar(rebeca);
    gerenciador.Registrar(paula);
    gerenciador.Registrar(maria);

    Console.WriteLine(gerenciador.Bonificacao());
}

void UsarSistema()
{
    SistemaInterno sistema = new();

    Diretor pedro = new("teste", "teste");
    pedro.Senha = "123";

    Parceiro ele = new("teste", "teste");
    ele.Senha = "123";

    sistema.Logar(pedro, "123");
    sistema.Logar(ele, "123");
}

CalcularBonificacao();

UsarSistema();