using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace bytebank_ADM.funcionarios
{
    public class Funcionario
    {
        private string _nome;
        private string _cpf;
        private double _salario;

        public string Nome { get => _nome; set => _nome = value; }
        public string Cpf { get => _cpf; set => _cpf = value; }
        public double Salario { get => _salario; set => _salario = value; }

        public double Bonificacao()
        {
            return Salario * 0.1;
        }

        public Funcionario(string nome, string cpf, double salario)
        {
            Nome = nome;
            Cpf = cpf;
            Salario = salario;
        }
    }
}
