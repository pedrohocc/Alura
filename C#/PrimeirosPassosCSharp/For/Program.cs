using System;
class Pograma
{
    static void Main(string[] arg)
    {
        double investimento = 1000.0;

        for (int i = 0; i <= 12; i++)
        {
            investimento *= 1.005;
            Console.WriteLine("O Resultado final da sua operação foi R$ " + investimento);
        }


    }
}
