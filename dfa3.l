%{
#include<stdio.h>
%}
%s A B DEAD
%%
<INITIAL>a BEGIN A;
<INITIAL>\n printf("not accepted \n"); BEGIN INITIAL;
<INITIAL>[^a\n] BEGIN DEAD;
 
<A>a BEGIN A;
<A>b BEGIN B;
<A>\n printf("not accepted \n"); BEGIN INITIAL;
<A>[^ab\n] BEGIN DEAD;

<B>a BEGIN A;
<B>b BEGIN B;
<B>\n printf("Accepted \n"); BEGIN INITIAL;
<B>[^ab\n] BEGIN DEAD;
 
<DEAD>[^\n]   BEGIN DEAD;
<DEAD>\n printf("invalid string\n"); BEGIN INITIAL;
%%
int yywrap(){
return 1;
}

int main(){
printf("Enter a string\n");
yylex();
return 0;
}
