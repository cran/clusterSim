index.H<-function(x,clall)
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
 	   	
        n <- nrow(x)
        g <- max(clall[,1])
        (wgss(x,clall[,1])/wgss(x,clall[,2])-1)*(n-g+1)
}
