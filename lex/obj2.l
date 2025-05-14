%{
#include <stdio.h>

int line_count = 0, space_count = 0, tab_count = 0, other_count = 0;
%}

%%

\n       { line_count++; }
" "      { space_count++; }
\t       { tab_count++; }
.        { other_count++; }

%%


int main() {
    printf("Enter input :\n");
    yylex();  // Start lexical analysis
    printf("Lines: %d\n", line_count);
    printf("Spaces: %d\n", space_count);
    printf("Tabs: %d\n", tab_count);
    printf("Other Characters: %d\n", other_count);
    return 0;
}

int yywrap() {
    return 1;  // Indicates the end of the input
}

