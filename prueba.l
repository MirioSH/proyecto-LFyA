%{ 
  #include <stdio.h> 
  #include "y.tab.h" 
  extern int yylval;
  void yyerror(char *);
%} 

%option noyywrap

%%

/* Definiciones de patrones */
DIGITO           [0-9]
ENTERO           {DIGITO}+
REAL             {DIGITO}+"."{DIGITO}+
IDENTIFICADOR    [a-zA-Z_][a-zA-Z0-9_]*

/* Palabras reservadas */
"for"            { return FOR; }
"if"             { return IF; }
"switch"         { return SWITCH; }
"while"          { return WHILE; }
"break"          { return BREAK; }
"continue"       { return CONTINUE; }
"goto"           { return GOTO; }
"auto"           { return AUTO; }
"case"           { return CASE; }
"char"           { return CHAR; }
"const"          { return CONST; }
"default"        { return DEFAULT; }
"do"             { return DO; }
"double"         { return DOUBLE; }
"else"           { return ELSE; }
"enum"           { return ENUM; }
"extern"         { return EXTERN; }
"int"            { return INT; }
"float"          { return FLOAT; }
"short"          { return SHORT; }
"long"           { return LONG; }
"return"         { return RETURN; }
"signed"         { return SIGNED; }
"unsigned"       { return UNSIGNED; }
"sizeof"         { return SIZEOF; }
"static"         { return STATIC; }
"struct"         { return STRUCT; }
"void"           { return VOID; }

/* Números */
{ENTERO}         { yylval = atoi(yytext); return NUMERO; }
{REAL}           { yylval = atof(yytext); return REAL; }

/* Identificadores */
{IDENTIFICADOR}  { yylval = strdup(yytext); return IDENTIFICADOR; }

/* Operadores y símbolos */
"+"             { return SUMA; }
"-"             { return RESTA; }
"*"             { return MULTIPLICACION; }
"/"             { return DIVISION; }
"("             { return PARENTESISL; }
")"             { return PARENTESISR; }
"["             { return CORCHETEL; }
"]"             { return CORCHETER; }
"{"             { return LLAVEL; }
"}"             { return LLAVER; }
"."             { return PUNTO; }
":"             { return DOSPUNTOS; }
";"             { return PUNTOYCOMA; }
","             { return COMA; }

/* Espacios y tabulaciones */
[ \t\r\n]+      { /* ignorar espacios en blanco */ }

/* Caracteres no reconocidos */
.               { yyerror("Caracter desconocido"); }

%%



int main(int argc, char **argv) {
    /* Código para iniciar el análisis léxico */
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
