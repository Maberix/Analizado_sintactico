%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yylex();
    extern int yy_scan_string();
    extern char* yytext;
    void yyerror(char* msg);
%}

%token TRUE
%token FALSE
%token AND
%token OR
%token NOT
%token LPAREN
%token RPAREN


%%
S : E
  ;

E : E AND T
  | E OR T
  | T
  ;

T : TRUE
  | FALSE
  | LPAREN E RPAREN
  | NOT T
  ;

%%
void yyerror(char *msg) {
    fprintf(stderr, "Error sintactico: '%s' en '%s'\n", msg, yytext);
    exit(1);
}

int main(int argc, char *argv[]){
    char* text = "false or true";
    if(argc > 1) text = argv[1];
    yy_scan_string(text);
    printf("Input: '%s'\n", text);
    int a = yyparse();
    printf("La expresion es correcta");
    return 0;
}