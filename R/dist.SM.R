dist.SM<-function(x)
{

	if(is.data.frame(x)) x<-as.matrix(x)
	nr=nrow(x)
	t<-.C("fng3",as.double(x),as.integer(nrow(x)),as.integer(ncol(x)),wynik=double(nrow(x)*nrow(x)),PACKAGE="clusterSim")$wynik
	wynik<-matrix(nrow=nr,ncol=nr,dimnames=x$names)
	for (i in 1:nr)
	for (j in 1:nr)
	{
		wynik[i,j]=t[(i-1)*nr+j]
		wynik[j,i]=t[(j-1)*nr+i]
	}
	as.dist(wynik)
}


