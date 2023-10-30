%option noyywrap                                                                                                                                     
%{                                                                                                                                                   
#include <stdio.h>                                                                                                                                   
%}                                                                                                                                                   
%%                                                                                                                                                   
"//".*      /* Match single-line comments and ignore them */                                                                                         
"/*".*"*/"$ /* Match multi-line comments and ignore them */                                                                                          
.       {printf("%s",yytext);}    /* Match any other character */                                                                                    
%%                                                                                                                                                   

int main() {                                                                                                                                         
FILE *fp=fopen("3.c","r");                                                                                                                           
if(fp)                                                                                                                                               
        yyin=fp;                                                                                                                                     
yylex();                                                                                                                                             
    return 0;                                                                                                                                        
}                                                                                                                                                    
[s2021103520@centos8-linux Tue Oct 31 12:33 AM week7]$ cat 3.c                                                                                       
#include<stdio.h> //including the header file                                                                                                        
int main(){                                                                                                                                          
        printf("hello world"); /*prints hello world*/                                                                                                
}                                                                                                                                                    
[s2021103520@centos8-linux Tue Oct 31 12:33 AM week7]$ lex 3.l                                                                                       
[s2021103520@centos8-linux Tue Oct 31 12:33 AM week7]$ gcc lex.yy.c                                                                                  
[s2021103520@centos8-linux Tue Oct 31 12:33 AM week7]$ ./a.out                                                                                       
#include<stdio.h>                                                                                                                                    
int main(){                                                                                                                                          
        printf("hello world");                                                                                                                       
}                                                                                                                                                    
[s2021103520@centos8-linux Tue Oct 31 12:33 AM week7]$             