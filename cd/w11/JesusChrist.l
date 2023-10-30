[s2021103520@centos8-linux Mon Oct 30 11:44 PM week11]$ cat spot.l                                                                                   
{                                                                                                                                                    

#include<stdio.h>                                                                                                                                    

#include<stdlib.h>                                                                                                                                   

#include "y.tab.h"                                                                                                                                   

extern int yyval;                                                                                                                                    

%}                                                                                                                                                   



%%                                                                                                                                                   

"int" return INT;                                                                                                                                    

"float" return FLOAT;                                                                                                                                

"char" return CHAR;                                                                                                                                  

[A-Za-z]+ {yyval=atoi(yytext);return VAR;}                                                                                                           
"(())" { return PAR;}                                                                                                                                
"({})" { retrun CURLY;}                                                                                                                              

"\n" return NL;                                                                                                                                      

. return(yytext[0]);                                                                                                                                 



%%                                                                                                                                                   
[s2021103520@centos8-linux Mon Oct 30 11:44 PM week11]$ cat spot.y                                                                                   
%{                                                                                                                                                   
#include<stdio.h>                                                                                                                                    
#include<stdlib.h>                                                                                                                                   
int yylex();                                                                                                                                         
int yyerror();                                                                                                                                       
%}                                                                                                                                                   
%token INT CHAR FLOAT VAR PAR CUR                                                                                                                    
%%                                                                                                                                                   
EXP: INT '_' VAR {printf("valid");}                                                                                                                  
   | CHAR '_' VAR {printf("valid");}                                                                                                                 
   | FLOAT '_' VAR {printf("valid");}                                                                                                                
   | INT '*''_' VAR { printf("valid"):}                                                                                                              
   | FLOAT '*''_' VAR { printf("valid"):}                                                                                                            
   | CHAR '*''_' VAR { printf("valid"):}                                                                                                             
   ;                                                                                                                                                 
FACTOR:                                                                                                                                              
      |'(' EXP ')'                                                                                                                                   
      ;                                                                                                                                              
%%                                                                                                                                                   
int main(){                                                                                                                                          
yyin =fopen("spot.txt","r");                                                                                                                         
yyparse();                                                                                                                                           
return 0;                                                                                                                                            
}                                                                                                                                                    
[s2021103520@centos8-linux Mon Oct 30 11:44 PM week11]$ cat spot.txt                                                                                 
                                                                                                                                                     
int main(){                                                                                                                                          
float a;                                                                                                                                             
int b;                                                                                                                                               
char c:                                                                                                                                              
 printf("hi");                                                                                                                                       
}                                                             