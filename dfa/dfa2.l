%{
#include<stdio.h>
%}
%s S0 S1 S2 DEAD
%%
<INITIAL>a BEGIN S0;
<INITIAL>b BEGIN S1;
<INITIAL>\n printf("Accepted (even a and even b)\n"); BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;

<S0>a BEGIN INITIAL;
<S0>b BEGIN S2;
<S0>\n printf("not accepted (odd a)\n"); BEGIN INITIAL;
<S0>[^ab\n] BEGIN DEAD;

<S1>a BEGIN S2;
<S1>b BEGIN INITIAL;
<S1>\n printf("not accepted (odd b)\n"); BEGIN INITIAL;
<S1>[^ab\n] BEGIN DEAD;

<S2>a BEGIN S1;
<S2>b BEGIN S0;
<S2>\n printf("not accepted (odd a and odd b)\n"); BEGIN INITIAL;
<S2>[^ab\n] BEGIN DEAD;

<DEAD>[^\n] BEGIN DEAD;
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
