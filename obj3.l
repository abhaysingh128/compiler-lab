%{
#include <stdio.h>
%}

%%

^[a-zA-Z_][a-zA-Z0-9_]* { printf("Valid identifier.\n"); }
^[^a-zA-Z_]+  { printf("Invalid identifier.\n");}
.*  { printf("Invalid identifier.\n"); }
%%

int main() {
    printf("Enter a string: ");
    yylex();
    return 0;
}
int yywrap(){
return 1;
}

