%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h" 

extern int yylex();
extern int yylineno;
extern char* yytext;

void yyerror(const char *s);
%}

%token DIGITO ENTERO REAL MINUSCULA MAYUSCULA CADENA CONSTANTE 

%token VARIABLE ETIQUETAS

%token IF ELSE SWITCH WHILE FOR BREAK CONTINUE GOTO CASE DEFAULT DO AUTO CHAR CONST DOUBLE ENUM EXTERN FLOAT SHORT LONG RETURN SIGNED UNSIGNED SIZEOF STATIC STRUCT VOID

%token PARENTESISL PARENTESISR CORCHETEL CORCHETER LLAVEL LLAVER PUNTO DOSPUNTOS PUNTOYCOMA COMA

%token AND OR NOT UNITARY_AND UNITARY_OR UNITARY_NOT

%token SUMA RESTA MULTIPLICACION DIVISION INCREMENTO DECREMENTO MODULO ASIGNACION

%token IGUALDAD MAYOR_QUE MENOR_QUE MAYOR_IGUAL MENOR_IGUAL DIFERENTE

%token SUMA_ASIGNACION RESTA_ASIGNACION MULTIPLION_AIGNACION DIVISION_ASIGNACION MODULO_ASIGNACION



%%

/* Reglas de producción */

statement:
    if_statement
    | if_else_statement
    | switch_statement
    | while_statement
    | do_while_statement
    | for_statement
    | break_statement
    | continue_statement
    | goto_statement
    ;

if_statement:
    IF PARENTESISL expression PARENTESISR LLAVEL statements LLAVER
    ;

if_else_statement:
    IF PARENTESISL expression PARENTESISR LLAVEL statements LLAVER ELSE LLAVEL statements LLAVER
    ;

switch_statement:
    SWITCH PARENTESISL expression PARENTESISR LLAVEL case_statements LLAVER
    ;

case_statements:
    | case_statements CASE DIGITO DOSPUNTOS statements BREAK PUNTOYCOMA
    | DEFAULT DOSPUNTOS statements
    ;

while_statement:
    WHILE PARENTESISL expression PARENTESISR LLAVEL statements LLAVER
    ;

do_while_statement:
    DO LLAVEL statements LLAVER WHILE PARENTESISL expression PARENTESISR PUNTOYCOMA
    ;

for_statement:
    FOR PARENTESISL init_statement expression_statement update_statement PARENTESISR LLAVEL statements LLAVER
    ;

init_statement:
    | VARIABLE ASIGNACION expression
    | tipo VARIABLE
    ;

tipo:
    INT | FLOAT | CHAR | DOUBLE
    ;

expression_statement:
    expression PUNTOYCOMA
    ;

update_statement:
    VARIABLE INCREMENTO
    | VARIABLE DECREMENTO
    ;

break_statement:
    BREAK PUNTOYCOMA
    ;

continue_statement:
    CONTINUE PUNTOYCOMA
    ;

goto_statement:
    GOTO VARIABLE PUNTOYCOMA
    ;

expression:
    VARIABLE
    | ENTERO
    | VARIABLE IGUALDAD expression
    | expression IGUALDAD IGUALDAD expression
    | expression MAYOR_QUE expression
    | expression MENOR_QUE expression
    | expression MAYOR_IGUAL expression
    | expression MENOR_IGUAL expression
    | expression DIFERENTE expression
    ;

statements:
    | statements statement
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s en la línea %d\n", s, yylineno);
}

int main(void) {
    yyparse();
    return 0;
}
