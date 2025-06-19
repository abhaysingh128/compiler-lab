%{
#include "prefix.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMB; }
[ \t\n]     ; // skip whitespace
.           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
