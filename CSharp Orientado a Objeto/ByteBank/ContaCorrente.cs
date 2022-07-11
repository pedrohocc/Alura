using ByteBank.Titular;

namespace ByteBank
{
    public class ContaCorrente
    {
        public Cliente Titular { get; set; }

        private string _conta;
        public string Conta 
        { 
            get
            {
                return _conta;
            }
            set
            {
                if (value == " " || value.Length <= 3)
                {
                    return;
                }
                _conta = value;
            }
        }

        private int _numeroAgencia;
        public int NumeroAgencia 
        {
            get
            {
                return _numeroAgencia;
            }
            set
            {
                if (value < 0)
                {
                    return;
                }
                _numeroAgencia = value;
            }
        }
        public string NomeAgencia { get; set; }

        private double saldo;
        public double Saldo
        {
            set
            {
                if (value < 0)
                {
                    return;
                }
                saldo = value;
            }
            get
            {
                return saldo;

            }
        }

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
        public static int contador { get; set; }
        public ContaCorrente(Cliente titular, string nome_agencia, int numero_agencia, string conta)
        {
            Titular = titular;
            NomeAgencia = nome_agencia;
            NumeroAgencia = numero_agencia;
            Conta = conta;
        }

    }
}