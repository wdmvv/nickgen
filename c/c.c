#include <stdlib.h>
#include <unistd.h>
#include <time.h>

/* Not worth the function definition. */
#define FLUSH write (1, buffer, fill_ptr)
/* Always inline. */
#define IF_FULL fill_ptr > 16438 ? write_wrap (1, buffer, fill_ptr) : 0

char buffer[16448]; /* Must use the CPU cache to buffer the most we can. */
size_t fill_ptr = 0; /* We must know where the fill pointer is. */

const char* vowels = "aeiouy";
const char* consonants = "bcdfghjklmnpqrstvwxz";

/* Praying GCC inlines this. */
int __attribute__ ((always_inline))
write_wrap (int fd, void* buffer, size_t count)
{
  write (fd, buffer, count); fill_ptr = 0; 
}

int gen_nick ()
{
  int limit = 3 + (random () % 7);
  for (int i = 0; i < limit; i++)
    {
      if (random () % 2)
        buffer[i + fill_ptr] = vowels[(random () % 6)];
      else
        buffer[i + fill_ptr] = consonants[(random () % 19)];
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
      buffer[limit + fill_ptr] = '\n';

      /* Increment the buffer fill pointer */
      fill_ptr += limit + 1;

      /* Write buffer if it is about to overflow. */
      IF_FULL;
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
  FLUSH;
  return EXIT_SUCCESS;
}
