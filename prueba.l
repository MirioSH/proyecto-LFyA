/*SECCION 1  Bibliotecas*/
%{
    /*Las librerias que vamoos a utilizar*/
    #include <stdio.h>
  
%}

/*SECCION 2 :Declaracion*/

/*Literales*/
DIGITO      [0-9]
ENTERO      DIGITO+
REAL        {DIGITO}+("."{DIGITO}+)?
MINUSCULA   [a-z]
MAYUSCULA   [A-Z]
CADENA      \"{DIGITO}\"
CONSTANTE       [A-Z]+(_[A-Z])*

/*Definicion de Simbolos (Variables)*/
VARIABLE    {MINUSCULA}+({MAYUSCULA}|_|{MINUSCULA}|{INT})+
ETIQUETAS    _?({VARIABLE}|{CONSTANTE}):

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


/*SECCION 3 : reglas C */
%%


{DIGITO}       { printf("Literales"); return literales; }
{ENTERO}        { printf("Literales"); return literales; }
{REAL}          { printf("Literales"); return literales; }
{MINUSCULA}     { printf("Literales"); return literales; }
{MAYUSCULA}     { printf("Literales"); return literales; }
{CADENA}        { printf("Literales"); return literales; }
{CONSTANTE}     { printf("Literales"); return literales; }


{VARIABLE}     { printf("Variables"); return variables; }
{ETIQUETAS}    { printf("Variables"); return variables; }


{IF}            { printf("Palabra reservada if"); return palabra_reservada; }
{ELSE}          { printf("Palabra reservada else"); return palabra_reservada; }
{SWITCH}        { printf("Palabra reservada switch"); return palabra_reservada; }
{CASE}          { printf("Palabra reservada case"); return palabra_reservada; }
{DEFAULT}       { printf("Palabra reservada default"); return palabra_reservada; }
{FOR}           { printf("Palabra reservada for"); return palabra_reservada; }
{WHILE}         { printf("Palabra reservada while"); return palabra_reservada; }
{DO}            { printf("Palabra reservada do"); return palabra_reservada; }
{BREAK}         { printf("Palabra reservada break"); return palabra_reservada; }
{CONTINUE}      { printf("Palabra reservada continue"); return palabra_reservada; }
{GOTO}          { printf("Palabra reservada goto"); return palabra_reservada; }
{AUTO}          { printf("Palabra reservada continue"); return palabra_reservada; }
{CHAR}          { printf("Palabra reservada char"); return palabra_reservada; }
{CONST}         { printf("Palabra reservada const"); return palabra_reservada; }
{DOUBLE}        { printf("Palabra reservada double"); return palabra_reservada; }
{ENUM}          { printf("Palabra reservada enum"); return palabra_reservada; }
{EXTERN}        { printf("Palabra reservada extern"); return palabra_reservada; }
{INT}           { printf("Palabra reservada int"); return palabra_reservada; }
{DOUBLE}        { printf("Palabra reservada double"); return palabra_reservada; }
{FLOAT}         { printf("Palabra reservada float"); return palabra_reservada; }
{SHORT}         { printf("Palabra reservada short"); return palabra_reservada; }
{LONG}          { printf("Palabra reservada long"); return palabra_reservada; }
{RETURN}        { printf("Palabra reservada return"); return palabra_reservada; }
{SIGNED}        { printf("Palabra reservada signed"); return palabra_reservada; }
{UNSIGNED}      { printf("Palabra reservada unsigned"); return palabra_reservada; }
{SIZEOF}        { printf("Palabra reservada sizeof"); return palabra_reservada; }
{STATIC}        { printf("Palabra reservada static"); return palabra_reservada; }
{STRUCT}        { printf("Palabra reservada struct"); return palabra_reservada; }
{VOID}         
 

{PARENTESISL}    { printf("Simbolo especial"); return simbolo_especial; }
{PARENTESISR}    { printf("Simbolo especial"); return simbolo_especial; }
{CORCHETEL}      { printf("Simbolo especial"); return simbolo_especial; }
{CORCHETER}      { printf("Simbolo especial"); return simbolo_especial; }
{LLAVEL}         { printf("Simbolo especial"); return simbolo_especial; }
{LLAVER}         { printf("Simbolo especial"); return simbolo_especial; }
{PUNTO}          { printf("Simbolo especial"); return simbolo_especial; }
{DOSPUNTOS}      { printf("Simbolo especial"); return simbolo_especial; }
{PUNTOYCOMA}     { printf("Simbolo especial"); return simbolo_especial; }
{COMA}           { printf("Simbolo especial"); return simbolo_especial; }


{AND}            { printf("operador logico"); return operador_logico; }
{OR}             { printf("operador logico"); return operador_logico; }
{NOT}            { printf("operador logico"); return operador_logico; }
{UNITARY_AND}    { printf("operador logico"); return operador_logico; }
{UNITARY_OR}     { printf("operador logico"); return operador_logico; }
{UNITARY_NOT}    { printf("operador logico"); return operador_logico; }
 

{SUMA}           { printf("operador aritmetico"); return aritmeticos; } 
{RESTA}          { printf("operador aritmetico"); return aritmeticos; }
{MULTIPLICACION} { printf("operador aritmetico"); return aritmeticos; }
{DIVISION}       { printf("operador aritmetico"); return aritmeticos; }
{INCREMENTO}     { printf("operador aritmetico"); return aritmeticos; }
{DECREMENTO}     { printf("operador aritmetico"); return aritmeticos; }
{MODULO}         { printf("operador aritmetico"); return aritmeticos; } 
{ASIGNACION}     { printf("operador aritmetico"); return aritmeticos; }


{IGUALDAD}       { printf("operador relacional"); return Operador_relacional; }
{MAYOR_QUE}      { printf("operador relacional"); return Operador_relacional; }
{MENOR_QUE}      { printf("operador relacional"); return Operador_relacional; }
{MAYOR_IGUAL}    { printf("operador relacional"); return Operador_relacional; }
{MENOR_IGUAL}    { printf("operador relacional"); return Operador_relacional; }
{DIFERENTE}      { printf("operador relacional"); return Operador_relacional; }


{SUMA_ASIGNACION}       { printf("operador de Asignacion"); return Operador_de_Asignacion; }
{RESTA_ASIGNACION}      { printf("operador de Asignacion"); return Operador_de_Asignacion; }
{MULTIPLION_AIGNACION}  { printf("operador de Asignacion"); return Operador_de_Asignacion; }
{DIVISION_ASIGNACION}   { printf("operador de Asignacion"); return Operador_de_Asignacion; }
{MODULO_ASIGNACION}     { printf("operador de Asignacion"); return Operador_de_Asignacion; }


.               { printf("Error: %s", yytext); return identificador; }


%%

int yywrap(){}

int main(int argc, char *argv[]) {
    FILE    *file;

    if (!(file = fopen(argv[1], "r")))
        return (-1);

    yyrestart(file);
    yylex();
    yywrap();
    fclose(file);
    return 0;
}
