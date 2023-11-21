%{
#include "y.tab.h"
%}

%%

if          return IF;
while       return WHILE;
for         return FOR;
[a-zA-Z_][a-zA-Z0-9_]*   return IDENTIFIER;
[0-9]+      return NUMBER;
"+"         return PLUS;
.           return yytext[0];

%%
