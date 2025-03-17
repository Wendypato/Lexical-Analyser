%{
#include <stdio.h>
%}

%option noyywrap

%%
"//"                    { printf("COMMENT\n"); }
f                       { printf("FLOAT_DECL\n"); }
i                       { printf("INT_DECL\n"); }
[a-zA-Z_][a-zA-Z0-9]*   { printf("VARIABLE\n"); }
"+"                     { printf("PLU\nS"); }
"="                     { printf("EQUAL\n"); }
"*"                     { printf("MULTIPLICATION\n"); }
"/"                     { printf("DIVISON\n"); }
[0-9]+                  { printf("INUM\n"); }
[0-9]+"."[0-9]+         { printf("FNUM\n"); }
"\n"                    { printf("\n"); }
.                       {/*Ignorar otros caracteres*/}

%%

int main() {
    yylex();
    return 0;
}
