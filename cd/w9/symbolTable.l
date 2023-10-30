%{                                                                                                                                                   
        #include <stdio.h>                                                                                                                           
        #include <stdlib.h>                                                                                                                          
        #include "y.tab.h"                                                                                                                           
        extern int yylval;                                                                                                                           
%}                                                                                                                                                   
                                                                                                                                                     
alpha [A-Za-z]                                                                                                                                       
digit [0-9]                                                                                                                                          
                                                                                                                                                     
%%                                                                                                                                                   
                                                                                                                                                     
[\t\n]|" "  {return DELIMITER;}                                                                                                                      
                                                                                                                                                     
"int"   {ECHO; yylval=*yytext; return INT;}                                                                                                          
"float"   {ECHO; yylval=*yytext; return FLOAT;}                                                                                                      
"double"   {ECHO; yylval=*yytext; return DOUBLE;}                                                                                                    
"if"   {ECHO; yylval=*yytext; return IF;}                                                                                                            
"else"   {ECHO; yylval=*yytext; return ELSE;}                                                                                                        
"for"   {ECHO; yylval=*yytext; return FOR;}                                                                                                          
"while"   {ECHO; yylval=*yytext; return WHILE;}                                                                                                      
"do"   {ECHO; yylval=*yytext; return DO;}                                                                                                            
"switch"   {ECHO; yylval=*yytext; return SWITCH;}                                                                                                    
"auto"   {ECHO; yylval=*yytext; return AUTO;}                                                                                                        
"const"   {ECHO; yylval=*yytext; return CONST;}                                                                                                      
"short"   {ECHO; yylval=*yytext; return SHORT;}                                                                                                      
"struct"   {ECHO; yylval=*yytext; return STRUCT;}                                                                                                    
"unsigned"   {ECHO; yylval=*yytext; return UNSIGNED;}                                                                                                
"break"   {ECHO; yylval=*yytext; return BREAK;}                                                                                                      
"continue"   {ECHO; yylval=*yytext; return CONTINUE;}                                                                                                
"long"   {ECHO; yylval=*yytext; return LONG;}                                                                                                        
"signed"   {ECHO; yylval=*yytext; return SIGNED;}                                                                                                    
"void"   {ECHO; yylval=*yytext; return VOID;}                                                                                                        
"case"   {ECHO; yylval=*yytext; return CASE;}                                                                                                        
"default"   {ECHO; yylval=*yytext; return DEFAULT;}                                                                                                  
"enum"   {ECHO; yylval=*yytext; return ENUM;}                                                                                                        
"goto"   {ECHO; yylval=*yytext; return GOTO;}                                                                                                        
"register"   {ECHO; yylval=*yytext; return REGISTER;}                                                                                                
"sizeof"   {ECHO; yylval=*yytext; return SIZEOF;}                                                                                                    
"typedef"   {ECHO; yylval=*yytext; return TYPEDEF;}                                                                                                  
"volatile"   {ECHO; yylval=*yytext; return VOLATILE;}                                                                                                
"char"   {ECHO; yylval=*yytext; return CHAR;}                                                                                                        
"extern"   {ECHO; yylval=*yytext; return EXTERN;}                                                                                                    
"return"   {ECHO; yylval=*yytext; return RETURN;}                                                                                                    
"static"   {ECHO; yylval=*yytext; return STATIC;}                                                                                                    
"union"   {ECHO; yylval=*yytext; return UNION;}                                                                                                      
                                                                                                                                                     
{digit}+   {ECHO; return UNUM;}                                                                                                                      
{digit}+("."{digit}+)?([Ee][+\-]?{digit}+)?     {ECHO; return RNUM;}                                                                                 
[+\-]?{digit}+  {ECHO; return SNUM;}                                                                                                                 
{alpha}+[{digit}_]*   {ECHO; return ID;}                                                                                                             
                                                                                                                                                     
