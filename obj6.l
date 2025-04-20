%{ 
#include<stdio.h>
int tword=0, tspace=0 , tchar=0,lines=0;
%}
%%
[a-zA-Z0-9]+  { tword++; tchar += yyleng; } // Word: count + chars in it
[ \t]         { tspace++; tchar++; }        // Space or tab: count + char
\n            { lines++; tchar++; }         // Newline: count + char
.             { tchar++; }
%%
int yywrap(){
    return 1;
}
int main(){
    extern FILE *yyin;
    yyin = fopen("file.txt", "r");
    if (yyin == NULL) {
        printf("Error opening file!\n");
        return 1;
    }
    yylex();
    fclose(yyin); // Always close files
    printf("Total words: %d\n", tword);
    printf("Total spaces: %d\n", tspace);
    printf("Total characters: %d\n", tchar);
    printf("Total lines: %d\n", lines);
    return 0;
}
