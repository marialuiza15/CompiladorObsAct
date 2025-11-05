%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"   
%}

%%

"dispositivos"         { return DISPOSITIVOS; }
"deve"                 { return DEVE; }
"ligar"                { return LIGAR; }
"desligar"             { return DESLIGAR; }
"quando"               { return QUANDO; }
"se"                   { return SE; }
"senão"                { return SENAO; }
"alerta"               { return ALERTA; }
"num"                  { return NUM; }
"bool"                 { return BOOL; }

[0-9]+                 { yylval.num = atoi(yytext); return NUM; }
"TRUE"                 { return TRUE; }
"FALSE"                { return FALSE; }

[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFICADOR; }

">"                    { return OPLOGIC; }
"<"                    { return OPLOGIC; }
">="                   { return OPLOGIC; }
"<="                   { return OPLOGIC; }
"=="                   { return OPLOGIC; }
"!="                   { return OPLOGIC; }

"="                    { return IGUAL; }
"->"                   { return SETA; }
","                    { return VIRGULA; }
";"                    { return PONTO_VIRGULA; }
":"                    { return DOIS_PONTOS; }
"["                    { return ABRE_COLCHETE; }
"]"                    { return FECHA_COLCHETE; }
"("                    { return ABRE_PARENTESE; }
")"                    { return FECHA_PARENTESE; }

" " | "\t" | "\n" | "\r" { /* Ignorar espaços, tabs e novas linhas */ }

.                      { /* Qualquer caractere inválido */ }

%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (f == NULL) {
            perror("Erro ao abrir o arquivo");
            return 1;
        }
        yyin = f;
    }
    
    yylex();  
    return 0;
}

int yywrap() {
    return 1;
}
