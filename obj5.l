%{ 
#include<stdio.h> 
%} 
%% 
auto|break|case|count|continue|default|do|double|enum|extern|float|for|goto|if|long|register|return|short|signed|sizeof|static|struct|switch|typeof|union|unsigned|else|char|void|volatile|while|int {printf("keyword:\n"); } 
[{|}|(|)|;|,] {printf("sperater:\n"); } 
[\+|\-|\*|/|=|%] {printf("operator:\n"); } 
^[a-zA-Z_][a-zA-Z0-9_]* { printf("identifer:\n"); } 
.|\n ; 
%% 
int yywrap(){ 
 return 1; 
} 
int main(){ 
printf("Enter the input to check:\n"); 
yylex(); 
printf("------Exit-----\n"); 
return 0; 
}
