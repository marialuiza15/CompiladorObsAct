%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

%}

%union {
    int num;
    char* str;
}

/* Declaração dos tokens que virão do lexer.l */
%token ID_DEVICE ID_OBS NUM BOOL MSG OP_LOGIC AND
%token DEF QUANDO SENAO EXECUTE ALERTA PARA DIFUNDIR EM
%token DISPOSITIVOS FIMDISPOSITIVOS
%token LIGAR DESLIGAR
%token MAIOR MENOR MAIORIGUAL MENORIGUAL IGUAL DIFERENTE
%token PONTOVIRGULA DOISPONTOS VIRGULA
%token ABRECOLCHETE FECHACOLCHETE SETA

/* Define precedência e associatividade se precisar */
%left AND
%left OP_LOGIC

%%

/* Regras da gramática começam aqui */

program:
    dev_sec cmd_sec
    ;

dev_sec:
    DISPOSITIVOS DOISPONTOS dev_list FIMDISPOSITIVOS
    ;

dev_list:
    dev_item
  | dev_item dev_list
  ;

dev_item:
    ID_DEVICE
  | ID_DEVICE ABRECOLCHETE ID_OBS FECHACOLCHETE
  ;

cmd_sec:
    cmd_list
    ;

cmd_list:
    cmd PONTOVIRGULA
  | cmd PONTOVIRGULA cmd_list
  ;

cmd:
    atrib
  | obsact
  | act
  ;

atrib:
    DEF ID_OBS IGUAL val
    ;

obsact:
    QUANDO obs DOISPONTOS act
  | QUANDO obs DOISPONTOS act SENAO act
  ;

obs:
    ID_OBS OP_LOGIC val
  | ID_OBS OP_LOGIC val AND obs
  ;

val:
    NUM
  | BOOL
  ;

act:
    EXECUTE action EM ID_DEVICE
  | ALERTA PARA ID_DEVICE DOISPONTOS MSG
  | ALERTA PARA ID_DEVICE DOISPONTOS MSG VIRGULA ID_OBS
  | DIFUNDIR DOISPONTOS MSG SETA ABRECOLCHETE dev_list_n FECHACOLCHETE
  | DIFUNDIR DOISPONTOS MSG ID_OBS SETA ABRECOLCHETE dev_list_n FECHACOLCHETE
  ;

action:
    LIGAR
  | DESLIGAR
  ;

dev_list_n:
    ID_DEVICE
  | ID_DEVICE VIRGULA dev_list_n
  ;

%%

/* Parte final: funções auxiliares */

void yyerror(const char *s) {
    fprintf(stderr, "Erro de sintaxe: %s\n", s);
}

int main(void) {
    printf("Analisador ObsAct iniciado...\n");
    yyparse();
    printf("Análise concluída com sucesso!\n");
    return 0;
}