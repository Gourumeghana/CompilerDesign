#include<stdio.h>
#include<ctype.h>
void FIRST(char[],char);
void addToResultSet(char[],char);
int n;
char productionSet[10][10];
int main()
{
	int i;
	char choice,c;
	char result[20];
	printf("Enter no.of productions:");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		
		//printf("Enter production number %d: ",i+1);
		scanf("%s",productionSet[i]);
	}
	do{
		printf("\n Find the FIRST of:");
		scanf(" %c",&c);
		FIRST(result,c);
		printf("\n FIRST(%c)={",c);
		for(i=0;result[i]!='\0';i++)
		   printf("%c ",result[i]);
		printf("}\n");
			printf("Press 'y' to continue:");
			scanf(" %c",&choice);
		}
		while(choice=='y'||choice=='Y');

}
void FIRST(char *Result,char c)
{
	int i,j,k;
	char SubResult[20];
	int epsilon;
	SubResult[0]='\0';
	Result[0]='\0';
	if(!(isupper(c)))
	{
		addToResultSet(Result,c);
		return;
	}
	for(i=0;i<n;i++)
	{
		if(productionSet[i][0]==c)
		{
			if(productionSet[i][2]=='$')
			  addToResultSet(Result,'$');
			else
			{
				j=2;
				while(productionSet[i][j]!='\0')
				{
					epsilon=0;
					FIRST(SubResult,productionSet[i][j]);
					for(k=0;SubResult[k]!='\0';k++)
					  addToResultSet(Result,SubResult[k]);
					for(k=0;SubResult[k]!='\0';k++)
					{
						if(SubResult[k]=='$')
						{
							epsilon=1;
							break;
						}
					}
					if(!epsilon)
						  break;
					j++;
				}
			}
		}
	}
	return;
}
void addToResultSet(char Result[],char val)
{
	int k;
	for(k=0;Result[k]!='\0';k++)
	{
		if(Result[k]==val)
		 return;
    }
	   Result[k]=val;
	   Result[k+1]='\0';
}

