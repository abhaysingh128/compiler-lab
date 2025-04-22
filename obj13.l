%{
    #include<stdio.h>
%}

%%
[a-zA-Z0-9_]([a-zA-Z0-9_-]*[.]?[a-zA-Z0-9_]+)*(@gmail.com) {printf("valid email");}
.* {printf("not a valid email");} 
%%

int yywrap()
{
    return 1;
}
int main()
{
    printf("enter a string:\n");
    yylex();
    return 0;

}