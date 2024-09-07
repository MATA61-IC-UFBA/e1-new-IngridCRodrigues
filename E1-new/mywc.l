%{
#include <stdio.h>
%}

/* Definições de padrões */
%%
[ \t\n]+     ;   /* Ignora espaços, tabulações e quebras de linha */
[A-Za-z]+    { ++word_count; }  /* Conta palavras */
.            ;   /* Ignora outros caracteres */

%%

int word_count = 0;

int main(int argc, char **argv) {
    yylex();
    printf("Word count: %d\n", word_count);
    return 0;
}

int yywrap(void) {
    return 1;
}
