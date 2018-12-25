/* recognize tokens for the calculator and print them out */
%{
	#include "fb1-5.tab.h";
%}

%option noyywrap

%%
"+"	{ return ADD; }
"-"	{ return SUB; }
"*"	{ return MUL; }
"/"	{ return DIV; }
"|"	{ return ABS; }
[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
\n	{ return EOL; }
[ \t]	{ /* ignore whitespace */ }
.	{ printf("Mystery character %c\n", *yytext); }
%%


int main(int argc, char **argv) { yylex(); }
