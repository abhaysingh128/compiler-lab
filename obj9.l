%{
    #include<stdio.h>
%}

%%
"<"[^>]*">" {fprintf(yyout,"%s\n",yytext);}
.|\n ;
%%

int yywrap()
{
    return 1;
}
int main()
{
    extern  FILE *yyin,*yyout;
    yyin=fopen("input.html","r");
    yyout=fopen("output.html","w");
    yylex();
    return 0;

}