";"     {ECHO; return SEMICOLON;}                                                                                                                    
"{"     {ECHO; return OPENBRACE;}                                                                                                                    
"}"     {ECHO; return CLOSEBRACE;}                                                                                                                   
"("     {ECHO; return OPENPARAN;}                                                                                                                    
")"     {ECHO; return CLOSEPARAN;}                                                                                                                   
"["     {ECHO; return OPENSQUARE;}                                                                                                                   
"]"     {ECHO; return CLOSESQUARE;}                                                                                                                  
"'"     {ECHO; return SINGLEQ;}                                                                                                                      
"\""     {ECHO; return DOUBLEQ;}                                                                                                                     
"="     {ECHO; return EQUAL;}                                                                                                                        
"++"     {ECHO; return INCRE;}                                                                                                                       
"--"     {ECHO; return DECRE;}                                                                                                                       
"|"     {ECHO; return BOR;}                                                                                                                          
"&"     {ECHO; return BAND;}                                                                                                                         
"!"     {ECHO; return NOT;}                                                                                                                          
"^"     {ECHO; return XOR;}                                                                                                                          
"+"     {ECHO; return PLUS;}                                                                                                                         
"-"     {ECHO; return MINUS;}                                                                                                                        
"*"     {ECHO; return ASTERISK;}                                                                                                                     
"/"     {ECHO; return SLASH;}                                                                                                                        
"%"     {ECHO; return MODULUS;}                                                                                                                      
"~"     {ECHO; return TILDE;}                                                                                                                        
"<<"     {ECHO; return LEFTS;}                                                                                                                       
">>"     {ECHO; return RIGHTS;}                                                                                                                      
"+="     {ECHO; return ADDAS;}                                                                                                                       
"-="     {ECHO; return SUBAS;}                                                                                                                       
"*="     {ECHO; return MULAS;}                                                                                                                       
"/="     {ECHO; return DIVAS;}                                                                                                                       
"%="     {ECHO; return MODAS;}                                                                                                                       
"<<="     {ECHO; return LSAS;}                                                                                                                       
">>="     {ECHO; return RSAS;}                                                                                                                       
"&="     {ECHO; return ANDAS;}                                                                                                                       
"^="     {ECHO; return XORAS;}                                                                                                                       
"|="     {ECHO; return ORAS;}                                                                                                                        
"?:"     {ECHO; return CONDOP;}                                                                                                                      
"<"     {ECHO; return LT;}                                                                                                                           
">"     {ECHO; return GT;}                                                                                                                           
"<="     {ECHO; return LE;}                                                                                                                          
">="     {ECHO; return GE;}                                                                                                                          
"=="     {ECHO; return EQ;}                                                                                                                          
"!="     {ECHO; return NE;}                                                                                                                          
"&&"     {ECHO; return LAND;}                                                                                                                        
"||"     {ECHO; return LOR;}                                                                                                                         
                                                                                                                                                     
.       {return yytext[0];}                                                                                                                          
                                                                                                                                                     
%%                                                                                                                                                   
                                                                                                                                                     
[s2021103520@centos8-linux Tue Oct 31 12:08 AM week9]$ cat 2.y                                                                                       
%{                                                                                                                                                   
        #include<stdio.h>                                                                                                                            
        #include<stdlib.h>                                                                                                                           
                                                                                                                                                     
        int yyerror();                                                                                                                               
        int yylex();                                                                                                                                 
        int IdentifierCount = 0;                                                                                                                     
%}                                                                                                                                                   
                                                                                                                                                     
%token ID UNUM RNUM SNUM INT FLOAT DOUBLE IF ELSE FOR WHILE DO SWITCH AUTO CONST SHORT STRUCT UNSIGNED BREAK CONTINUE LONG SIGNED VOID CASE DEFAULT E
NUM GOTO REGISTER                                                                                                                                    
%token SIZEOF TYPEDEF VOLATILE CHAR EXTERN RETURN STATIC UNION SEMICOLON OPENBRACE CLOSEBRACE OPENPARAN CLOSEPARAN OPENSQUARE CLOSESQUARE SINGLEQ DOU
BLEQ                                                                                                                                                 
                                                                                                                                                     
%right INCRE DECRE CONDOP DELIMITER                                                                                                                  
                                                                                                                                                     
