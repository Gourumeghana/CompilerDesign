%{
#include<stdio.h>
int length;
void fun(int);
%}
%%
[a-zA-Z0-9]+ {length=yyleng;fun(length);}
%%
void fun(int l)
{
 if(yytext[0]=='A')
 {
    if(length==3)
      printf("%s is starting with and length is 3\n",yytext);
    else
     printf("word is not of length 3\n");
}
else
{
printf("word not starting with A");
}
}
int main()
{
printf("Enter words");
yylex();
}
int yywrap()
{
}