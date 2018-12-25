%{
	enum yytokentype {
		NUMBER = 258,
		ADD = 259,
		SUB = 260,
		MUL = 261,
		DIV = 262,
		ABS = 263,
		EQL = 264
	};
	
	int yylval;
%}

%option noyywrap

%%
"+"	{ return ADD; }
"-"	{ return SUB; }
"*"	{ return MUL; }
"/"	{ return DIV; }
"|"	{ return ABS; }
[0-9]+	{yylval = atoi(yytext); return NUMBER; }
\n	{ return EQL; }
[ \t]	{ /*ignore whitespace */ }
.	{ printf("Mystery character %c\n", *yytext); }
%%

int main(int agrc, char **argv) {
	int tok;
	while(tok = yylex()) {
		printf("%d",tok);
		if(tok == NUMBER) printf(" = %d\n", yylval);
		else printf("\n");
	}
}
