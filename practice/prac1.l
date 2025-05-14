%{
    #include <stdio.h>
%}
%%
((25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\.){3}(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2}) { printf("IPv4: %s\n", yytext); }
([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4} { printf("IPv6: %s\n", yytext); }
.|\n {}
%%
int yywrap(){
    return 1;
}
int main() {
    yylex();
    return 0;
}
