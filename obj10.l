%{
#include<stdio.h>
%}

%%
^["].*["] {printf("string");}
^['].*['] {printf("literals");}
auto|break|case|count|continue|default|do|double|enum|extern|float|for|goto|if|long|register|return|short|signed|sizeof|static|struct|switch|typeof|union|unsigned|else|char|void|volatile|while|int {printf("keywords");}
[0-9]+|[0-9]*[.][0-9]+ {printf("constants");}
^[a-zA-Z_][a-zA-Z0-9_]* {printf("identifiers");}
.* {printf("not valid token");}  
%%

int yywrap()
{
    return 0;
}

int main()
{
printf("enter the token:\n");
yylex();
return 0;
}