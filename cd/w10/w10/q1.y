
%{
#include <ctype.h>
#include <stdio.h>
#include <math.h>
#define YYSTYPE double
int flag =0;
%}
%token NUMBER
%left '+' '-'
%left '*' '/' '^'
%right UMINUS
%%
lines : lines expr '\n' { printf("%g\n", $2); }
      | lines '\n'
      | 
;
expr : expr expr '+' { $$ = $1 + $2; }
     | expr expr '-' { $$ = $1 - $2; }
     | expr expr '*' { $$ = $1 * $2; }
     | expr expr '/' { $$ = $1 / $2; }

     | NUMBER
;
%%
float yylex() {
int c;
while ( ( c = getchar() ) == ' ' );
if ( (c == '.') || (isdigit(c)) ) {
ungetc(c, stdin);
scanf("%lf", &yylval);
return NUMBER;
}
return c;
}
void yyerror(const char *s){ 
	printf("Invalid expression \n");
	flag =1;
	}
void main() {
	printf("Enter your expression:\n");
	yyparse();
	if(flag==0) {
	printf("\nvalid expression");
	}
}


