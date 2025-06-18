%{  
#include <stdio.h>  
#include <stdlib.h>  
void yyerror(const char *s);  
int yylex();  
%} 

%token MINUS DIV PLUS LP RP MUL NUMBER 
%left PLUS MINUS  
%left MUL DIV 

%%  
expr:  
NUMBER  
| expr PLUS expr  
| expr MUL expr  
| expr MINUS expr  
| expr DIV expr  
| LP expr RP  
;  
%%  

void yyerror(const char *s) {  
    printf("not valid expression");
} 
 
int main() {  
printf("Enter the Expression: ");  
int x = yyparse();  
if (x == 0) {  
printf("Valid Expression!!\n"); }  
return 0; 
}  