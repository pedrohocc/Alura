using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace bytebank_ADM.funcionarios
{
    public class Designer : Funcionario
    {
        public Designer(string nome, string cpf) : base(nome, cpf, 3000) { }
        public override double Bonificacao()
        {
            return Salario * 0.17;
        }
        public override void AumentarSalario()
        {
            this._salario *= 1.11;
        }
    }
}
