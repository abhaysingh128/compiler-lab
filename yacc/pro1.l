%{  
#include"pro1.tab.h"  
%}  
%%  
[0-9]+ {yylval=atoi(yytext); return NUMBER;}  
[\t\n] {}  
"+"  {return PLUS;} 
"-"  {return MINUS;}
"*"  {return MUL;}
"/"  {return DIV;}
"("  {return LP;} 
")"  {return RP;}  
.    {}
%%  
int yywrap()  
{  
return 1;  
}  
 

