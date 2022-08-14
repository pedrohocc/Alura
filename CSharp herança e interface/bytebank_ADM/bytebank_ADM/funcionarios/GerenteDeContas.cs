using bytebank_ADM.sistema_interno;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace bytebank_ADM.funcionarios
{
    public class Parceiro : FuncionarioAutenticavel
    {
        public Parceiro(string nome, string cpf) : base(nome, cpf, 4000) { }
        public override double Bonificacao()
        {
            return Salario * 0.25;
        }
        public override void AumentarSalario()
        {
            this._salario *= 1.5;
        }

    }
}
