%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token NUMB
%left '+' '-'
%left '*' '/'

%%
expr:
    expr '+' expr   { printf("+ "); }  // print operator first
  | expr '-' expr   { printf("- "); }
  | expr '*' expr   { printf("* "); }
  | expr '/' expr   { printf("/ "); }
  | NUMB            { printf("%d ", $1); }  // print number
;
%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter the Expression: ");
    yyparse();
    printf("\n");
    return 0;
}
