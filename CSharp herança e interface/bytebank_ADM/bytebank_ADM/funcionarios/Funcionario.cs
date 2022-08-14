using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace bytebank_ADM.funcionarios
{
    public abstract class Funcionario
    {
        private string _nome;
        private string _cpf;
        protected double _salario;

        public string Nome { get => _nome; private set { } }
        public string Cpf { get => _cpf; private set { } }
        public double Salario { get => _salario; private set { } }

        public static int totalFuncionarios { get; private set; }

        public Funcionario(string nome, string cpf, double salario)
        {
            this._nome = nome;
            this._cpf = cpf;
            this._salario = salario;
            totalFuncionarios++;
        }
        public abstract double Bonificacao();

        public abstract void AumentarSalario();

        public string Senha { get; set; }

        public bool Autenticar(string senha)
        {
            return this.Senha == senha;
        }

    }
}
