%{
#include <stdio.h>
%}
%s q0p0 q0p1 q0p2 q1p0 q1p1 q1p2 q2p0 q2p1 q2p2 DEAD
%%
<INITIAL>a          BEGIN q1p0;
<INITIAL>b          BEGIN q0p1;
<INITIAL>\n         printf("Accepted\n"); BEGIN INITIAL;
<INITIAL>[^ab\n]    BEGIN DEAD;

<q0p0>a             BEGIN q1p0;
<q0p0>b             BEGIN q0p1;
<q0p0>\n            printf("Accepted\n"); BEGIN INITIAL;
<q0p0>[^ab\n]       BEGIN DEAD;

<q0p1>a             BEGIN q1p1;
<q0p1>b             BEGIN q0p2;
<q0p1>\n            printf("Not Accepted\n"); BEGIN INITIAL;
<q0p1>[^ab\n]       BEGIN DEAD;

<q0p2>a             BEGIN q1p2;
<q0p2>b             BEGIN q0p0;
<q0p2>\n            printf("Not Accepted\n"); BEGIN INITIAL;
<q0p2>[^ab\n]       BEGIN DEAD;

<q1p0>a             BEGIN q2p0;
<q1p0>b             BEGIN q1p1;
<q1p0>\n            printf("Not Accepted\n"); BEGIN INITIAL;
<q1p0>[^ab\n]       BEGIN DEAD;

<q1p1>a             BEGIN q2p1;
<q1p1>b             BEGIN q1p2;
<q1p1>\n            printf("Not Accepted\n"); BEGIN INITIAL;
<q1p1>[^ab\n]       BEGIN DEAD;

<q1p2>a             BEGIN q2p2;
<q1p2>b             BEGIN q1p0;
<q1p2>\n            printf("Not Accepted\n"); BEGIN INITIAL;
<q1p2>[^ab\n]       BEGIN DEAD;

<q2p0>a             BEGIN q0p0;
<q2p0>b             BEGIN q2p1;
<q2p0>\n            printf("Not Accepted\n"); BEGIN INITIAL;
<q2p0>[^ab\n]       BEGIN DEAD;

<q2p1>a             BEGIN q0p1;
<q2p1>b             BEGIN q2p2;
<q2p1>\n            printf("Not Accepted\n"); BEGIN INITIAL;
<q2p1>[^ab\n]       BEGIN DEAD;

<q2p2>a             BEGIN q0p2;
<q2p2>b             BEGIN q2p0;
<q2p2>\n            printf("Not Accepted\n"); BEGIN INITIAL;
<q2p2>[^ab\n]       BEGIN DEAD;

<DEAD>\n            printf("Invalid\n"); BEGIN INITIAL;
<DEAD>[^\n]         BEGIN DEAD;
%%
int yywrap() {
    return 1;
}
int main() {
    yylex();
    return 0;
}
