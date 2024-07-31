#include<stdio.h>
#include<string.h>
#include<ctype.h>
int n,m=0,p,i=0,j=0;
char a[10][10],followResult[10];
void follow(char c);
void first(char c);
void addToResult(char c);
int main()
{
   int i,choice;
   char c,ch;
   printf("Enter the no.of productions: ");
   scanf("%d",&n);
   printf("Enter %d production as (A-B): ",n);
   for(i=0;i<n;i++)
   {
     scanf("%s",a[i]);
   } 
   do{
      m=0;
      followResult[0]='\0';
      printf("Find follow of: ");
      scanf(" %c", &c);
      follow(c);
      printf("Follow of (%c) = { ",c);
      for(i=0;i<m;i++)
      {
         printf("%c ",followResult[i]);
      }
      printf("} \n");
      printf("Enter 1 to continue : ");
      scanf("%d", &choice);
      
   }while(choice==1);
}

void follow(char c)
{
	int i,j;
   if(a[0][0]==c)  addToResult('$');
   for(i=0;i<n;i++)
   {
      for(j=2;j<strlen(a[i]);j++)
      {
        if(a[i][j]==c)
        {
          if(a[i][j+1]!='\0') first(a[i][j+1]);
          if(a[i][j+1]=='\0' && a[i][0]!=c) follow(a[i][0]);
        }
      }
   }
}

void first(char c)
{
  int k;
  if(!(isupper(c)))
     addToResult(c);
  for(k=0;k<n;k++)
  {
     if(a[k][0]==c)
     {
        if(a[k][2]=='$') follow(a[k][0]);
        else if(!(isupper(a[k][2])))  addToResult(a[k][2]);
        else first(a[k][2]);
     }
  }
}

void addToResult(char c)
{
  int i;
  for(i=0;i<m;i++)
  {
     if(followResult[i]==c)
        return;
  }
  followResult[m++]=c;
}

/*
E-TW
W-+TW
W-$
T-FY
Y-*FY
Y-$
F-(E)
F-i
*/
