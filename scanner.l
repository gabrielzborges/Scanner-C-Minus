%option yylineno
%{
#include <stdio.h>
%}

/* LABELS */
ELSE    (else)
IF      (if)
INPUT   (input)
INT     (int)
OUTPUT  (output)
RETURN  (return)
VOID    (void)
WHILE   (while)
WRITE   (write)

PLUS    ("+")
MINUS   ("-")
TIMES   ("*")
OVER    ("/")
LT      ("<")
LE      ("<=")
GT      (">")
GE      (">=")
EQ      ("==")
NEQ     ("!=")
ASSIGN  ("=")

SEMI    (";")
COMMA   (",")
LPAREN  ("(")
RPAREN  (")")
LBRACK  ("[")
RBRACK  ("]")
LBRACE  ("{")
RBRACE  ("}")

NUM     [0-9]+
ID      [a-zA-Z][0-9a-zA-Z]*
STRING   \"([^\\\"]|\\.)*\"

SPACE   [ \t\n]
/* abaixo temos o comentario. a expressao regular dele é alguma coisa que comece com //                                         */
/*                                                             OU                                                               */
/* alguma coisa que comece com contrabarra+asterisco, tenha qualquer caractere execeto '*' ou contenha * mas nao contenha       */
/* asterisco+contrabarra, e termine com asterisco+contrabarra                                                                   */
COMMENT ("//".*)|"/*"([^*]|(\*+[^*/]))*\*+\/
UNKNOWN .

/* yylineno nos diz a linha e eh incrementada pelo %option yylineno; yytext nos diz os caracteres lidos */
%%
{ELSE}    { printf("%d: else -> ELSE\n", yylineno); }
{IF}      { printf("%d: if -> IF\n", yylineno); }
{INPUT}   { printf("%d: input -> INPUT\n", yylineno); }
{INT}     { printf("%d: int -> INT\n", yylineno); }
{OUTPUT}  { printf("%d: output -> OUTPUT\n", yylineno); }
{RETURN}  { printf("%d: return -> RETURN\n", yylineno); }
{VOID}    { printf("%d: void -> VOID\n", yylineno); }
{WHILE}   { printf("%d: while -> WHILE\n", yylineno); }
{WRITE}   { printf("%d: write -> WRITE\n", yylineno); }

{PLUS}    { printf("%d: + -> PLUS\n", yylineno); }
{MINUS}   { printf("%d: - -> MINUS\n", yylineno); }
{TIMES}   { printf("%d: * -> TIMES\n", yylineno); }
{OVER}    { printf("%d: / -> OVER\n", yylineno); }
{LT}      { printf("%d: < -> LT\n", yylineno); }
{LE}      { printf("%d: <= -> LE\n", yylineno); }
{GT}      { printf("%d: > -> GT\n", yylineno); }
{GE}      { printf("%d: >= -> GE\n", yylineno); }
{EQ}      { printf("%d: == -> EQ\n", yylineno); }
{NEQ}     { printf("%d: != -> NEQ\n", yylineno); }
{ASSIGN}  { printf("%d: = -> ASSIGN\n", yylineno); }

{SEMI}    { printf("%d: ; -> SEMI\n", yylineno); }
{COMMA}   { printf("%d: , -> COMMA\n", yylineno); }
{LPAREN}  { printf("%d: ( -> LPAREN\n", yylineno); }
{RPAREN}  { printf("%d: ) -> RPAREN\n", yylineno); }
{LBRACK}  { printf("%d: [ -> LBRACK\n", yylineno); }
{RBRACK}  { printf("%d: ] -> RBRACK\n", yylineno); }
{LBRACE}  { printf("%d: { -> LBRACE\n", yylineno); }
{RBRACE}  { printf("%d: } -> RBRACE\n", yylineno); }

{NUM}     { printf("%d: %s -> NUM\n", yylineno, yytext); }
{ID}      { printf("%d: %s -> ID\n", yylineno, yytext); }
{STRING}  { printf("%d: %s -> STRING\n", yylineno, yytext); }

{SPACE}   {}
{COMMENT} {}
{UNKNOWN} { printf("%d: %s -> UNKNOWN\n", yylineno, yytext); }
%%

int main(){
  yylex();
  return 0;
}

/* Definido esta funcao nao precisa compilar com - lfl*/
int yywrap() { return 1; }