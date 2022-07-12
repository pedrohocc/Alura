using ByteBank;
using ByteBank.Titular;

Console.WriteLine("Bem vindo ao ByteBank, seu banco do futuro!");

Cliente cliente1 = new Cliente();
cliente1.Nome = "jorgin";
cliente1.CPF = "313.213.213-31";
cliente1.Profissao = "Jogador de paintball";

ContaCorrente Conta1 = new ContaCorrente("1235-x", 12345);
ContaCorrente Conta2 = new ContaCorrente("12ds35-x", 125345);
ContaCorrente Conta3 = new ContaCorrente("123sds5-x", 123495);

Console.WriteLine(ContaCorrente.contador);

Console.ReadKey();