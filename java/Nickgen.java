import java.util.concurrent.ThreadLocalRandom;

public class Nickgen 
{
    public static void main(String[] args)
    {
        int nickCount = 10;
        if(args.length > 0) {nickCount = Integer.parseInt(args[0]);}
        final char[] vowels = {'a', 'e', 'i', 'o', 'u', 'y'};
        final char[] consonants = {'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z'};
        String nick = "";

        for(int i = 0; i < nickCount; i++)
        {  
            for(int k = 0; k < (ThreadLocalRandom.current().nextInt(3) + 4); k++)
            {
                if(ThreadLocalRandom.current().nextBoolean() == true)
                {
                    for(int n = 0; n < (ThreadLocalRandom.current().nextInt(1) + 1); n++)
                    {
                        nick += consonants[ThreadLocalRandom.current().nextInt(19)];
                    }
                }
                else
                {
                    for(int n = 0; n < (ThreadLocalRandom.current().nextInt(1) + 1); n++)
                    {
                        nick += vowels[ThreadLocalRandom.current().nextInt(5)];
                    }
                }
            }
            for(int m = 0; m < (ThreadLocalRandom.current().nextInt(3)); m++)
            {
                nick += ThreadLocalRandom.current().nextInt(9);
            }
            System.out.println(nick);
            nick = "";
        }
    }
}
