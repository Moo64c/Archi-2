// Global debug variable.
#define debug 0
#define print_all_digits 0

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "stack.c"
#include "bn_operations.c"

/* Maximal line size */
#define MAX_LEN 10000

#define OP_ADD '+'
#define OP_SUBTRACT '-'
#define OP_MULTIPLY '*'
#define OP_DIVIDE '/'

char** split_string(char* buffer);
void clear_wordstack(char ** stack);

int stack_size = 0;

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

char** split_string(char* buffer) {
  int string_length = strlen(buffer);
  int index;
  int wordcount = 0;
  char ch;

  for (index = 0; index < string_length; index ++) {
      ch = buffer[index];
      if (ch == ' ' || (ch == '\0')) {
        // if the character is blank, or null byte add 1 to the wordcounter
        wordcount++;
      }
  }

  if (debug > 1) {
    printf("Found %i words\n", wordcount);
  }

  // Start up a neat little words array.
  char** words = (char **) malloc((wordcount+1) * (sizeof (char*)));

  char *pch = strtok (buffer, " \n");
  index = 0;
  while (pch != NULL)
  {
    // Get next part.
    if (strlen(pch) < 1) {
      // No need to add this part..
      stack_size = index;
      break;
    }
    // Create space for the new string.
    words[index] = malloc((strlen(pch) + 1) * sizeof(char));
    strcpy(words[index], pch);

    // Print for good measure.
    if (debug > 1) {
      printf("%d: %s\n", index, words[index]);
    }
    pch = strtok(NULL, " \n");
    index++;
    stack_size = index;
  }

  return words;
}

// Clean the memory from the stack variables.
void clear_wordstack(char ** stack) {
  for (int index = 0; index < stack_size; index++) {
    free(stack[index]);
  }
  free(stack);
}