%left EQUAL BOR BAND NOT XOR PLUS MINUS ASTERISK SLASH MODULUS TILDE LEFTS RIGHTS ADDAS SUBAS MULAS DIVAS MODAS LSAS RSAS ANDAS ORAS XORAS LT GT LE G
E EQ NE LAND LOR                                                                                                                                     
                                                                                                                                                     
%%                                                                                                                                                   
S: ST {exit(0);}                                                                                                                                     
                                                                                                                                                     
 ST: ST ST                                                                                                                                           
  | ID {IdentifierCount++;printf(" is the Symbol \nType = Identifier\nSymbol table entry = %d\n\n",IdentifierCount);}                                
  | UNUM {IdentifierCount++;printf(" is the Symbol \nType = Unsigned numeric identifier\nSymbol table entry = %d\n\n",IdentifierCount);}             
  | SNUM {IdentifierCount++;printf(" is the Symbol \nType = Signed numeric identifier\nSymbol table entry = %d\n\n",IdentifierCount);}               
  | RNUM {IdentifierCount++;printf(" is the Symbol \nType = Rational numeric identifier\nSymbol table entry = %d\n\n",IdentifierCount);}             
                                                                                                                                                     
  | INT {printf(" is the Symbol\nType = Keyword defining datatype\nDatatype = int\n\n");}                                                            
  | FLOAT {printf(" is the symbol\nType = Keyword defining datatype\nDatatype = float\n\n");}                                                        
  | DOUBLE {printf(" is the symbol\nType = keyword defining datatype\nDatatype = double\n\n");}                                                      
  | AUTO {printf(" is the symbol\nType = keyword defining datatype\nDatatype = auto\n\n");}                                                          
  | CONST {printf(" is the symbol\nType = keyword defining datatype\nDatatype = const\n\n");}                                                        
  | SHORT {printf(" is the symbol\nType = keyword defining datatype\nDatatype = short\n\n");}                                                        
  | STRUCT {printf(" is the symbol\nType = keyword defining datatype\nDatatype = struct\n\n");}                                                      
  | UNSIGNED {printf(" is the symbol\nType = keyword defining datatype\nDatatype = unsigned\n\n");}                                                  
  | LONG {printf(" is the symbol\nType = keyword defining datatype\nDatatype = long\n\n");}                                                          
  | SIGNED {printf(" is the symbol\nType = keyword defining datatype\nDatatype = signed\n\n");}                                                      
  | VOID {printf(" is the symbol\nType = keyword defining datatype\nDatatype = void\n\n");}                                                          
  | ENUM {printf(" is the symbol\nType = keyword defining datatype\nDatatype = enum\n\n");}                                                          
  | REGISTER {printf(" is the symbol\nType = keyword defining datatype\nDatatype = register\n\n");}                                                  
  | TYPEDEF {printf(" is the symbol\nType = keyword defining datatype\nDatatype = typedef\n\n");}                                                    
  | VOLATILE {printf(" is the symbol\nType = keyword defining datatype\nDatatype = volatile\n\n");}                                                  
  | CHAR {printf(" is the symbol\nType = keyword defining datatype\nDatatype = char\n\n");}                                                          
  | EXTERN {printf(" is the symbol\nType = keyword defining datatype\nDatatype = extern\n\n");}                                                      
  | STATIC {printf(" is the symbol\nType = keyword defining datatype\nDatatype = static\n\n");}                                                      
    | UNION {printf(" is the symbol\nType = keyword defining datatype\nDatatype = union\n\n");}                                                      
                                                                                                                                                     
