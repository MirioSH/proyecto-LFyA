%{
#include <stdio.h>
%}

%token IF WHILE FOR IDENTIFIER NUMBER PLUS

%%

program:
       | program statement
       ;

statement: IF '(' expression ')' statement
         | WHILE '(' expression ')' statement
         | FOR '(' expression ';' expression ';' expression ')' statement
         | IDENTIFIER '=' expression ';'
         ;

expression: NUMBER
          | IDENTIFIER
          | expression PLUS expression
          ;

%%

int main(void) {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
