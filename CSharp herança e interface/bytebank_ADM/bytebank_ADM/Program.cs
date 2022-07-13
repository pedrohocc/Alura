using bytebank_ADM.funcionarios;

Console.WriteLine("Bem vindo ao ByteBank Administrativo!");

Funcionario pedro = new("Pedro Cruz", "000.000.000-31", 2500);

Console.WriteLine($"A Bonificação do Funcionário {pedro.Nome} cujo o CPF é {pedro.Cpf} é igual a R$ R$ {pedro.Bonificacao()}");