/* LEX Program to couunt the number of integers and floating point numbers appering in the input */
%{
#include<stdio.h>
int numcnt=0,fltcnt=0;
%}
%%
[0-9]+"."[0-9]+ {ECHO;printf(" Decimal Number\n"); fltcnt++;}
[0-9]+ {ECHO;printf(" Integer Number\n"); numcnt++;}
">" return 0;
%%
int yywrap(){return 0;}
int main()
{
printf("Enter numbers:");
yylex();
printf("Number of Decimal Numbers:%d\n number of Integer Numbers :%d",numcnt,fltcnt);
return 0;
}
