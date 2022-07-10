namespace ByteBank
{
    public class ContaCorrente
    {
        public string titular;
        public string conta;
        public int NumeroAgencia;
        public string NomeAgencia;
        public double saldo;

        public bool Sacar(double valor)
        {
            if(valor > saldo)
            {
                return false;
            }
            else if (valor < 0)
            {
                return false;
            }
            else if (valor <= saldo) 
            {
                saldo = saldo - valor;
                return true;
            }
            else
            {
                return false;
            }
        }

        public void Depositar(double valor)
        {
            if (valor > 0)
            {
                saldo = saldo + valor;
            }
        }

        public bool Transferir(double valor, ContaCorrente destino)
        {
            if (valor > saldo)
            {
                return false;
            }
            else if (valor < 0)
            {
                return false;
            }
            else if (valor <= saldo)
            {
                saldo = saldo - valor;
                destino.saldo = destino.saldo + valor;
                return true;
            }
            else
            {
                return false;
            }
        }

        public void Informacoes()
        {
            Console.WriteLine(titular);
            Console.WriteLine(conta);
            Console.WriteLine(NumeroAgencia);
            Console.WriteLine(NomeAgencia);
            Console.WriteLine(saldo);
        }
    }
}