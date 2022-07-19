using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using bytebank_ADM.funcionarios;

namespace bytebank_ADM.sistema_interno
{
    public class SistemaInterno
    {
        public bool Logar(IAutenticavel funcionario, string senha ) 
        {
            bool UsuarioAutenticado = funcionario.Autenticar(senha);

            if( UsuarioAutenticado)
            {
                Console.WriteLine("Bem vindo!");
                return true;
            }
            else
            {
                Console.WriteLine("Error!");
                return false;
            }
        }
    }
}
