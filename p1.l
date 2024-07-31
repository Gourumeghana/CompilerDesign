%{
int lc=0,tc=0,sc=0,ch=0,c=0,wc=0;
%}
%%
\n {lc++;}
& {return 0;}
\t {tc++;}
([ ])+ {sc++;}
. {ch++;c++;}
[a-zA-Z0-9]+ {wc++;c=c+yyleng;}
%%
int yywrap(){}
int main()
{
 printf("Enter text:");
 yylex();
 printf("lines=%d\n",lc);
printf("spaces=%d\n",sc);
printf("tabs=%d\n",tc);
printf("characters=%d\n",c);
printf("words=%d\n",(wc+ch));

return 0;
}