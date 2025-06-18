%{
    #include <stdio.h>
    #include <stdlib.h>
    void yyerror(const char *s);
    int yylex();
%}
%token NUMBER
%left '+' '-'
%left '*' '/'

%%
stmt:
    expr '\n' {printf("result is : %d\n",$1);}
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
void yyerror(const char *s)
{
    fprintf(stderr,"error is %s\n",s);
}
int main()
{
  printf("enter expression: ");
  yyparse();
  return 0;
}