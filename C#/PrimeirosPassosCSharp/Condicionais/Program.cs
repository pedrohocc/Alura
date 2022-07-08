using System;
class Pograma
{
    static void Main(string[] arg)
    {
        int IdadeJoao = 15;
        int QuantidadePessoas = 2;

        if (IdadeJoao >= 18)
        {
            Console.WriteLine("Entrada AUTORIZADA (Maior de idade)");
        }
        else
        {
            if (QuantidadePessoas > 1)
            {
                Console.WriteLine("Entrada AUTORIZADA com responsável (Menor de idade)");
            }
            else
            {
                Console.WriteLine("Entrada NÃO AUTORIZADA (Menor de idade)");
            }
        }
    }
}
