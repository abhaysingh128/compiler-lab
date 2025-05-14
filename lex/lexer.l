%{
#include <stdio.h>
#include "tokens.h" // You'll define token enums here
int line = 1;
%}

%option noyywrap

DIGIT     [0-9]
ID        [a-zA-Z_][a-zA-Z0-9_]*
STRING    \"([^\n\"]|\\.)*\"
WHITESPACE [ \t]+
NEWLINE   \n
%%

#.*                          { /* comment, skip */ }
{NEWLINE}                    { line++; }
{WHITESPACE}                { /* skip */ }

"let"                        { return T_LET; }
"be"                         { return T_BE; }
"set"                        { return T_SET; }
"is"                         { return T_IS; }
"null"                       { return T_NULL; }

"if"                         { return T_IF; }
"then"                       { return T_THEN; }
"else"                       { return T_ELSE; }
"return"|"give"              { return T_RETURN; }

"while"                      { return T_WHILE; }
"repeat"                     { return T_REPEAT; }
"until"                      { return T_UNTIL; }
"do"                         { return T_DO; }

"break"                      { return T_BREAK; }
"continue"                   { return T_CONTINUE; }

"define"                     { return T_DEFINE; }
"function"                   { return T_FUNCTION; }
"end"                        { return T_END; }
"with"                       { return T_WITH; }
"returns"                    { return T_RETURNS; }

"and"                        { return T_AND; }
"or"                         { return T_OR; }
"not"                        { return T_NOT; }

"true"                       { return T_TRUE; }
"false"                      { return T_FALSE; }

"ask"                        { return T_ASK; }
"print"                      { return T_PRINT; }
"run"                        { return T_RUN; }

"match"                      { return T_MATCH; }
"case"                       { return T_CASE; }
"endmatch"|"end_match"      { return T_END_MATCH; }

"try"                        { return T_TRY; }
"catch"                      { return T_CATCH; }
"endtry"|"end_try"           { return T_END_TRY; }

"into"                       { return T_INTO; }

"number"                     { return T_TYPE_NUM; }
"text"                       { return T_TYPE_TEXT; }
"boolean"                    { return T_TYPE_BOOL; }

"is equal to"                { return T_EQ; }
"is not"                     { return T_NEQ; }
"is greater than"            { return T_GT; }
"is less than"               { return T_LT; }

"+"                          { return T_PLUS; }
"-"                          { return T_MINUS; }
"*"                          { return T_MUL; }
"/"                          { return T_DIV; }
"("                          { return T_LPAREN; }
")"                          { return T_RPAREN; }
";"                          { return T_SEMI; }
","                          { return T_COMMA; }
"["                          { return T_LBRACKET; }
"]"                          { return T_RBRACKET; }
"{"                          { return T_LBRACE; }
"}"                          { return T_RBRACE; }
":"                          { return T_COLON; }

{STRING}                     { yylval.str = strdup(yytext); return T_STRING; }
{DIGIT}+                    { yylval.num = atoi(yytext); return T_NUM; }
{DIGIT}+"."{DIGIT}+         { yylval.rnum = atof(yytext); return T_RNUM; }
{ID}                         { yylval.id = strdup(yytext); return T_ID; }

.                            { printf("Line %d: Unknown token '%s'\n", line, yytext); return T_UNKNOWN; }

%%

int yywrap() { return 1; }
