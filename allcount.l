%{
#include<stdio.h>
int lc=0,sc=0,c=0,ch=0,wc=0,tc=0;
%}
%%
\n {lc++;}
& {return 0;}
([ ])+ {sc++;}
\t {tc++;}
. {ch++; c++;}
[a-zA-Z0-9]+ {wc++; c=c+yyleng;}
%%
int yywrap(){}
int main()
{
 printf("Enter input:");
 yylex();
 printf("lines count:%d\n",lc);
 printf("character count:%d\n",c);
 printf("space count:%d\n",sc);
 printf("tabs count:%d\n",tc);
 printf("words count:%d\n",(wc+ch));
 return 0;
}