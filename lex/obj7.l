%{
    #include<stdio.h>
%}

%%
[" "\t]+ {fprintf(yyout," ");}
.|\n {fprintf(yyout,"%s",yytext);}
%%

int yywrap()
{
    return 1;
}
int main()
{
    extern  FILE *yyin,*yyout;
    yyin=fopen("input.txt","r");
    yyout=fopen("output.txt","w");
    yylex();
    return 0;

}