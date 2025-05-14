%{
#include <stdio.h>
%}

%%

[ \t]+   { fprintf(yyout, " "); }
[\n]+     { fprintf(yyout," \n"); }
.        { fprintf(yyout, "%s", yytext); }

%%

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    yylex();

    printf("\nCheck the output file.\n");
    return 0;
}

int yywrap() {
    return 1;
}