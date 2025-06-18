%{
#include "pro4.tab.h"
%}
%%
[0-9]+ {yylval= atoi(yytext); return NUMB;}
[+ - * /] {return yytext[0];}
[\n] {return '\n';}
. {}
%%
int yywrap()
{
    return 1;
}