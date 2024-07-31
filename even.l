%{
#include<stdio.h>
int m;
char *yytext;
%}
%%
[0-9]+ {m=atoi(yytext);
if(m%2==0)
printf("Even");
else
printf("odd");}
.* {printf("wrong");}
%%
int yywrap()
{
}
int main()
{
printf("Enter input:");
yylex();
return 0;
}