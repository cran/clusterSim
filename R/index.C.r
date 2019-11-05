index.C<-function(d,cl)
{
  ddist<-d
	d<-data.matrix(d)
	DU<-0
	r<-0
	for (i in 1:max(cl))
	{
	  t<-d[cl==i,cl==i]		
		n<-sum(cl==i)
		if (n>1)
		{
			DU=DU+sum(t)/2
		}
		r<-r+n*(n-1)/2
	}
	Dmin=sum(sort(ddist)[1:r])
	Dmax=sum(sort(ddist,decreasing = T)[1:r])
	if(Dmin==Dmax)
		result<-NA
	else
		result<-(DU-Dmin)/(Dmax-Dmin)
	result		
}