index.G1<-function(x,cl)
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
        allmean <- apply(x,2,mean)
        dmean <- sweep(x,2,allmean,"-")
        allmeandist <- sum(dmean^2)
        withins <- rep(0, k)
	   x <- (x - centers[cl,])^2
        for(i in 1:k){
           withins[i] <- sum(x[cl==i,])
	   }
        wgss <- sum(withins)
        bgss <- allmeandist - wgss
        (bgss/(k-1))/(wgss/(n-k))

}
