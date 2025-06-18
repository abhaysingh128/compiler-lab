%{  
#include <stdio.h>  
#include <stdlib.h>  
%}  
  
%token NUMBER  
  
%%  
  
input:  
    | input line  
    ;  
  
line:  
    expr '\n'     { printf("Result = %d\n", $1); }  
    ;  
  
expr:  
    expr '+' expr   { $$ = $1 + $3; }  
    | expr '-' expr { $$ = $1 - $3; }  
    | expr '*' expr { $$ = $1 * $3; }  
    | expr '/' expr { $$ = $1 / $3; }  
    | NUMBER         { $$ = $1; }  
    ;  
  
%%  
  
int main() {  
    printf("Enter expression: \n");  
    yyparse();  
    return 0;  
}  
  
int yyerror(char *s) {  
    printf("Error: %s\n", s);  
    return 0;  
} 