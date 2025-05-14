%{
    #include<stdio.h>
%}

%%
[0-9]*[02468]+ {printf("even number");}
[0-9]*[13579]+ {printf("odd number");}
.* {printf("not a valid number");} 
%%

int yywrap()
{
    return 1;
}
int main()
{
    printf("enter a number:\n");
    yylex();
    return 0;

}