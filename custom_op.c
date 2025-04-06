#include <stdio.h>
#include "custom_op.h"

extern int yylex();

void computeExpression() {
    int token;

    token = yylex(); // x
    if (token != XVAL) {
        printf("Expected x-value like x3\n");
        return;
    }

    token = yylex(); // y
    if (token != YVAL) {
        printf("Expected y-value like y4\n");
        return;
    }

    token = yylex(); // custom_operation
    if (token != CUSTOM_OP) {
        printf("Expected 'custom_operation'\n");
        return;
    }

    // Custom instruction: x² + y² - 2xy
    double result = (xVal * xVal) + (yVal * yVal) - (2 * xVal * yVal);
    printf("Using custom instruction: x² + y² - 2xy\n");
    printf("Result for x=%.2f, y=%.2f is: %.2f\n", xVal, yVal, result);
}
