using System;
class Pograma
{
    static void Main(string[] arg)
    {
        int IdadeJoao = 15;
        bool Acompanhado = true;

        if (IdadeJoao >= 18 || Acompanhado)
        {
            Console.WriteLine("Entrada AUTORIZADA");
        }
        else
        {
            Console.WriteLine("Entrada NÃO AUTORIZADA");
        }
    }
}
