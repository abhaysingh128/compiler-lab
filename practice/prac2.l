%{
#include <stdio.h>
%}
%%
0[xX][0-9a-fA-F]+ {printf("Hexadecimal number: %s\n", yytext);}
0[xX][0-9f-zF-Z]+|[0-9a-zA-Z]+ {printf("Not Hexadecimal number\n");}
.|\n ;
%%
int yywrap(){
    return 1;
}
int main() {
    yylex();
    return 0;
}
