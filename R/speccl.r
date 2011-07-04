.GDMKernel <-function (gdm,sigma = 1) 
{
  resul<-exp(as.matrix(-sigma*gdm))  
  for(i in 1:ncol(gdm)){
    resul[i,i]<-0
  }
  resul
}



.GausKernel<-function(d,sigma=1){
  resul<-exp(as.matrix(-sigma*d))  
  for(i in 1:ncol(resul)){
    resul[i,i]<-0
  }
  resul
}


speccl<-function(data, nc, distance="GDM1", sigma="automatic", mod.sample=0.75, R=10, iterations=3, na.action=na.omit,...)
{
  if(sigma=='automatic'){
    sigmaSimulation<-TRUE
  }
  else{
    sigmaSimulation<-FALSE
    sigma<-as.numeric(sigma)
  }
  DEBUG<-FALSE
  x<-data
  bootstrap<-x[sample(1:nrow(x),nrow(x)*mod.sample),]
  sigWithinss<--1
  levelsPower<-R;
  if(distance=="GDM1" || distance=="GDM2"){
    levels<-iterations
    lstart<-5
    lend<-sum(dist.GDM(x,method=distance))
  }
  else{
    levels<-iterations
    lstart<-0
    lend<-100
  }
  lby<-lend/levelsPower
  
  if(sigmaSimulation){
    for(ll in levels:1){
      lby<-lby/levelsPower
      sigmas<-(seq(lstart,lend-lby,by=lby)+seq(lstart+lby,lend,by=lby))/2
      i<-0
      for (sigma in sigmas){
        oldsigma<-sigma
        if(distance=="GDM1" || distance=="GDM2"){
          ka<-.GDMKernel(as.matrix(dist.GDM(bootstrap,method=distance)),sigma)
        }
        else if(distance=="BC"){
          ka<-.GausKernel(as.matrix(dist.BC(bootstrap)),sigma)
        }
        else if(distance=="SM"){
          ka<-.GausKernel(as.matrix(dist.SM(bootstrap)),sigma)
        }
        else if(distance=="sEuclidean"){
          ka<-.GausKernel(as.matrix(dist(bootstrap))^2,sigma)
        }
        else{
          dd<-try(dist(bootstrap,method=distance),silent=TRUE)
          if(class(dd)=="try-error"){
            dd<-try(dist.binary(bootstrap,method=distance),silent=TRUE)
          }
          if(class(dd)=="try-error"){
            stop(paste("unknown distance method ",distance))
          }
          ka<-.GausKernel(as.matrix(dd),sigma)
        }
        d<-1/sqrt(rowSums(ka))
        l<-d * ka %*% diag(d)
        ei<-NULL
        tf<-function(l,nc){eigen(l,symmetric=TRUE)$vectors[,1:nc]}
        ei<-try(tf(l,nc),silent=TRUE)
        if(class(tf)!="try-error"){
          if(!is.null(ei)  && is.numeric(ei)){
            yi<-try(ei/sqrt(rowSums(ei^2)),silent=TRUE)
            if(sum(is.na(yi))==0){
            res<-try(kmeans(yi, yi[initial.Centers(yi,nc),],...),silent=TRUE)
            if(class(res)=="try-error"){
              res<-list(withinss=1e10)
              next
            }
            if(sum(res$withinss)<sigWithinss || sigWithinss==-1){
              sig<-sigma
              sigWithinss<-sum(res$withinss)
            }
          }
          i<-i+1
          }
          else{
            na.action(ei)
          }
        }
      }
      if(oldsigma==sigma){
        ll<-0
      }
      lstart<-sig-0.5*lby
      lend<-sig+0.5*lby
    }
  }
  else{
    sig<-as.numeric(sigma)
  }
  
  if(distance=="GDM1" || distance=="GDM2"){
    km<-.GDMKernel(as.matrix(dist.GDM(x,method=distance)),sig)
  }
  else if(distance=="BC"){
    km<-.GausKernel(as.matrix(dist.BC(x)),sig)
  }
  else if(distance=="SM"){
    km<-.GausKernel(as.matrix(dist.SM(x)),sig)
  }
  else if(distance=="sEuclidean"){
    km<-.GausKernel(as.matrix(dist(x))^2,sig)
  }
  else{
        dd<-try(dist(x,method=distance),silent=TRUE)
        if(class(dd)=="try-error"){
          dd<-try(dist.binary(x,method=distance),silent=TRUE)
        }
        if(class(dd)=="try-error"){
          stop(paste("unknown distance method ",distance))
        }
        km<-.GausKernel(as.matrix(dd),sig)
  }
  
  diag(km)<-0
  d<-1/sqrt(rowSums(km))
  l<-d * km %*% diag(d)
  ei<-try(eigen(l)$vectors[, 1:nc],silent=TRUE)
  if(class(ei)=="try-error"){
    stop(paste("Not possible to calculate eigenvalues, try with other distance type - ",distance))
  }
  yi<-ei/sqrt(rowSums(ei^2))
  res<-try(kmeans(yi, yi[initial.Centers(yi, nc),], ...))
  if(class(res)=="try-error"){
    stop(paste("Not possible to do clustering, try with other distance type - ",distance))
  }
  return(list(clusters = res$cluster, size = res$size,withins=res$withins,sigma=sig,Ematrix=ei,Ymatrix=yi))
}

#data(data_binary)
#print(speccl(data_binary,nc=3,distance=1,sigma="automatic",mod.sample=0.75,R=10,iterations=3))