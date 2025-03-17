%{
#include <stdio.h>
%}

%option noyywrap

%%
"//".*                  { printf("COMMENT\n"); }
f                       { printf("FLOAT_DECL\n"); }
i                       { printf("INT_DECL\n"); }
[a-zA-Z_][a-zA-Z0-9]*   { printf("IDENTIFIER\n"); }
"="                     { printf("ASSIGN_OP\n"); }
"+"                     { printf("PLUS_OP\n"); }
"*"                     { printf("MULT_OP\n"); }
"/"                     { printf("DIV_OP\n"); }
[0-9]+                  { printf("INTEGER_NUM\n"); }
[0-9]+"."[0-9]+         { printf("FLOAT_NUM\n"); }
[ \t\r]+                { /* ignorar espacios y tabs*/ }
p                       { printf("PRINT_CMD\n"); }
.                       { printf("UNKNOWN: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
