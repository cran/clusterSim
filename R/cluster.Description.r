cluster.Description <-function(x, cl,sdType="sample")
{
modalValue<-function(t)
{		
  paste(mfv(t),collapse=",")
}
	if (sdType!="sample" && sdType!="population")
		stop("sdType parameter should be one of two values: sample or population")
	if(is.null(dim(x))){
    dim(x)<-c(length(x),1)
	}
	m<-ncol(x)
	n<-length(cl)
	k<-max(cl)
	result<-array(0,c(k,m,5))
	for(i in 1:k)
	{
		for (j in 1:m)
		{
			result[i,j,1]=mean(x[cl==i,j])
			result[i,j,2]=sd(x[cl==i,j])
			if (sdType=="population")
			if (sum(cl==i)==1)
			{
				result[i,j,2]=0				
			}
			else
			{
				result[i,j,2]=sd(x[cl==i,j])*sqrt((sum(cl==i)-1)/sum(cl==i))
			}
			
			result[i,j,3]=median(x[cl==i,j])
			result[i,j,4]=mad(x[cl==i,j])
		}
		if (sum(cl==i)==1)
			result[i,,5]<-x[cl==i,]
		else
		{
			t<-x[cl==i,]
			if (m==1)
			{
				result[i,j,5]<-modalValue(t[j])				
			}
			else
			for (j in 1:m)
			{
				result[i,j,5]<-modalValue(t[,j])
			}
		}
	}
	result
}


