%{
#include <stdio.h>
%}
    
%option noyywrap
    
%%
"//".*                  { printf("COMMENT\n"); }
f                       { printf("floatdcl "); }
i                       { printf("intdcl "); }
p                       { printf("print "); }
"+"                     { printf("plus "); }
"-"                     { printf("minus "); }
"="                     { printf("assign "); }
"*"                     { printf("mult "); }
"/"                     { printf("div "); }
[a-zA-Z]+[a-zA-Z0-9]*   { printf("id\n"); }
[0-9]+\.[0-9]+          { printf("fmun\n"); }
[0-9]+                  { printf("inum\n"); }
[ \t\r]+                { /*ignorar espacios y tabs*/ }
.                       { printf("unknown token "); }
    
%%
    
int main(int argc, char **argv) {
    FILE *fd;

    if (argc == 2) {
        if (!(fd = fopen(argv[1], "r"))) {
            perror("Error: ");
            return -1;
        }

        yyset_in(fd); 
        yylex();
        fclose(fd);

    } else {
        printf("Usage: a.out filename\n");
        return 0;
    }
}
