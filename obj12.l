%{
    #include<stdio.h>
    int v=0,c=0;
%}

%%
[aeiouAEIOU] {v++;}
[a-zA-Z] {c++;}
.|\n ;
%%

int yywrap()
{
    return 1;
}
int main()
{
    printf("enter a string:\n");
    yylex();
    printf("total number of vowels are: %d\n",v);
    printf("total no. of consonants are: %d\n",c);
    return 0;

}