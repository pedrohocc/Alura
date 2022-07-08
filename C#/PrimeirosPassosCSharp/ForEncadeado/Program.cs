using System;
class Pograma
{
    static void Main(string[] arg)
    {
        double fator = 1.005;
        double investimento = 1000.0;

        for (int anos = 1; anos <= 5; anos++)
        {
            for (int meses = 1; meses <= 12; meses++)
            {
                investimento *= fator;
            }
            fator += 0.001;
        }

        Console.WriteLine("Depois de 5 anos você terá R$ " + investimento);
    }
}
