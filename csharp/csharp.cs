using System;
using System.Collections.Generic;

public class Nickgen
{
    public static char[] vowels = {'a', 'e', 'i', 'o', 'u', 'y'};
    public static char[] consonants = {'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z'};
  
    public static List<string> generate_nicks(int count)
    {
        List<string> nicks = new List<string>();
        string nick = "";
        Random random = new Random();
        for(int i = 0; i < count; i++)
        {
            for(int k = 0; k < random.Next(3, 7); k++)
            {
                if(random.Next(0, 2) == 1) {nick += $"{consonants[random.Next(0, 20)]}";}
                if(random.Next(0, 2) == 1) {nick += $"{vowels[random.Next(0, 6)]}";}
            }
            if(random.Next(0, 2) == 1) {nick += $"{random.Next(0, 1000)}";}
            nicks.Add(nick);
            nick = "";
        }
        return nicks;
    }

    public static void Main(string[] args)
    {
        int count = args.Length == 0 ? 10 : Int32.Parse(args[0]);
        Console.WriteLine(String.Join(", ", generate_nicks(count)));
    }
}
