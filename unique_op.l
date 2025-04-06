%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include "unique_op.h"
%}

%%

x\([0-9]+\)     { sscanf(yytext + 2, "%lf", &xVal); printf("Token: XVAL (x=%.2f)\n", xVal); return 1; }
y\([0-9]+\)     { sscanf(yytext + 2, "%lf", &yVal); printf("Token: YVAL (y=%.2f)\n", yVal); return 2; }
custom_operation { printf("Token: CUSTOM_OPERATION\n"); return 3; }
[ \t\n]         ; // Ignore whitespace
.               { printf("Unexpected character: %s\n", yytext); exit(1); }

%%
