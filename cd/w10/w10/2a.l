%option noyywrap
%{
#include<stdio.h>
#include"y.tab.h"
#include<math.h>
%}
%%
[0-9] {yylval.dval=atof(yytext);return NUMBER;}
[t];
n return 0;
. {return yytext[0];}
%%
void yyerror(char * str)
{
 printf("\nInvalid Expression");
}
int main()
{
 yyin=fopen("prefix.txt","r");
 yyparse();
 return(0);
}
