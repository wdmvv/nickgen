#include <iostream>
#include <string.h>
#include <chrono>

int main(int argc, char *argv[])
{
    int count = 10;
    if(argv[1] != NULL)
    {
        count = atoi(argv[1]);
    }

    const char vowels[] = {'a', 'e', 'i', 'o', 'u', 'y'};
    const char consonants[] = {'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'z'};
    std::string nick;
    for(int i = 0; i < count; i++)
    {
        srand(std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
        for(int i = 0; i < (rand() % 5 + 2); i++)
        {
            if(rand() % 2 == 1)
            {
                for(int i = 0; i < (rand() % 3 + 1); i++)
                {
                    nick += vowels[(rand() % 5)];
                }
            }
            else
            {
                for(int i = 0; i < (rand() % 3 + 1); i++)
                {
                    nick += consonants[(rand() % 20)];
                }
            }
        }

        for(int i = 0; (rand() % 4) > i ; i++)
        {
            nick += std::to_string((rand() % 10));
        }

        std::cout << nick << std::endl;
        nick = "";
    }
    return 0;
}
