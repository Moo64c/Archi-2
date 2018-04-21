// Global debug variable.
#define debug 0
#define RUN_LIMIT 100

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

extern double * invert_complex(double *);
extern double * add_complex(double *, double *);
extern double * subtract_complex(double *, double *);
extern double * multiply_complex(double *, double *);
extern double * divide_complex(double *, double *);
extern double * power_complex(double *, int);
extern double * apply_function(double **, int, double *);
extern double * newton_step(double **, int, double *);
extern double ** calculate_derivative(double **, int);

void print_polynomial(double ** coefficients, int order);
void print_complex(double * complex);

int main(void) {
    // Specific input for this program.
    double epsilon = 0;
    int order = 0;
    double initial[2];

    // Tolerance.
    scanf("epsilon = %lf\n", &epsilon);

    // Size of polynom.
    scanf("order = %i\n", &order);

    // COEFFICIENTS
    // Allocate data and reset values.
    double ** coefficients = (double **) malloc(sizeof(double *) * (order + 1));
    for (int initIndex = 0; initIndex < order + 1; initIndex++) {
        coefficients[initIndex] = (double *) malloc(sizeof(double) * 2);
        coefficients[initIndex][0] = 0.0;
        coefficients[initIndex][1] = 0.0;
    }

    char acceptString[200];
    for (int coefficientindex = order; coefficientindex >= 0; coefficientindex--) {
        sprintf(acceptString, "coeff %d = %s %s\n", coefficientindex, "%lf", "%lf");
        scanf(acceptString, &coefficients[coefficientindex][0], &coefficients[coefficientindex][1]);
    }
    if (debug > 0) {
      printf("epsilon: %e\norder: %d", epsilon, order);
      printf("\nResult:\n");
      print_polynomial(coefficients, order);
    }

    sprintf(acceptString, "initial = %s %s\n", "%lf", "%lf");
    scanf(acceptString, &initial[0], &initial[1]);

    int runs = 0;
    double * last;
    double * current = initial;
    double * current_value = apply_function(coefficients, order, current);
    double distance = sqrt(current_value[0] * current_value[0] + current_value[1] * current_value[1]);

    while ((distance > epsilon) && (runs < RUN_LIMIT)) {
      last = current;
      current = newton_step(coefficients, order, last);
      current_value = apply_function(coefficients, order, current);
      distance = sqrt(current_value[0] * current_value[0] + current_value[1] * current_value[1]);
      runs++;
    }

    // Done?
    printf("root = ");
    print_complex(current);

    return 0;
}

/**
 * Debug - print the polynomial equation.
 */
void print_polynomial(double ** coefficients, int order) {
  for (int printIndex = 0; printIndex <= order; printIndex++) {
    printf("(%lf + %lf) * x^%d", coefficients[printIndex][0], coefficients[printIndex][1], printIndex);
  }
  printf("\n");
}

/**
 * Fromat and print the complex number.
 */
void print_complex(double * complex) {
  printf("%e %ei\n", complex[0], complex[1]);
}

/**
 * Gets a derivative of a coefficient representation of a polynom.
 */
// double ** calculate_derivative(double ** coefficient, int order) {
//   double ** derivative = (double **) malloc((order) * sizeof(double));
//   for(int index = 1; index <= order ; index++){
//     derivative[index - 1] = (double *) malloc(2 * sizeof(double));
//     derivative[index - 1][0] = index * coefficient[index][0];
//     derivative[index - 1][1] = index * coefficient[index][1];
//   }
//   return derivative;
// }
