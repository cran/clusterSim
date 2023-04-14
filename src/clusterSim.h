#include <R_ext/Rdynload.h>
#define typ_metryczny 1
#define typ_porzadkowy 2
#define typ_nominalny 3
#define typ_mieszany 4

#ifdef WIN32
#define GDM_API __declspec(dllexport)


double GDM_a (int i, int p, int j, double * x, int type, int kolumny);
extern "C" void GDM_API  fngdm(double * x , int * rows, int * cols, int * type, double * weights, double * wynik );
extern "C" void GDM_API  fngdm_single_column(double * x , int * rows, int * cols, int * type, double * weights, double * wynik );
extern "C" void GDM_API  fng2(double * within , int * nwithin, double * between , int * nbetween, double *wynik);
extern "C" void GDM_API  fng3(double * x , int * rows, int * cols, double * wynik );
extern "C" void GDM_API  R_init_clusterSim(DllInfo *info);
#else
double GDM_a (int i, int p, int j, double * x, int type, int kolumny);
extern "C" void  fngdm(double * x , int * rows, int * cols, int * type, double * weights, double * wynik );
extern "C" void  fngdm_single_column(double * x , int * rows, int * cols, int * type, double * weights, double * wynik );
extern "C" void fng2(double * within , int * nwithin, double * between , int * nbetween, double *wynik);
extern "C" void fng3(double * x , int * rows, int * cols, double * wynik );
extern "C" void R_init_clusterSim(DllInfo *info);
#endif
