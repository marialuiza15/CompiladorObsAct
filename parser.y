%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"  // Arquivo de cabeçalho gerado pelo Bison que contém os tokens
%}

// Declaração dos tokens que o Flex irá gerar
%token DISPOSITIVOS
%token DEVE
%token LIGAR
%token DESLIGAR
%token QUANDO
%token SE
%token SENAO
%token ALERTA
%token NUM
%token BOOL
%token ID_DEVICE
%token ID_OBS
%token VAL
%token OPLOGIC
%token MSG
%token VIRGULA
%token PONTO_VIRGULA
%token DOIS_PONTOS
%token ABRE_COLCHETE
%token FECHA_COLCHETE
%token ABRE_PARENTESE
%token FECHA_PARENTESE
%token IGUAL
%token SETA
%token AND
%token TRUE
%token FALSE

%%

/* Produções da gramática (sintaxe da linguagem ObsAct) */

PROGRAM:
    DEV_SEC CMD_SEC       { printf("Programa válido\n"); }
    ;

DEV_SEC:
    "dispositivos" ":" DEV_LIST "fimdispositivos"  { printf("Seção de dispositivos válida\n"); }
    ;

CMD_SEC:
    CMD_LIST
    ;

DEV_LIST:
    DEVICE DEV_LIST    { printf("Lista de dispositivos válida\n"); }
    | DEVICE           { printf("Dispositivo único válido\n"); }
    ;

DEVICE:
    ID_DEVICE "[" ID_OBS "]"     { printf("Dispositivo: %s, Sensor: %s\n", $1, $3); }
    | ID_DEVICE                 { printf("Dispositivo: %s\n", $1); }
    ;

CMD_LIST:
    CMD ";" CMD_LIST      { printf("Comando válido\n"); }
    | CMD ";"             { printf("Comando único válido\n"); }
    ;

CMD:
    ALERTA ID_DEVICE ":" MSG "," ID_OBS ";"   { printf("Alerta: Dispositivo: %s, Mensagem: %s, Sensor: %s\n", $2, $4, $6); }
    | "executar" ACTION "em" ID_DEVICE ";"   { printf("Ação executada em: %s\n", $4); }
    ;

ACTION:
    "ligar"   { printf("Ação: Ligar\n"); }
    | "desligar"   { printf("Ação: Desligar\n"); }
    ;

OBS:
    ID_OBS OPLOGIC VAL AND OBS   { printf("Operação lógica: %s %s %s\n", $1, $2, $4); }
    | ID_OBS OPLOGIC VAL     { printf("Operação lógica: %s %s %s\n", $1, $2, $3); }
    ;

%%

int main() {
    printf("Digite o programa ObsAct:\n");
    yyparse();  // Chama o Bison para iniciar a análise
    return 0;
}

int yywrap() {
    return 1;
}
