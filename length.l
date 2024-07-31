/* LEX Program to list out all words of length three,starting with "A".*/
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
   if(yytext[0]=='A'){
    if(length==3)
    {
      printf("%s is word with length 3\n",yytext);
    }
    else
    {
      printf("Word is not of length 3\n");
    }
}
else
{
 printf("Word is not starting with A\n");
}
}
int yywrap(){}
int main()
{
printf("Enter words:");
yylex();
return 0;
}

  
