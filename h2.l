
%{
	#include<stdio.h>
%}
%%
"hi" {printf("By");}
.* {printf("wrong");}
%%
int main()
{
     printf("Enter i/p:");
     yylex();/*takes input and divides the tokens*/
	
}
int yywrap()
{ return 1; }