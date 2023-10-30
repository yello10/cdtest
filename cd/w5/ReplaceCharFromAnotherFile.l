%option noyywrap                                                                                                                                     
%{                                                                                                                                                   
     #include<stdio.h>                                                                                                                               
     #include<string.h>                                                                                                                              
     char replace_with [] = "Best";                                                                                                                  
     char replace [] ="A";                                                                                                                           
%}                                                                                                                                                   
                                                                                                                                                     
%%                                                                                                                                                   
[a-zA-Z]+    { if(strcmp(yytext, replace)==0)                                                                                                        
                   fprintf(yyout, "%s", replace_with);                                                                                               
                else                                                                                                                                 
                    fprintf(yyout, "%s", yytext);}                                                                                                   
.            fprintf(yyout, "%s", yytext);                                                                                                           
%%                                                                                                                                                   
                                                                                                                                                     
int main()                                                                                                                                           
{                                                                                                                                                    
     extern FILE *yyin, *yyout;                                                                                                                      
     yyin=fopen("in.txt", "r");                                                                                                                      
     yyout=fopen("out.txt", "w");                                                                                                                    
     yylex();                                                                                                                                        
     return 0;                                                                                                                                       
}                                                                                                                                                    
                                                                                                                                                     
                                                                                                                                                     
[s2021103520@centos8-linux Tue Oct 31 12:56 AM week5]$ cat in.txt                                                                                    
Best A in THE WORLD                                                                                                                                  
[s2021103520@centos8-linux Tue Oct 31 12:56 AM week5]$ cat out.txt                                                                                   
Best Best in THE WORLD                                                                                                                               
[s2021103520@centos8-linux Tue Oct 31 12:56 AM week5]$                  