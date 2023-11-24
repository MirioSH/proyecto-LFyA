%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
void yyerror(char *s);
%}

%token IF ELSE FOR WHILE DO BREAK CONTINUE GOTO RETURN
%token INT FLOAT CHAR DOUBLE VOID
%token AUTO CASE CONST DEFAULT ENUM EXTERN LONG SHORT SIGNED STATIC STRUCT UNSIGNED
%token SIZEOF
%token IDENTIFICADOR NUMERO REAL
%token SUMA RESTA MULTIPLICACION DIVISION
%token PARENTESISL PARENTESISR CORCHETEL CORCHETER LLAVEL LLAVER
%token PUNTO DOSPUNTOS PUNTOYCOMA COMA

%%
/* Reglas de gramática */

programa : lista_sentencias;

lista_sentencias : lista_sentencias sentencia
                 | sentencia
                 ;

sentencia : sentencia_if
          | sentencia_while
          | sentencia_for
          | expresion PUNTOYCOMA
          | PUNTOYCOMA
          ;

sentencia_if : IF PARENTESISL expresion PARENTESISR LLAVEL lista_sentencias LLAVER
             | IF PARENTESISL expresion PARENTESISR LLAVEL lista_sentencias LLAVER ELSE LLAVEL lista_sentencias LLAVER
             ;

sentencia_while : WHILE PARENTESISL expresion PARENTESISR LLAVEL lista_sentencias LLAVER
                ;

sentencia_for : FOR PARENTESISL expresion_opcional PUNTOYCOMA expresion PUNTOYCOMA expresion_opcional PARENTESISR LLAVEL lista_sentencias LLAVER
              ;

expresion_opcional : expresion
                   | /* vacío */
                   ;

expresion : IDENTIFICADOR
          | NUMERO
          | REAL
          | expresion SUMA expresion
          | expresion RESTA expresion
          | expresion MULTIPLICACION expresion
          | expresion DIVISION expresion
          | PARENTESISL expresion PARENTESISR
          ;

%%

int main() {
    printf("Inicio del análisis sintáctico.\n");
    yyparse();
    printf("Análisis sintáctico completado.\n");
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Error de sintaxis: %s\n", s);
}
