%{ 
  #include<stdio.h> 
  #include "y.tab.h" 
  void yyerror(char *);
%} 

%option noyywrap
/*Declaracion*/ 


/*Literales*/
DIGITO      [0-9]
ENTERO      DIGITO+
REAL        {DIGITO}+("."{DIGITO}+)?
MINUSCULA   [a-z]
MAYUSCULA   [A-Z]
CADENA      \"{DI}\"

/*Definicion de Simbolos (Variables)*/
VARIABLE    {MINUSCULA}+({MAYUSCULA}|_|{MINUSCULA}|{INT})+
ETIQUETAS 
/*Palabras reservadas*/
FOR         "for"
IF          "if"
SWITCH      "switch"
WHILE       "while"
BREAK       "break"
CONTINUE    "continue"
GOTO        "goto"
AUTO         "auto"
CASE         "case"
CHAR         "char"
CONST        "const"
DEFAULT      "default"
DO           "do"
DOUBLE       "double"
ELSE         "else"
ENUM         "enum"
EXTERN       "extern"
INT          "int"
FLOAT        "float"
SHORT        "short"
LONG         "long"
RETURN       "return"
SIGNED       "signed"
UNSIGNED     "unsigned"
SIZEOF       "sizeof"
STATIC       "static"
STRUCT       "struct"
VOID         "void"

/*Simbolos Especiales*/
PARENTESISL "("
PARENTESISR ")"
CORCHETEL   "["
CORCHETER   "]"
LLAVEL      "{"
LLAVER      "}"
PUNTO       "."
DOSPUNTOS   ":"
PUNTOYCOMA  ";"
COMA        ","

/*Operadores Logicos*/
AND   "&&"
OR    "||"
NOT    "!"
UNITARY_AND "&"
UNITARY_OR  "|"
UNITARY_NOT "~"

/*Operadores Aritmeticos*/
SUMA "+"
RESTA "-"
MULTIPLICACION "*"
DIVISION  "/"
INCREMENTO "++"
DECREMENTO "--"
MODULO "%"
ASIGNACION "="

/*Operadores de relacionales*/

IGUALDAD   "=="
MAYOR_QUE  ">"
MENOR_QUE  "<"
MAYOR_IGUAL  ">="
MENOR_IGUAL  "<="
DIFERENTE    "!="

/*Operadores De Asignacion*/

SUMA_ASIGNACION  "+="
RESTA_ASIGNACION  "-="
MULTIPLION_AIGNACION  "*="
DIVISION_ASIGNACION "/="
MODULO_ASIGNACION  "%="


/* seccion de reglas C */
%% 
{IF|FOR|IF|SWITCH|WHILE|BREAK|CONTINUE|GOTO|AUTO|BREAK|CASE|CHAR|CONST|DEFAULT|DO|DOUBLE|FLOAT|SHORT|LONG|RETURN|SIGNED|UNSIGNED|SIZEOF|STATIC|STRUCT|VOID}{ yylval=atoi(yytext); return PALABRA_RESERVADA; } 
[-()+*/;]            { return *yytext; }
"evaluar"            { return EVALUAR; }
[[:blank:]] ;
.                     yyerror("Unknown character");
%%
