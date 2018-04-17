// Global debug variable.
#define debug 0

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

double * power_complex(double * complex, int power);
double * add_complex(double * complex1, double * complex2)
double * subtract_complex(double * complex1, double * complex2)
double * multiply_complex(double * complex1, double * complex2);
double * divide_complex(double * complex1, double * complex2);
double * invert_complex(double * complex);
double * apply_function(double coefficient[][2], int order, double * value);
double * newton_step(double coefficient[][2], double * current_value);
double ** calculate_derivative(double coefficient[][2], int order);

int DOUBLE_SIZE = 2;

int main(void) {
    // Specific input for this program.
    double epsilon = 0;
    int order = 0;
    DOUBLE_SIZE = (int) sizeof(double);
    // To be allocated later.

    // Tolerance.
    scanf("epsilon = %lf\n", &epsilon);

    // Size of polynom.
    scanf("order = %i\n", &order);

    // COEFFICIENTS
    // Allocate data and reset values.
    double coefficients[order + 1][2];
    for (int initIndex = 0; initIndex < order + 1; initIndex++) {
        coefficients[initIndex][0] = 0.0;
        coefficients[initIndex][1] = 0.0;
    }

    char acceptString[200];
    for (int coefficientindex = order; coefficientindex >= 0; coefficientindex--) {
        sprintf(acceptString, "coeff %d = %s %s", coefficientindex, "%lf", "%lf");
        scanf(acceptString, &coefficients[coefficientindex][0], &coefficients[coefficientindex][1]);
        // Catch "\n".
        getchar();
    }
    printf("\nResult:\n");
    for (int printIndex = 0; printIndex <= order; printIndex++) {
        printf("(%lf + %lf) * x ^ %d ", coefficients[printIndex][0], coefficients[printIndex][1], printIndex);
    }

    printf("\n");

<<<<<<< HEAD
    double * result = apply_function(coeff, 2, value);
=======
    // INITIAL

    sprintf(acceptString, "initial = %s %s", "%lf", "%lf");
    scanf(acceptString, &initial[0], &initial[1]);
    // Catch "\n".
    getchar();
>>>>>>> c97c085694b75cd25ce632b9754db279570890a2

    return 0;
}

/**
 * Gets the result of applying a polynomial function with a specific value.
 */
double * apply_function(double coefficient[][2], int order, double * value) {
    //
    double * result = (double *) malloc(2 * sizeof(double));
    result[0] = 0.0;
    result[1] = 0.0;
    for (int index = 0; index <= order; index++) {
        // Calculate value ^ (current order) * coefficient.
        double * step = power_complex(value, index);
        step = multiply_complex(step, coefficient[index]) ;
        // A
        result[0] += step[0];
        result[1] += step[1];
        // Cleanp.
        free(step);
    }

    return result;
}

double * multiply_complex(double * complex1, double * complex2) {
    double * result = (double *) malloc(2 * sizeof(double));
    fprintf(stderr, "\n%lf %lf\n", complex1[0], complex2[0]);
    result[0] = complex1[0] * complex2[0] - complex1[1] * complex2[1];
    result[1] = complex1[0] * complex2[1] + complex1[1] * complex2[0];
    return result;
}

/**
 * Calculates raising a complex number to the power specified.
 */
double * power_complex(double * complex, int power) {
    double * result = (double *) malloc(2 * sizeof(double));

    if (power == 0) {
        result[0] = 1.0;
        result[1] = 0.0;
        return result;
    }

    // Base values.
    double radius = sqrt(complex[0] * complex[0] + complex[1] * complex[1]);
    double thetha = atan(complex[1] / complex[0]);
    // Apply.
    radius = powf(radius, power);
    thetha = thetha * power;

    // Convert back to standard representation.;
    result[0] = radius * (cos(thetha));
    result[1] = radius * (sin(thetha));
    return result;
}


/**
 * Gets a derivative of a coefficient representation of a polynom.
 */
double ** calculate_derivative(double coefficient[][2], int order) {
    fprintf(stderr, "foo \n");
    double ** derivative = (double **) malloc((order) * sizeof(double));
    for(int index = 1; index <= order ; index++){
        fprintf(stderr, "index %d\n", index);
        derivative[index-1] = (double *) malloc(2 * sizeof(double));
        derivative[index-1][0] = index * coefficient[index][0];
        derivative[index-1][1] = index * coefficient[index][1];
    }
    return derivative;
}

/**
 * Divide complex1 by complex2.
 */
double * divide_complex(double * complex1, double * complex2) {
    double absolute_value = sqrt(complex[0] * complex[0] + complex[1] * complex[1]);
    double * result = (double *) malloc(2 * sizeof(double));
    double * inverted_denominator = invert_complex(conmplex2);

    result = multiply_complex(complex1, inverted_denominator);
    double norma = powf(complex2[0], 2) + powf(complex2[1], 2);
    // (a+bi) / (c+di) = ((a+bi)*(c-di))/((c+di)(c-di)) = ((a+bi)*(c-di))/(c^2 +d^2)

    result[0] = result[0] / norma;
    result[1] = result[1] / norma;
    // Cleanup.
    free(inverted_denominator);
    return result;
}

/**
 * Add two complex numbers.
 */
double * add_complex(double * complex1, double * complex2) {
  double * result = (double *) malloc(2 * sizeof(double));
  result[0] = complex1[0] + complex2[0];
  result[1] = complex1[1] + complex2[1];
  return result;
}

/**
 * Subtract complex2 from complex1.
 */
double * subtract_complex(double * complex1, double * complex2) {
  double * result = (double *) malloc(2 * sizeof(double));
  result[0] = complex2[0] - complex1[0];
  result[1] = complex2[1] - complex1[1];
  return result;
}

/**
 * Get invert of a complex value.
 */
double * invert_complex(double * complex) {
  double * result = (double *) malloc(2 * sizeof(double));

  result[0] = complex[0];
  result[1] = 0.0 - complex[1];

  return result;
}

/**
 * Create next Z_n in the Newton-Raphson analysis.
 */
double * newton_step(double coefficient[][2], double * current_value) {
  double * result = (double *) malloc(2 * sizeof(double));
}
