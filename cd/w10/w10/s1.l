%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
extern int yyval;
%}

alpha [A-Za-z]
digit [0-9]

%%
" " return SPACE;
[ /t] ;
"printf(hello world)" return INSIDE;
"default:" return DEFAULT;
"printf(invalid input)" return ERR;
"int main()\n{\n" return START;
"\nreturn 0;\n}" return END;
"switch(i):" return SWITCH;
"case 1:"|"case 2:"|"case 3:" return CASE;
"int"|"float"|"char" return KEY;
";" return SEM;
[sS][0-9]*|[a-b]* return S;
[0-9]+ return NUM;
[A-Za-z]([A-Za-z]|[0-9])* return ID;
"<="|">="|"=="|"!="|"||"|"&&"|"<"|">" return RELOP;
"=" return EQ;
"+"|"-" return OP;
"++"|"--" return INC;
"\n" return NL;
. return(yytext[0]);

%%
