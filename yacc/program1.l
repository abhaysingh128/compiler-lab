%{
#include "expr1.tab.h"
%}
%%
[0-9]+ {yylval= atoi(yytext); return NUMBER;}
"+" {return PLUS;}
"-" {return MINUS;}
"/" {return DIV;}
"*" {return MUL;}
"(" {return LP;}
")" {return RP;}
. {}
%%
int yywrap()
{
    return 1;
}