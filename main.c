// Global debug variable.
#define debug 0

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

double * complex_power(double * complex, int power);

int main(void) {
    // Specific input for this program.
    double epsilon = 0;
    int order = 0;
    // To be allocated later.

    // Tolerance.
    //scanf("epsilon = %lf\n", &epsilon);

    // Size of polynom.
    //scanf("order = %i\n", &order);

    // COEFFICIENTS
    // Allocate data and reset values.
    double coefficients[order + 1][2];
    for (int initIndex = 0; initIndex < order + 1; initIndex++) {
        coefficients[initIndex][0] = 0.0;
        coefficients[initIndex][1] = 0.0;
    }

    char acceptString[200];
    for (int coefficientindex = order; coefficientindex >= 0; coefficientindex--) {
        //sprintf(acceptString, "coeff %d = %s %s", coefficientindex, "%lf", "%lf");
        //scanf(acceptString, &coefficients[coefficientindex][0], &coefficients[coefficientindex][1]);
        // Catch "\n".
        //getchar();
    }
    printf("\nResult:\n");
    for (int printIndex = 0; printIndex <= order; printIndex++) {
        printf("(%lf + %lf) * x ^ %d ", coefficients[printIndex][0], coefficients[printIndex][1], printIndex);
    }

    printf("\n");

    // INITIAL

    double initial[2];
    initial[0] = 5.0;
    initial[1] = 2.0;
    int power = 3;
    double * result;
    result = complex_power(initial, power);


    printf("result: %lf + i%lf", result[0], result[1]);
    free(result);
    //sprintf(acceptString, "initial = %s %s", "%lf", "%lf");
    //scanf(acceptString, &initial[0], &initial[1]);
    // Catch "\n".
    //getchar();

/*  printf("epsilon : %e\n", epsilon);
    printf("oeder : %d\n", order);
    printf("initial real : %lf\n", initial[0][0]);
    printf("initial imaginary : %lf\n", initial[0][1]);
*/




    return 0;
}

/**
 * Gets the result of applying a polynomial function with a specific value.
 */
double * apply_function(double ** coefficient, int order, double * value) {
    //
    double * result = (double *) malloc(2 * sizeof(double));
    result[0] = 0.0;
    result[1] = 0.0;
    for (int index = 0; index <= order; index++) {
        // Calculate value ^ (current order) * coefficient.
        double * step = complex_power(value, index);

        // FIXME (this is wrong).
        step[0] = step[0] * coefficient[index][0];
        step[1] = step[1] * coefficient[index][1];
        // A
        result[0] += step[0];
        result[1] += step[1];
    }


    return 0;
}

/**
 * Calculates raising a complex number to the power specified.
 */
double * complex_power(double * complex, int power) {
    // Base values.
    double radius = sqrt(complex[0] * complex[0] + complex[1] * complex[1]);
    double thetha = atan(complex[1] / complex[0]);
    // Apply.
    radius = powf(radius, power);
    thetha = thetha * power;

    // Convert back to standard representation.
    double * result = (double *) malloc(2 * sizeof(double));
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
