%{                                                                                                                                                   
#include <stdio.h>                                                                                                                                   
#include <string.h>                                                                                                                                  
%}                                                                                                                                                   
                                                                                                                                                     
%option noyywrap                                                                                                                                     
                                                                                                                                                     
%%                                                                                                                                                   
"do"            { printf("while (1) {\n"); }                                                                                                         
"while"         { printf("if (!(1) {\n"); }                                                                                                          
"{"             { printf("{\n"); }                                                                                                                   
"}"             { printf("}\n"); }                                                                                                                   
.|\n            { printf("%s", yytext); } // Print other characters as is                                                                            
%%                                                                                                                                                   
                                                                                                                                                     
int main() {                                                                                                                                         
    FILE* inputFile = fopen("o2.txt", "r");                                                                                                          
    if (!inputFile) {                                                                                                                                
        fprintf(stderr, "Failed to open input.txt\n");                                                                                               
        return 1;                                                                                                                                    
    }                                                                                                                                                
                                                                                                                                                     
    yyin = inputFile;                                                                                                                                
    yylex();                                                                                                                                         
                                                                                                                                                     
    fclose(inputFile);                                                                                                                               
    return 0;                                                                                                                                        
}                                                                                                                                                    
                                                                                                                                                     
[s2021103520@centos8-linux Tue Oct 31 12:48 AM week6]$ cat o2.txt                                                                                    
int j = 0;                                                                                                                                           
do                                                                                                                                                   
{                                                                                                                                                    
j++;                                                                                                                                                 
}                                                                                                                                                    
while(j<=10);                                                                                                                                        
                                                                                                                                                     
[s2021103520@centos8-linux Tue Oct 31 12:48 AM week6]$    