%{
#include <stdio.h>
#include <string.h>

void reverse(char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        char temp = str[i];
        str[i] = str[len - 1 - i];
        str[len - 1 - i] = temp;
    }
}
%}

%%
[a-zA-Z]+ { reverse(yytext);
            printf("%s", yytext);}
[ \t\n]+ { printf("%s", yytext);}
. { printf("%s", yytext);}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a string:\n");
    yylex();
    return 0;
}
