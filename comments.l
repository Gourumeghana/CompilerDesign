%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
\/\/(.*) {};
\/\*(.*\n)*.*\*\/ {};
%%
int yywrap(){return 1;}
int main()
{
yyin=fopen("input6.c","r");
yyout=fopen("out.c","w");
yylex();
return 0;
}