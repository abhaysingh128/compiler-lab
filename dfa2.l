%{
#include<stdio.h>
%}
%s S0 S1 S2 S3 DEAD
%%
<INITIAL>a BEGIN S1;
<INITIAL>b BEGIN S2;
<INITIAL>\n printf("Accepted (even a and even b)\n"); BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;

<S0>a BEGIN S1;
<S0>b BEGIN S2;
<S0>\n printf("Accepted (even a and even b)\n"); BEGIN INITIAL;
<S0>[^ab\n] BEGIN DEAD;

<S1>a BEGIN S0;
<S1>b BEGIN S3;
<S1>\n printf("not accepted (odd a)\n"); BEGIN INITIAL;
<S1>[^ab\n] BEGIN DEAD;

<S2>a BEGIN S3;
<S2>b BEGIN S0;
<S2>\n printf("not accepted (odd b)\n"); BEGIN INITIAL;
<S2>[^ab\n] BEGIN DEAD;

<S3>a BEGIN S2;
<S3>b BEGIN S1;
<S3>\n printf("not accepted (odd a and odd b)\n"); BEGIN INITIAL;
<S3>[^ab\n] BEGIN DEAD;

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
