index.KL<-function(x,clall)
{
wgss<-function(x,cl)
{
        n <- length(cl)
        k <- max(cl)

	centers<-matrix(nrow=k,ncol=ncol(x))
	for(i in 1:k)
	{
		for(j in 1:ncol(x))
		{
		   centers[i,j]<-mean(x[cl==i,j])
		}
	}
        withins <- rep(0, k)
	   x <- (x - centers[cl,])^2
        for(i in 1:k){
           withins[i] <- sum(x[cl==i,])
	   }
        sum(withins)
}

  if(is.null(dim(x))){
    dim(x)<-c(length(x),1)
  }
	m<-ncol(x)   	   	
	g<-k <- max(clall[,2])
	abs((g-1)^(2/m)*wgss(x,clall[,1])-g^(2/m)*wgss(x,clall[,2]))/abs((g)^(2/m)*wgss(x,clall[,2])-(g+1)^(2/m)*wgss(x,clall[,3]))
}