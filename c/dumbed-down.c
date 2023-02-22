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
#include <errno.h>

#define DEFAULT_N_NAMES 1

#define MIN_LEN 3
#define MAX_LEN 9

char tmp_result[MAX_LEN + 1]; // Extra byte for \0
const char vowels[] = "aeiouy";
const char consonants[] = "bcdfghjklmnpqrstvwxz";

static inline void set_seed()
{
    // srand(time(NULL)); could work, but its resolution is just one second.
    // This has nanosecond resolution, I guess.
    struct timespec curr_time;
    clock_gettime(CLOCK_REALTIME, &curr_time);
    srand((curr_time.tv_sec << 3) | (curr_time.tv_nsec & 0x7));
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
    if(argc > 1){
        char *after_num;
        // For those who doesn't know, strtol returns the number from the beginning of a string and then sets the secondargument's variable (which is after_num in this case) to the beginning of the non-number string. 10 is the base.
        n_names = strtol(argv[1], &after_num, 10);
        // If there's an error or the string doesn't end past the number, reset the value.
        if(errno || *after_num) n_names = DEFAULT_N_NAMES;
        else n_names = n_names >= 0 ? n_names : 0;
    }
    for(int i = 0; i < n_names; i++) gen_nick();
}
