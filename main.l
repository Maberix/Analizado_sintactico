%{
#include <stdio.h>
#include "main.tab.h"
int yylexerror(void);

%}

TRUE "true"
FALSE "false"
AND "and"
OR "or"
NOT "not"
LPAREN ["("]
RPAREN [")"]

%%
{TRUE}    {printf("TRUE\n");   return TRUE;};
{FALSE}   {printf("FALSE\n");  return FALSE;};
{AND}     {printf("AND\n");    return AND;};
{OR}      {printf("OR\n");     return OR;};
{NOT}     {printf("NOT\n");    return NOT;};
{LPAREN}  {printf("LPAREN\n"); return LPAREN;};
{RPAREN}  {printf("RPAREN\n"); return RPAREN;};
" "
"\n"
"\t"
.         yylexerror();

%%
int yylexerror(void){
    printf("\nError lexico: caracter invalido: %s, saliendo ...\n", yytext);
    exit(1);
}

int yywrap(){
    return 1;
}