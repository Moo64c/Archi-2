// Global debug variable.
#define debug 0

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* Maximal line size */
#define MAX_LEN 10000

int main(void) {
  char ** stack = 0;

  // Set starting values for valgrind reasons.
  char str_buf[MAX_LEN];
  for (int initIndex = 0; initIndex < MAX_LEN; initIndex++) {
    str_buf[initIndex] = 0;
  }

  /* Read user's command line string */
  int epsilon = 0;
  int order = 0;
  int * coefficient = NULL;
  int character = 0;
  int index = 0;
  while ((character = fgetc(stdin)) != EOF) {
    str_buf[index] = character;
    index++;
  }



  return 0;
}
