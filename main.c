// Global debug variable.
#define debug 0

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

double * complex_power(double * complex, int power);
double * multiply_complex(double * complex1, double * complex2);
double * apply_function(double coefficient[][2], int order, double * value);

int DOUBLE_SIZE = 2;

int main(void) {
    // Specific input for this program.
    double epsilon = 0;
    int order = 0;
    DOUBLE_SIZE = (int) sizeof(double);
    // To be allocated later.

    // Tolerance.
    //scanf("epsilon = %lf\n", &epsilon);

    // Size of polynom.
    //scanf("order = %i\n", &order);

    // COEFFICIENTS
//    // Allocate data and reset values.
//    double coefficients[order + 1][2];
//    for (int initIndex = 0; initIndex < order + 1; initIndex++) {
//        coefficients[initIndex][0] = 0.0;
//        coefficients[initIndex][1] = 0.0;
//    }
//
//    char acceptString[200];
//    for (int coefficientindex = order; coefficientindex >= 0; coefficientindex--) {
//        //sprintf(acceptString, "coeff %d = %s %s", coefficientindex, "%lf", "%lf");
//        //scanf(acceptString, &coefficients[coefficientindex][0], &coefficients[coefficientindex][1]);
//        // Catch "\n".
//        //getchar();
//    }
//    printf("\nResult:\n");
//    for (int printIndex = 0; printIndex <= order; printIndex++) {
//        printf("(%lf + %lf) * x ^ %d ", coefficients[printIndex][0], coefficients[printIndex][1], printIndex);
//    }
//
//    printf("\n");

    // INITIAL

    //sprintf(acceptString, "initial = %s %s", "%lf", "%lf");
    //scanf(acceptString, &initial[0], &initial[1]);
    // Catch "\n".
    //getchar();

/*  printf("epsilon : %e\n", epsilon);
    printf("oeder : %d\n", order);
    printf("initial real : %lf\n", initial[0][0]);
    printf("initial imaginary : %lf\n", initial[0][1]);
//*/
    double coeff[3][2];
    coeff[0][0] = 0.0;
    coeff[0][1] = 0.0;
    coeff[1][0] = 1.0;
    coeff[1][1] = 0.0;
    coeff[2][0] = 0.0;
    coeff[2][1] = 0.0;

    double value[2];
    value[0] = 4.0;
    value[1] = 1.0;

    double * result = apply_function(coeff, 2, value);
    printf("result: %lf + %lfi", result[0], result[1]);


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
        double * step = complex_power(value, index);
        fprintf(stderr, "foo %d\n", index);

        step = multiply_complex(step, coefficient[index]) ;
        fprintf(stderr, "foo2 %d\n", index);
        // A
        result[0] += step[0];
        result[1] += step[1];

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
double * complex_power(double * complex, int power) {
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
double ** calculate_derivative(double ** coefficient, int order) {
    for(int index = 0; index < order; index++){
        coefficient[index][0] = order * coefficient[index][0];
        coefficient[index][1] = order * coefficient[index][1];
        order--;
    }
    return coefficient;
}
