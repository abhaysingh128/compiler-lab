%{
    #include<stdio.h>
%}

%s A DEAD
%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN INITIAL;
<INITIAL>\n printf("accepted"); BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;

<A>a BEGIN INITIAL;
<A>b BEGIN A;
<A>\n printf("not accepted"); BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;

<DEAD>\n printf("invalid input"); BEGIN INITIAL;
<DEAD>[^\n] BEGIN DEAD;
%%

int yywrap()
{
    return 1;
}
int main(){
    yylex();
    return 0;
}