| IF {printf(" is the symbol\nType = keyword defining condition\nCondition Type = if\n\n");}                                                         
  | ELSE {printf(" is the symbol\nType = keyword defining condition\nCondition Type = else\n\n");}                                                   
  | CASE {printf(" is the symbol\nType = keyword defining condition\nCondition Type = case\n\n");}                                                   
  | DEFAULT {printf(" is the symbol\nType = keyword defining condition\nCondition Type = default\n\n");}                                             
  | BREAK {printf(" is the symbol\nType = keyword defining condition\nCondition Type = break\n\n");}                                                 
  | CONTINUE {printf(" is the symbol\nType = keyword defining condition\nCondition Type = continue\n\n");}                                           
  | GOTO {printf(" is the symbol\nType = keyword defining condition\nCondition Type = goto\n\n");}                                                   
  | RETURN {printf(" is the symbol\nType = keyword defining condition\nCondition Type = return\n\n");}                                               
  | SIZEOF {printf(" is the symbol\nType = keyword defining condition\nCondition Type = sizeof\n\n");}                                               
                                                                                                                                                     
  | FOR {printf(" is the symbol\nType = Keyword for defining loop\nLoop Type = for\n\n");}                                                           
  | WHILE {printf(" is the symbol\nType = keyword for defining loop\nLoop Type = while\n\n");}                                                       
  | DO {printf(" is the symbol\nType = Keyword for defining loop\nLoop Type = do\n\n");}                                                             
  | SWITCH {printf(" is the symbol\nType = Keyword for defining loop\nLoop Type = Switch\n\n");}                                                     
                                                                                                                                                     
  | OPENBRACE {printf(" is the symbol\nType = Open Brace\nnBracket Type = {\n\n");}                                                                  
  | CLOSEBRACE {printf(" is the symbol\nType = Close Brace\nBracket Type = }\n\n");}                                                                 
  | OPENPARAN {printf(" is the symbol\nType = Open paranthesis\nBracket Type = (\n\n");}                                                             
  | CLOSEPARAN {printf(" is the symbol\nType = Close paranthesis\nBracket Type = )\n\n");}                                                           
  | OPENSQUARE {printf(" is the symbol\nType = open square bracket\nBracket Type = [\n\n");}                                                         
  | CLOSESQUARE {printf(" is the symbol\nType = Close square bracket\nBracket Type = ]\n\n");}                                                       
                                                                                                                                                     
  | SEMICOLON {printf(" is the symbol\nType = Semicolon\nValue = ;\n\n");}                                                                           
  | SINGLEQ {printf(" is the symbol\nType = Single quotation\nValue = '\n\n");}                                                                      
  | DOUBLEQ {printf(" is the symbol\nType = double quotation\nValue = \"\n\n");}                                                                     
                                                                                                                                                     
  | EQUAL {printf(" is the symbol\nType = Assignment operator\nOperator Value is =\n\n");}                                                           
                                                                                                                                                     
  | INCRE {printf(" is the symbol\nType = Increment operator\nValue = ++\n\n");}                                                                     
  | DECRE {printf(" is the symbol\nType = decrement operator\nValue = --\n\n");}                                                                     
                                                                                                                                                     
  | BOR {printf(" is the symbol\nType = bitwise operator\nValue = |\n\n");}                                                                          
  | BAND {printf(" is the symbol\nType = bitwise operator\nValue = &\n\n");}                                                                         
    | NOT {printf(" is the symbol\nType = bitwise operator\nValue = !\n\n");}                                                                        
  | XOR {printf(" is the symbol\nType = bitwise operator\nValue = ^\n\n");}                                                                          
  | TILDE {printf(" is the symbol\nType = bitwise operator\nValue = ~\n\n");}                                                                        
                                                                                                                                                     
