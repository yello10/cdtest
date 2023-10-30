%option noyywrap                                                                                                                                     
%{                                                                                                                                                   
#include <stdio.h>                                                                                                                                   
int error_count = 0;                                                                                                                                 
%}                                                                                                                                                   
                                                                                                                                                     
%%                                                                                                                                                   
                                                                                                                                                     
                                                                                                                                                     
int|char|float|double|void    { printf("Data type: %s\n", yytext); }                                                                                 
if|else|while|for            { printf("Control keyword: %s\n", yytext); }                                                                            
[0-9]+                       { printf("Integer constant: %s\n", yytext); }                                                                           
\"[^\"\n]*\"                 { printf("String constant: %s\n", yytext); }                                                                            
\/\/.*                       { printf("Comment: %s\n", yytext); }                                                                                    
\/\*[^*]*\*+([^/*][^*]*\*+)*\/ { printf("Comment: %s\n", yytext); }                                                                                  
[(){};,]                    { printf("Special character: %s\n", yytext); }                                                                           
[+-/*<>=]                     {printf("operator: %s\n",yytext);}                                                                                     
[_a-zA-Z][_a-zA-Z0-9]*      { printf("Identifier: %s\n", yytext);}                                                                                   
[ \t\n]                          {}                                                                                                                  
.                            { printf("Unknown token: %s\n", yytext); error_count++; }                                                               
                                                                                                                                                     
%%                                                                                                                                                   
                                                                                                                                                     
int main()                                                                                                                                           
{                                                                                                                                                    
    yyin = fopen("1.c", "r");                                                                                                                        
    if (yyin == NULL) {                                                                                                                              
        perror("Error opening file");                                                                                                                
        return 1;                                                                                                                                    
    }                                                                                                                                                
    yylex();                                                                                                                                         
    if (error_count == 0) {                                                                                                                          
        printf("No errors found.\n");                                                                                                                
    } else {                                                                                                                                         
        printf("%d error(s) found.\n", error_count);                                                                                                 
    }                                                                                                                                                
    fclose(yyin);                                                                                                                                    
    return 0;                                                                                                                                        
}                                                                                                                                                    
                                                                                                                                                     
[s2021103520@centos8-linux Tue Oct 31 12:29 AM week7]$ lex 1.l                                                                                       
[s2021103520@centos8-linux Tue Oct 31 12:30 AM week7]$ gcc lex.yy.c                                                                                  
[s2021103520@centos8-linux Tue Oct 31 12:30 AM week7]$ ./a.out                                                                                       
Unknown token: #                                                                                                                                     
Identifier: include                                                                                                                                  
operator: <                                                                                                                                          
Identifier: stdio                                                                                                                                    
operator: .                                                                                                                                          
Identifier: h                                                                                                                                        
operator: >                                                                                                                                          
Data type: int                                                                                                                                       
Identifier: main                                                                                                                                     
Special character: (                                                                                                                                 
Special character: )                                                                                                                                 
Special character: {                                                                                                                                 
Identifier: printf                                                                                                                                   
Special character: (                                                                                                                                 
Unknown token: "                                                                                                                                     
Identifier: hello                                                                                                                                    
Identifier: printf                                                                                                                                   
Special character: (                                                                                                                                 
String constant: "hi"                                                                                                                                
Special character: )                                                                                                                                 
Special character: ;                                                                                                                                 
Identifier: return                                                                                                                                   
Integer constant: 0                                                                                                                                  
Special character: ;                                                                                                                                 
2 error(s) found.                                                                                                                                    
[s2021103520@centos8-linux Tue Oct 31 12:30 AM week7]$ cat 1.c                                                                                       
#include<stdio.h>                                                                                                                                    
int main(){                                                                                                                                          
        printf("hello                                                                                                                                
        printf("hi");                                                                                                                                
        return 0;                                                                                                                                    
                                                 