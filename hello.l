%option noyywrap
%{
	#include<stdio.h>
%}
%%{
"hi" {printf("By");}
.* {printf("wrong");}
%%}
int main()
{
     printf("Enter i/p:");
     yylex();/*takes input divide the tokens*/
	
}
int yywrap()
{return 1;}