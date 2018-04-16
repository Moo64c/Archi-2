// Global debug variable.
#define debug 0

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
  // Specific input for this program.
  double epsilon = 0;
  int order = 0;
  // To be allocated later.
  int character = 0;
  int index = 0;

  // Tolerance.
//  scanf("epsilon = %lf\n", &epsilon);

  // Size of polynom.
//  scanf("order = %i\n", &order);

order = 2;

  // Allocate data and reset values.
  double coefficients[order + 1][2];
  for (int initIndex = 0; initIndex < order + 1; initIndex++) {
    coefficients[initIndex][0] = 0.0;
    coefficients[initIndex][1] = 0.0;
  }

  char acceptString[200];
  for (int coefficientindex = order; coefficientindex >= 0; coefficientindex--) {
    sprintf(acceptString, "coeff %d = %s %s", coefficientindex, "%lf", "%lf");
    printf ("accepting %s\n", acceptString);
    scanf(acceptString, &coefficients[coefficientindex][0], &coefficients[coefficientindex][1]);
    // Catch "\n".
    getchar();
  }
  printf("\nResult:\n");
  for (int printIndex = 0; printIndex <= order; printIndex++) {
    printf("(%lf + %lf) * x ^ %d ", coefficients[printIndex][0], coefficients[printIndex][1], printIndex);
  }
  printf("\n");

  return 0;
}
