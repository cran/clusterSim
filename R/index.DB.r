index.DB<-function(x,cl,centrotypes="centroids",p=2,q=2){
   if(is.null(dim(x))){
          dim(x)<-c(length(x),1)
        }
  x<-as.matrix(x)
  n <- length(cl)
  k <- max(cl)
  dAm<-as.matrix(dist(x,p=p))
  centers<-matrix(nrow=k,ncol=ncol(x))
  if (centrotypes=="centroids"){
    for(i in 1:k)
    {
      for(j in 1:ncol(x))
      {
         centers[i,j]<-mean(x[cl==i,j])
      }
    }
  }
  else if (centrotypes=="medoids"){
    for (i in 1:k){
      clAi<-dAm[cl==i,cl==i]
      if (is.null(clAi)){
        centers[i,]<-NULL
      }
      else{
        minj<-0
        minsumdist<-sum(dAm)
        if (is.null(dim(clAi)))
        {
           dim(clAi)<-c(1,1)
        }
        for(j in 1:nrow(clAi))
        {
           if (sum(clAi[j,])<minsumdist)      
           {
              minj<-row.names(clAi)[j]
              if(is.null(minj)){
                minj<-i
              }
            else{
              if (minj==0)
                minj<-i
            }
            minsumdist<-sum(clAi[j,])
           }
        }
        centers[i,]<-x[minj,]
      }
    }   
  }
  else{
    stop("wrong centrotypes argument")
  }
  S<-rep(0,k)
  for(i in 1:k){                             # For every cluster
    ind <- (cl==i)
    if (sum(ind)>1){
      centerI<-centers[i,]
      centerI<-rep(centerI,sum(ind))
      centerI<-matrix(centerI,nrow=sum(ind),ncol=ncol(x),byrow=TRUE)
      S[i] <- mean(sqrt(apply((x[ind,] - centerI)^2,1,sum))^q)^(1/q)
    }
    else
      S[i] <- 0                         
  }
  M<-as.matrix(dist(centers,p=p))
  R <- array(Inf,c(k,k))
  r = rep(0,k)
  for (i in 1:k){
    for (j in 1:k){
        R[i,j] = (S[i] + S[j])/M[i,j]
    }
    r[i] = max(R[i,][is.finite(R[i,])])
  } 
  DB = mean(r[is.finite(r)])        
  resul<-list(DB=DB,r=r,R=R,d=M,S=S,centers=centers)
  resul
}
