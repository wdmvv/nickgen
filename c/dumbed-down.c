/*
 * A very dumbed-down version of c/c.c.
 * Always prints to stdout using printf.
 * Probably inefficient.
 *
 * Usage:
 *      cd c
 *      gcc dumbed-down.c -o dumbed-down
 *      # or make dumbed-down
 *      ./dumbed-down [# of names]
 *      ./dumbed-down
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define DEFAULT_N_NAMES 1

#define MIN_LEN 3
#define MAX_LEN 9

char tmp_result[MAX_LEN + 1]; // Extra byte for \0
const char vowels[] = "aeiouy";
const char consonants[] = "bcdfghjklmnpqrstvwxz";

static inline void set_seed()
{
    srand(time(NULL));
}

void gen_nick()
{
    char *tmp_ptr = tmp_result;

    // Max value of integer modulo n is n - 1
    int n_chars = rand() % (MAX_LEN - MIN_LEN + 1) + MIN_LEN;
    for(int i = 0; i < n_chars; i++){
        // Vowels 50% of the time, consonants too
        *tmp_ptr = rand() % 2 ?
                   vowels[rand() % (sizeof(vowels) - 1)] :
                   consonants[rand() % (sizeof(consonants) - 1)];
        tmp_ptr++;
    }
    *tmp_ptr = '\0';
    printf("%s\n", tmp_result);
}

int main(int argc, char* argv[]){
    set_seed();
    int n_names = DEFAULT_N_NAMES;
    // If arguments are supplied and is correct, set n_names.
    // BUG: Strings like 123asdf still gets interpreted but should be invalid.
    if(argc > 1) sscanf(argv[1], "%d", &n_names);
    for(int i = 0; i < n_names; i++) gen_nick();
}
