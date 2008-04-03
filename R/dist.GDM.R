dist.GDM<-function(x,method="GDM1")
{
	if(is.data.frame(x)) x<-as.matrix(x)
	if (method !="GDM1" && method !="GDM2" && method !="GDM3")
	{
		print("Bad GDM method")
		print("Choose 'GDM1' for metric data or 'GDM2' for ordinal data")
		stop()
	}
	weights<-array(1,c(ncol(x)))
	method_int<- switch(method,
			"GDM1"=1,
			"GDM2"=2,
			"GDM3"=3)

	nr=nrow(x)
	t<-.C("fngdm",as.double(x),as.integer(nrow(x)),as.integer(ncol(x)),
	as.integer(method_int),as.double(weights),wynik=double(nrow(x)*nrow(x)),PACKAGE="clusterSim")$wynik
	wynik<-matrix(nrow=nr,ncol=nr,dimnames=names(x))
	for (i in 1:nr)
	for (j in 1:nr)
	{
		wynik[i,j]=t[(i-1)*nr+j]
		wynik[j,i]=t[(j-1)*nr+i]
	}
	as.dist(wynik)
}
GDM<-function(x,method="GDM1"){dist.GDM(x,method=method)}
GDM1<-function(x){dist.GDM(x,"GDM1")}
GDM2<-function(x){dist.GDM(x,"GDM2")}