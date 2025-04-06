// unique_op_logic.c
#include <stdio.h>
#include "unique_op.h"

double xVal = 0, yVal = 0;

extern int yylex();

void computeExpression() {
    int token;
    while ((token = yylex())) {
        if (token == 3) { // CUSTOM_OPERATION
            double result = (xVal * xVal) + (yVal * yVal) - (2 * xVal * yVal);
            printf("Result of custom_operation (x² + y² - 2xy): %.2f\n", result);
            break;
        }
    }
}
int yywrap() {
    return 1;
}
