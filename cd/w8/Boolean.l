%{                                                                                                                                                   
#include<stdio.h>                                                                                                                                    
#include<stdlib.h>                                                                                                                                   
#include<ctype.h>                                                                                                                                    
%}                                                                                                                                                   
%token NUM                                                                                                                                           
%%                                                                                                                                                   
start: expr '\n' {if($1) printf("True\n");                                                                                                           
else printf("False\n");                                                                                                                              
return 1; }                                                                                                                                          
| rexpr '\n'                                                                                                                                         
;                                                                                                                                                    
expr : rexpr'O''R'rexpr {$$=$1||$4;}                                                                                                                 
| rexpr'A''N''D'rexpr { $$=$1&&$5; }                                                                                                                 
| 'N''O''T'rexpr { $$=!$4;}                                                                                                                          
;                                                                                                                                                    
rexpr : rexpr'<'rexpr { $$=($1<$3);}                                                                                                                 
| rexpr'>'rexpr { $$=($1>$3);}                                                                                                                       
| '!'rexpr { $$=(!$2);}                                                                                                                              
| rexpr'=''='rexpr { $$= ($1==$4);}                                                                                                                  
|rexpr'!''='rexpr {$$= ($1!=$4);}                                                                                                                    
|'('rexpr')' {$$=$2;}                                                                                                                                
| NUM                                                                                                                                                
;                                                                                                                                                    
%%                                                                                                                                                   
yyerror(char const *s)                                                                                                                               
{                                                                                                                                                    
printf("yyerror");                                                                                                                                   
}                                                                                                                                                    
int yylex() {                                                                                                                                        
int c;                                                                                                                                               
c=getchar();                                                                                                                                         
if (isdigit(c)) {                                                                                                                                    
yylval=c-'0';                                                                                                                                        
return NUM;                                                                                                                                          
}                                                                                                                                                    
return c;                                                                                                                                            
}                                                                                                                                                    
int main(){                                                                                                                                          
while(1){                                                                                                                                            
yyparse();                                                                                                                                           
}                                                                                                                                                    
return 1;                                                                                                                                            
}                                                                                                                                                    
[s2021103520@centos8-linux Tue Oct 31 12:24 AM week8]$ yacc -d 2.y                                                                                   
yacc: 20 shift/reduce conflicts.                                                                                                                     
[s2021103520@centos8-linux Tue Oct 31 12:24 AM week8]$ gcc y.tab.c                                                                                   
2.y:26:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
 yyerror(char const *s)
 ^~~~~~~
[s2021103520@centos8-linux Tue Oct 31 12:24 AM week8]$ ./a.out                                                                                       
3==4OR3==3                                                                                                                                           
True