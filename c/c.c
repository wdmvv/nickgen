#include <stdlib.h>
#include <unistd.h>
#include <time.h>

char buffer[16]; /* The strings we need not even get over 10 characters. */

const char* vowels = "aeiouy";
const char* consonants = "bcdfghgjklmnpqrstvwxz";

int gen_nick ()
{
  int limit = 3 + (random () % 7);
  for (int i = 0; i < limit; i++)
    {
      if (random () % 2)
        buffer[i] = vowels[(random () % 6)];
      else
        buffer[i] = consonants[(random () % 19)];
    }
  return limit; /* Length of the generated string. */
}

void
gen_nicks (int count)
{
  int limit = 0;
  for (int i = 0; i < count; i++)
    {
      limit = gen_nick ();
      /* Let the fore character of the generated nick be a newline character.
      ** Remember C indexes from 0, so limit is the next character of our
      ** nickname */
      buffer[limit] = '\n';
      
      /* 1 == standard output. */
      write (1, buffer, limit + 1);
    }
}

/* We need a way to have real randomness, opposed of having random() yield the
** exact same numbers between program executions */
void
seed_time (void)
{
  struct timespec current_time;
  clock_gettime (CLOCK_REALTIME,&current_time);
  srandom ((current_time.tv_sec << 3) | (current_time.tv_nsec & 0x7));
}

int
main (void)
{
  seed_time ();
  gen_nicks (1000);
  return EXIT_SUCCESS;
}
