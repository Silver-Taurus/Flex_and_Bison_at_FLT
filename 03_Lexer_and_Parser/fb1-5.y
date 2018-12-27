%{
#include <stdio.h>
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%
calclist:
	| calclist exp {printf(" = %d\n", $1) EOL; }
	;

exp: factor 
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }
	;

factor: term 
	| factor MUL term { $$ = $1 * $3; }
	| factor DIV term { $$ = $1 / $3; }
	;

term: NUMBER 
	| ABS term { && = $2 >= 0? $2 : - $2; }
	;
%%

int main(int argc, char **argv) {
	yyparse();
}

