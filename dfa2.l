%{
#include<stdio.h>
%}

%s INT DEAD A FLOAT ID

%%

<INITIAL>[0-9] BEGIN INT;
<INITIAL>[a-zA-Z_] BEGIN ID;
<INITIAL>\n printf("invalid input\n");BEGIN INITIAL;
<INITIAL>[^0-9a-zA-Z_] BEGIN DEAD;

<INT>[0-9] BEGIN INT ;
<INT>["."] BEGIN A;
<INT>\n printf("integer is accepted\n");BEGIN INITIAL;
<INT>[^0-9\.\n] BEGIN DEAD;

<A>\n BEGIN INITIAL;printf("invalid input\n") ;
<A>[0-9] BEGIN FLOAT;
<A>[^0-9\n] BEGIN DEAD;

<FLOAT>[0-9] BEGIN FLOAT;
<FLOAT>[^0-9\n] BEGIN DEAD;
<FLOAT>\n BEGIN INITIAL;printf("float is accepted\n");

<ID>[a-zA-Z0-9_] BEGIN ID;
<ID>[^a-zA-Z0-9_\n] BEGIN DEAD;
<ID>\n BEGIN INITIAL;printf("identifier is accepted\n");

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL;printf("invalid input\n");

%%

int main()
{

printf("enter the string\n");
yylex();
return 0;
}

int yywrap()
{
return 1;
}
