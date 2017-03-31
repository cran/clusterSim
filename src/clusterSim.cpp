#include "clusterSim.h"
#include "math.h"
#include "stdio.h"
#include <R.h> 
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
/*#include "windows.h"
#include "string.h";
#include "time.h";*/

/*void printTab (double * x,int r,int c,int rToPrint){
		printf("\n*************************** ZACZYNAM DRUKOWAC TABELE **************************\n");
		for(int i=0;i<rToPrint;i++){
		for(int j=0;j<c;j++){
			printf(" %3.5e ",x[r*j+i]);
		}
		printf("\n");
	}

}*/
/*
void printTab (double * x,int r,int c){
	printTab (x,r,c,r);
}*/

void R_init_clutserSim(DllInfo* info) {
	R_registerRoutines(info, NULL, NULL, NULL, NULL);
	R_useDynamicSymbols(info, TRUE);
}

#ifdef WIN32
extern "C" void GDM_API  fngdm(double  * x,int *  rows, int * cols, int * type, double * weights, double * wynik)
#else
extern "C" void  fngdm(double  * x,int *  rows, int * cols, int * type, double * weights, double * wynik)
#endif
{
int i,j,k,l;
double l1,m1,m2,a,b;
double *mianownik;

int wiersze,kolumny,typ;

	wiersze=*rows;
	kolumny=*cols;
	typ=*type;
	mianownik=new double[(*rows)+1];

	if (typ==typ_nominalny)
	{    
		for(i=1;i<=wiersze;i++)
		for(k=1;k<=i;k++)
		{
			wynik[wiersze*(i-1)+k-1]=0;
			for(j=1;j<=kolumny;j++)
				if (x[(wiersze)*(j-1)+i-1]!=x[(wiersze)*(j-1)+k-1])
					wynik[wiersze*(i-1)+k-1]+=1.0/kolumny;
			//wynik[wiersze*(i-1)+k-1]/=;
			wynik[wiersze*(k-1)+i-1]=wynik[wiersze*(i-1)+k-1];
		}
	}
	else
		{

		for(i=1;i<=wiersze;i++)
		{
			mianownik[i]=0;
			for(j=1;j<=kolumny;j++)
			for(l=1;l<=wiersze;l++)
			{
				a=GDM_a(i,l,j,x,typ,wiersze);
				mianownik[i]+=weights[j-1]*a*a;
			}
		}
		for(i=1;i<wiersze;i++)
		{
			/*m1=0;
			for(j=1;j<=kolumny;j++) 
			for(l=1;l<=wiersze;l++)
			{
				a=GDM_a(i,l,j,x,typ,wiersze);
				m1+=weights[j-1]*a*a;
			}
			m2=0;
			for(j=1;j<=kolumny;j++) 
			for(k=1;k<=wiersze;k++)
			{
				b=GDM_a(i,k,j,x,typ,wiersze);
				m2+=weights[j-1]*b*b;
			}           */
			for(k=i+1;k<=wiersze;k++)
			{
				l1=0;
				for(j=1;j<=kolumny;j++) 
				{
					l1+=weights[j-1]*GDM_a(i,k,j,x,typ,wiersze)*GDM_a(k,i,j,x,typ,wiersze);
				}
				for(j=1;j<=kolumny;j++) 
				for(l=1;l<=wiersze;l++)
					if (l!=i && l!=k)
						l1+=weights[j-1]*GDM_a(i,l,j,x,typ,wiersze)*GDM_a(k,l,j,x,typ,wiersze);
				m1=mianownik[i];
				m2=mianownik[k];
				wynik[wiersze*(i-1)+k-1]=.5-(l1/(2*sqrt(m1*m2)));
				wynik[wiersze*(k-1)+i-1]=wynik[wiersze*(i-1)+k-1];
	#ifdef wyniki_do_pliku
				fprintf(plik_wynik,"\n i: %i , k: %i , l1: %g , \nm1:%g ,  m2:%g ,  m:%g",i,k,l1,m1,m2,2*sqrt(m1*m2));
				fprintf(plik_wynik,"\n%d,%d,   Wynik: %g",i,k,wynik[wiersze*(i-1)+k-1]);
				fprintf(plik_wynik,"\n-----------------------------------------------------------------------");
	#endif
			}	
		}
	}
	//printTab(wynik,*rows,4,4);
	return;
}

double GDM_a (int i, int p, int j, double  * x , int type,int wiersze )
{
double result;
double xi,xp;
	xi=x[wiersze*(j-1)+i-1];
	xp=x[wiersze*(j-1)+p-1];
	if(type==typ_metryczny)
	{
		result=xi-xp;
	}
	if(type==typ_porzadkowy)
	{
		if (xi>xp)
			result= 1;
		else 
		{
			if(xi==xp)
				result = 0;		
			else
				result = -1;
		}
	}
	if(type==typ_nominalny)
	{
		if (xi==xp)
			result=1;
		else
			result=-1;		
	}
	return result;
}	

#ifdef WIN32
extern "C" void GDM_API  fng2(double * within , int * nwithin, double * between , int * nbetween, double * wynik )
#else
extern "C" void   fng2(double * within , int * nwithin, double * between , int * nbetween, double * wynik )
#endif
{
	int i,j,s,rowne;
	s=0;
	rowne=0;
	for(i=0;i<*nwithin;i++)
		for(j=0;j<*nbetween;j++)
		{
			if (within[i]<between[j]) s++;
			if (within[i]==between[j]) rowne++;
			#ifdef wyniki_do_pliku
			fprintf(plik_wynik,"%i , %i : %g, %g \n",i,j,within[i],between[j]);
			#endif

		}
	if ((*nwithin)*(*nbetween)==rowne)
		wynik[0]=0;
	else
		wynik[0]=(2.0*s)/((double)(*nwithin)*(*nbetween)-rowne)-1.0;
	return;
}


#ifdef WIN32
extern "C" void GDM_API  fng3(double  * x,int *  rows, int * cols, double * wynik)
#else
extern "C" void   fng3(double  * x,int *  rows, int * cols, double * wynik)
#endif
{
int i,j,k,wiersze,kolumny;
double mr;
	wiersze=*rows;
	kolumny=*cols;
	for (i=1;i<=wiersze;i++)
	for (j=1;j<=wiersze;j++)
	{
		mr=0;
		if (i!=j)
		for (k=1;k<=kolumny;k++)
		{
			if (x[wiersze*(k-1)+i-1]==x[wiersze*(k-1)+j-1])
			//if(x[i,k]==x[j,k])
				mr++;
		}
		
		wynik[wiersze*(i-1)+j-1]=(kolumny-mr)/kolumny;
			
	}
	return;
}