| PLUS {printf(" is the symbol\nType = arithmetic operator\nValue = +\n\n");}                                                                        
  | MINUS {printf(" is the symbol\nType = arithmetic operator\nValue = -\n\n");}                                                                     
  | ASTERISK {printf(" is the symbol\nType = arithmetic operator\nValue = *\n\n");}                                                                  
  | SLASH {printf(" is the symbol\nType = arithmetic operator\nValue = /\n\n");}                                                                     
  | MODULUS {printf(" is the symbol\nType = arithmetic operator\nValue = %\n\n");}                                                                   
  | ADDAS {printf(" is the symbol\nType = arithmetic operator\nValue = +=\n\n");}                                                                    
  | SUBAS {printf(" is the symbol\nType = arithmetic operator\nValue = -=\n\n");}                                                                    
  | MULAS {printf(" is the symbol\nType = arithmetic operator\nValue = *=\n\n");}                                                                    
  | DIVAS {printf(" is the symbol\nType = arithmetic operator\nValue = /=\n\n");}                                                                    
  | MODAS {printf(" is the symbol\nType = arithmetic operator\nValue = %=\n\n");}                                                                    
  | LSAS {printf(" is the symbol\nType = arithmetic operator\nValue = <<=\n\n");}                                                                    
  | RSAS {printf(" is the symbol\nType = arithmetic operator\nValue = >>=\n\n");}                                                                    
  | ANDAS {printf(" is the symbol\nType = arithmetic operator\nValue = &=\n\n");}                                                                    
  | XORAS {printf(" is the symbol\nType = arithmetic operator\nValue = ^=\n\n");}                                                                    
  | ORAS {printf(" is the symbol\nType = arithmetic operator\nValue = |=\n\n");}                                                                     
                                                                                                                                                     
  | CONDOP {printf(" is the symbol\nType = conditional operator\nValue = ?:\n\n");}                                                                  
                                                                                                                                                     
  | LEFTS {printf(" is the symbol\nType = Relational operator\nValue = <<\n\n");}                                                                    
  | RIGHTS {printf(" is the symbol\nType = Relational operator\nValue = >>\n\n");}                                                                   
  | LT {printf(" is the symbol\nType = Relational operator\nValue = <\n\n");}                                                                        
  | GT {printf(" is the symbol\nType = Relational operator\nValue = >\n\n");}                                                                        
  | LE {printf(" is the symbol\nType = Relational operator\nValue = <=\n\n");}                                                                       
  | GE {printf(" is the symbol\nType = Relational operator\nValue = >=\n\n");}                                                                       
  | EQ {printf(" is the symbol\nType = Relational operator\nValue is ==\n\n");}                                                                      
  | NE {printf(" is the symbol\nType = Relational operator\nValue = !=\n\n");}                                                                       
                                                                                                                                                     
  | LAND {printf(" is the symbol\nType = logical operator\nValue = &&\n\n");}                                                                        
  | LOR {printf(" is the symbol\nType = logical operator\nValue = ||\n\n");}                                                                         
                                                                                                                                                     
  | DELIMITER {;}                                                                                                                                    
                                                                                                                                                     
;                                                                                                                                                    
                                                                                                                                                     
%%                                                                                                                                                   
                                                                                                                                                     
int yyerror()                                                                                                                                        
{}                                                                                                                                                   
                                                                                                                                                     
void main()                                                                                                                                          
{                                                                                                                                                    
        printf("Enter the statement: \n\n");                                                                                                         
        yyparse();                                                                                                                                   
}                                                                                                                                                    
                                                                                                                                                     
int yywrap()                                                                                                                                         
{}                                                                                                                                                   
                                                                                                                                                     
                                                                                                                                                     
[s2021103520@centos8-linux Tue Oct 31 12:08 AM week9]$ lex 2.l                                                                                       
[s2021103520@centos8-linux Tue Oct 31 12:08 AM week9]$ yacc -d 2.y                                                                                   
yacc: 80 shift/reduce conflicts.                                                                                                                     
[s2021103520@centos8-linux Tue Oct 31 12:09 AM week9]$ gcc lex.yy.c y.tab.c                                                                          
[s2021103520@centos8-linux Tue Oct 31 12:09 AM week9]$ ./a.out                                                                                       
Enter the statement:                                                                                                                                 
                                                                                                                                                     
int a=0;                                                                                                                                             
int is the Symbol                                                                                                                                    
Type = Keyword defining datatype                                                                                                                     
Datatype = int                                                                                                                                       
                                                                                                                                                     
a is the Symbol                                                                                                                                      
Type = Identifier                                                                                                                                    
Symbol table entry = 1                                                                                                                               
                                                                                                                                                     
= is the symbol                                                                                                                                      
Type = Assignment operator                                                                                                                           
Operator Value is =                                                                                                                                  
                                                                                                                                                     
0 is the Symbol                                                                                                                                      
Type = Unsigned numeric identifier                                                                                                                   
Symbol table entry = 2                                                                                                                               
                                                                                                                                                     
; is the symbol                                                                                                                                      
Type = Semicolon                                                                                                                                     
Value = ;                                