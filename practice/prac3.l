%{
#include <stdio.h>
#include <ctype.h>

int freq[26] = {0}; 
%}

%%
[a-zA-Z] {
    char ch = tolower(yytext[0]);
    freq[ch - 'a']++;
}
.|\n ;

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a string:\n");
    yylex();

    printf("\nLetter frequencies:\n");
    for (int i = 0; i < 26; i++) {
        if (freq[i] > 0) {
            printf("%c: %d\n", 'a' + i, freq[i]);
        }
    }

    return 0;
}
