%{
#include <stdio.h>
#include <stdlib.h>
#include "custom_op.h"

double xVal = 0, yVal = 0;
%}

%%

x[0-9]+          { sscanf(yytext + 1, "%lf", &xVal); printf("Token: XVAL (x=%.2f)\n", xVal); return XVAL; }
y[0-9]+          { sscanf(yytext + 1, "%lf", &yVal); printf("Token: YVAL (y=%.2f)\n", yVal); return YVAL; }
custom_operation { printf("Token: CUSTOM_OP\n"); return CUSTOM_OP; }

[ \t\n]          ; // Ignore whitespace

.                { printf("Unexpected character: %s\n", yytext); exit(1); }

%%

int yywrap() {
    return 1;
}
