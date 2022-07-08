using System;
class Pograma
{
    static void Main(string[] arg)
    {
        double investimento = 1000.0;
        int mes = 1;

        while(mes <= 12)
        {
            investimento = investimento + (investimento * 0.005 );
            Console.WriteLine("O Resultado final da sua operação foi R$ " + investimento);
            mes++;
        }
        

    }
}
