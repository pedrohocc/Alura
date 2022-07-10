using ByteBank;

Console.WriteLine("Bem vindo ao ByteBank, seu banco do futuro!");

ContaCorrente Conta1 = new ContaCorrente();
Conta1.titular = "Andressa Bessa";
Conta1.conta = "12345-x";
Conta1.NumeroAgencia = 12345;
Conta1.NomeAgencia = "Central";
Conta1.saldo = 90.55;

ContaCorrente Conta2 = new ContaCorrente();
Conta2.titular = "Andressa Besta";
Conta2.conta = "12345-x";
Conta2.NumeroAgencia = 12345;
Conta2.NomeAgencia = "Central";
Conta2.saldo = 100;

Console.WriteLine(Conta2.Informacoes);

Console.ReadKey();