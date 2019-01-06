%{
int chars = 0;
int words = 0;
int lines = 0;

int tot_chars = 0;
int tot_words = 0;
int tot_lines = 0;
%}

%option noyywrap

%%
[a-zA-Z]+	{ words++; chars+=strlen(yytext); }
\n		{ chars++; lines++; }
.		{ chars++; }
%%

int main(int argc, char **argv) {
	int i;	

	if(argc < 2) {
		yylex();
		printf("%8d%8d%8d\n", lines, words, chars);
		return 0;
	}
	
	for(i = 1; i < argc; i++) {
		FILE *f = fopen(argv[i],"r");
	
		if(!f) {
			perror(argv[i]);
			return 1;
		}

		yyrestart(f);
		yylex();
		fclose(f);
		printf("%8d%8d%8d %s\n", lines, words, chars, argv[i]);

		tot_chars += chars; chars = 0;
		tot_words += words; words = 0;
		tot_lines += lines; lines = 0;
	}

	if(argc > 1)
		printf("%8d%8d%8d total\n", tot_lines, tot_words, tot_chars);
	return 0;
}
