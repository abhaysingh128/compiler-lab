%{  
#include"y.tab.h"  
%}  
%%  
[0-9]+ {yylval=atoi(yytext); return NUMB;}  
[\t\n] {}  
"+"  
"-"  
"*"  
"/"  
{return PLUS;}  
{return MINS;}  
{return MULT;}  
{return DIVI;}  
"("  
")"  
.  
%%  
int yywrap()  
{  
return 1;  
}  
{return LP;}  
{return RP; 
}  
