%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"
%}

%%

"dispositivos"         { return DISPOSITIVOS; }
"fimdispositivos"      { return FIMDISPOSITIVOS; }
"def"                  { return DEF; }
"quando"               { return QUANDO; }
"senao"                { return SENAO; }
"execute"              { return EXECUTE; }
"em"                   { return EM; }
"alerta"               { return ALERTA; }
"para"                 { return PARA; }
"difundir"             { return DIFUNDIR; }
"ligar"                { return LIGAR; }
"desligar"             { return DESLIGAR; }

"TRUE"                 { yylval.num = 1; return BOOL; }
"FALSE"                { yylval.num = 0; return BOOL; }
[0-9]+                 { yylval.num = atoi(yytext); return NUM; }

[a-zA-Z_][a-zA-Z0-9_]* { return ID_DEVICE; }

">"                    { return OP_LOGIC; }
"<"                    { return OP_LOGIC; }
">="                   { return OP_LOGIC; }
"<="                   { return OP_LOGIC; }
"=="                   { return OP_LOGIC; }
"!="                   { return OP_LOGIC; }

"="                    { return IGUAL; }
"->"                   { return SETA; }
","                    { return VIRGULA; }
";"                    { return PONTOVIRGULA; }
":"                    { return DOISPONTOS; }
"["                    { return ABRECOLCHETE; }
"]"                    { return FECHACOLCHETE; }

[ \t\n\r]+             ;  /* Ignora espaços, tabs e quebras de linha */
.                      ;  /* Ignora outros caracteres inesperados */

%%

int yywrap() { return 1; }
