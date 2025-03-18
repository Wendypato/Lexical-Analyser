%{
#include <stdio.h>
%}
    
%option noyywrap
    
%%
"//"                    { printf("COMMENT"); }
f                       { printf("floatdcl "); }
i                       { printf("intdcl "); }
p                       { printf("print "); }
[a-zA-Z]+[a-zA-Z0-9]*   { printf("id "); }
"+"                     { printf("plus "); }
"-"                     { printf("minus "); }
"="                     { printf("assign "); }
"*"                     { printf("mult "); }
"/"                     { printf("div "); }
[0-9]*\.[0-9]+          { printf("fnum "); }
[0-9]+                  { printf("inum "); }
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
