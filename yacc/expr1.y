%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}
%token NUMBER
%token PLUS MINUS DIV MUL LP RP
%%
expr:
expr PLUS expr 
|expr MINUS expr 
|expr DIV expr 
|LP expr RP
|NUMBER ;
%%
void yyerror(const char *s)
{
    printf("Not a valid expression");
}
int main()
{
    printf("enter arthematic expression ");
    yyparse();
    printf("valid experession");
    return 0;
}