%{  
#include <stdio.h>  
#include <stdlib.h>  
void yyerror(const char *s);  
int yylex();  
%}  
%token MINUS DIVI PLUS LP RP MULT NUMB  
%left ‘+’ ‘-’  
%left ‘*’ ‘/’  
%%  
stmt :  
expr'\n' {printf("Result : %d\n",$1);}  
;  
expr:  
NUMB {$$ = $1;}  
| expr '+' expr {$$ = $1+$3;}  
| expr '*' expr {$$ = $1*$3;}  
| expr '-' expr {$$ = $1-$3;}  
| expr '/' expr  {$$ = $1/$3;}  
;  
%%  
void yyerror(const char *s) {  
fprintf(stderr, "Error: %s\n", s);  
}  
int main() {  
printf("Enter the Expression: ");  
yyparse();  
return 0;  
} 