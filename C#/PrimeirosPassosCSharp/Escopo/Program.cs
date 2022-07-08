using System;
class Pograma
{
    static void Main(string[] arg)
    {
        int IdadeJoao = 18;
        int QuantidadePessoas = 1;
        bool Acompanhado = QuantidadePessoas > 1;
        string TextoAdicional;

        if (Acompanhado)
        {
            TextoAdicional = "João está acompanhado!";
        } 
        else
        {
            TextoAdicional = "João não está acompanhado!";
        }

        if (IdadeJoao >= 18 || Acompanhado)
        {
            Console.WriteLine(TextoAdicional);
            Console.WriteLine("Entrada AUTORIZADA");
        }
        else
        {
            Console.WriteLine(TextoAdicional);
            Console.WriteLine("Entrada NÃO AUTORIZADA");
        }
    }
}
