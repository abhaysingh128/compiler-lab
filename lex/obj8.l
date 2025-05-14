%{
#include<stdio.h>
#include<stdlib.h>    
%}

%%
"//".* {fprintf(yyout,"");}
"/*"([^*]|\*+[^*/])*\*+"/"   {fprintf(yyout,"");}
.   {fprintf(yyout,"%s",yytext);}
%%

int yywrap(){
    return 1;
}

int main()
{
    extern  FILE *yyin,*yyout;
    yyin=fopen("input.c","r");
    //yyout=fopen("output.c","w");
    yylex();
    return 0;

}