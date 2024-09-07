%{
#include <stdio.h>

int word_count = 0;

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%%

[ \t\n]+    ;  /* Ignora espaços, tabulações e quebras de linha */
[A-Za-z]+   { word_count++; }  /* Conta palavras */

%%

int main(int argc, char **argv) {
    yylex();
    printf("Word count: %d\n", word_count);
    return 0;
}

int yywrap(void) {
    return 1;
}
