%{
#include <stdio.h>
%}

%%
[-+]?[0-9]+               { printf(" integer %s\n", yytext); }
[-+]?[0-9]*[.][0-9]+      { printf(" floating point no. %s\n", yytext); }
.*                        { printf(" %s is not a number\n", yytext); }

%%

int main() {
    printf("Enter: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

