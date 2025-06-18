%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(const char &s);
    int yylex();
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%%

stmt:
expr '\n'{printf("result is : %d\n",$());}
;
expr:
expr'+'expr {$$=$1+$3;}
|expr'-'expr {$$=$1-$3;}
|expr'*'expr {$$=$1*$3;}
|expr'/'expr {if($3==0)
              {
                yyerror("division by zero");
                YYABORT;
              }
              $$=$1/$3;}
|NUMBER {$$=$1;}
;
%%
void yyerror(const char &S)
{
    fprintf(stderr,"error is %s\n",s);
}