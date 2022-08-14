using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using bytebank_ADM.funcionarios;

namespace bytebank_ADM.sistema_interno
{
    public interface IAutenticavel
    {
        public bool Autenticar(string senha);

    }
}
