%{  
#include "y.tab.h"  
#include <stdlib.h>  
%}  
%%  
[0-9]+   
[\n]  
[ \t]  
.  
{ yylval = atoi(yytext); return NUMB; }  
{ return '\n'; }  
;  
{ return yytext[0]; }  
%%  
int yywrap() {  
return 1;  
}  
