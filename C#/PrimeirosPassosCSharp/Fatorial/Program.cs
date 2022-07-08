using System;
class Pograma
{
    static void Main(string[] arg)
    {
        int fatorial = 1;
        for (int i = 1; i <= 10; i++)
        {
            fatorial *= i;
            Console.WriteLine(fatorial);
        }
    }
}
