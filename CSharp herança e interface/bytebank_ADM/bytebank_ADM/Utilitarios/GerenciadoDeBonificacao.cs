using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using bytebank_ADM.funcionarios;

namespace bytebank_ADM.Utilitarios
{
    public class GerenciadoDeBonificacao
    {
        private double _totalBonificacao;
        public double TotalBonificacao
        {
            get { return _totalBonificacao; }
            set { _totalBonificacao = value; }
        }

        public void Registrar(Funcionario funcionario )
        {
            TotalBonificacao += funcionario.Bonificacao();
        }

        public double Bonificacao()
        {
            return TotalBonificacao;
        }
    }
}
