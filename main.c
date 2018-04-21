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

void print_polynomial(double ** coefficients, int order);
void print_complex(double * complex);
double * apply_function(double ** coefficient, int order, double * value);
double * newton_step(double ** coefficient, int order, double * current_value);
double ** calculate_derivative(double ** coefficient, int order);

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
 * Gets the result of applying a polynomial function with a specific value.
 */
double * apply_function(double ** coefficients, int order, double * value) {
    //
    double * result = (double *) malloc(2 * sizeof(double));
    result[0] = 0.0;
    result[1] = 0.0;
    for (int index = 0; index <= order; index++) {
      // Calculate value ^ (current order) * coefficient.
      double * step = power_complex(value, index);
      step = multiply_complex(step, coefficients[index]) ;
      // A
      result[0] += step[0];
      result[1] += step[1];
      // Cleanp.
      free(step);
    }

    return result;
}

/**
 * Gets a derivative of a coefficient representation of a polynom.
 */
double ** calculate_derivative(double ** coefficient, int order) {
  double ** derivative = (double **) malloc((order) * sizeof(double));
  for(int index = 1; index <= order ; index++){
    derivative[index - 1] = (double *) malloc(2 * sizeof(double));
    derivative[index - 1][0] = index * coefficient[index][0];
    derivative[index - 1][1] = index * coefficient[index][1];
  }
  return derivative;
}

/**
 * Divide complex1 by complex2.
 */
// double * divide_complex(double * complex1, double * complex2) {
//     double * result = (double *) malloc(2 * sizeof(double));
//     double * inverted_denominator = invert_complex(complex2);
//
//     result = multiply_complex(complex1, inverted_denominator);
//     double norma = (complex2[0] * complex2[0]) + (complex2[1] * complex2[1]);
//     // (a+bi) / (c+di) = ((a+bi)*(c-di))/((c+di)(c-di)) = ((a+bi)*(c-di))/(c^2 +d^2)
//
//     result[0] = result[0] / norma;
//     result[1] = result[1] / norma;
//
//     // Cleanup.
//     free(inverted_denominator);
//     return result;
// }

/**
 * Create next Z_n in the Newton-Raphson analysis.
 */
double * newton_step(double ** coefficients, int order, double * current_value) {
  double * result = (double *) malloc(2 * sizeof(double));

  // f'
  double ** derivative = calculate_derivative(coefficients, order);

  double * function_value = apply_function(coefficients, order, current_value);
  double * derivative_value = apply_function(derivative, order - 1, current_value);
  // f(z_n) / f'(z_n).
  double * divide_result = divide_complex(function_value, derivative_value);

  // Clean up.
  free(function_value);
  free(derivative_value);

  // z_n - (f(z_n) / f'(z_n)).
  result = subtract_complex(current_value, divide_result);
  free(divide_result);

  return result;
}
