%{
#include <string.h> 
#include <stdlib.h> 
#include "sintactico.tab.h" 
int yylex();
int yyparse();
%}
 
%%
"==>" { return(ASSGNOP); }
[0-9]+ { yylval.intval = atoi( yytext );return(NUMBER); }
hacer { return(DO); }
contrario { return(ELSE); }
fin { return(END); }
finif { return(FI); }
si { return(IF); }
entrada { return(IN); }
var { return(INTEGER); }
iniciar { return(LET); }
leer { return(READ); }
omitir { return(SKIP); }
entonces { return(THEN); }
mientras { return(WHILE); }
escribir { return(WRITE); }
imprimir { return(PRINT);}
[a-z][a-z0-9]* { yylval.id = (char *) strdup(yytext);return(IDENTIFIER); }
\"(\\.|[^\\])*\" {yylval.id = strdup(yytext); return(STRING);}
[ \t\n]+ { }
. { return(yytext[0]); }
%%

int yywrap(void){ return 0;}
