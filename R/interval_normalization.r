.SO2Simple<-function (sd) 
{
indices<-as.numeric(as.vector(sd$variables[sd$variables[,4]=="IC",1]))
sd$indivIC[,indices,]
}

.simple2SO<-function(x)
{
individualsNo<-dim(x)[1]
indivA<-array("",c(individualsNo,3))
for(i in 1:individualsNo)
{
	indivA[i,1]<-i
	indivA[i,2]<-paste("indiv",i,sep="_")
	indivA[i,3]<-i
}
indiv<-as.data.frame(indivA)
names(indiv)<-c("num","name","label")

variablesNo<-dim(x)[2]
variablesICNo<-dim(x)[2]
	detailsICA<-array("",c(variablesICNo,4))
variablesA<-array("",c(variablesNo,5))
detailsICNo<-0
for(i in 1:variablesNo)
{

	variablesA[i,1]<-i
	variablesA[i,2]<-paste("var",i,sep="_")
	variablesA[i,3]<-paste("var",i,sep="_")
		variablesA[i,4]<-"IC"
		detailsICNo<-detailsICNo+1
		detailsICA[detailsICNo,1]<-0
		detailsICA[detailsICNo,2]<-0
		detailsICA[detailsICNo,3]<-min(x[,i,1])
		detailsICA[detailsICNo,4]<-max(x[,i,2])
		variablesA[i,5]<-detailsICNo
}
variables<-as.data.frame(variablesA)
names(variables)<-c("num","name","label","type","details")
detailsIC<-as.data.frame(detailsICA)
names(detailsIC)<-c("na","nu","min","max")
indivICA<-array(0,c(individualsNo,variablesNo,2))
for(i in 1:individualsNo)
{
	for(j in 1:variablesNo)
	{
      indivICA[i,j,1]<-x[i,j,1]
      indivICA[i,j,2]<-x[i,j,2]
	}
}
resul<-list(individuals=indiv,variables=variables,detailsIC=detailsIC,detailsN=NULL,detailsListNom=NULL,detailsNM=NULL,detailsListNomModif=NULL,indivIC=indivICA,indivN=NULL,indivListNom=NULL,indivNM=NULL,indivListNomModif=NULL)

class(resul)<-"symbolic"
resul

}


interval_normalization<-function(x,dataType="simple",type="n0",y=NULL){
  if(dataType=="sda"){
    x<-.SO2Simple(x)
  }
  if(dataType=="separate_tables"){
    xy<-array(0,c(nrow(x),ncol(x),2))
    for(i in 1:nrow(x)){
      for(j in 1:ncol(x)){
        xy[i,j, 1] <- x[i,j]
        xy[i,j , 2] <- y[i,j]
      }
    }
    x<-xy
  }
  if(dataType=="rows"){
    xy<-array(0,c(nrow(x)/2,ncol(x),2))
    xy[,,1]<-x[seq(1,nrow(x)-1,2),];
    xy[,,2]<-x[seq(2,nrow(x),2),];
    x<-xy
  }
  if(dataType=="columns"){
    xy<-array(0,c(nrow(x),ncol(x)/2,2))
    xy[,,1]<-x[,seq(1,ncol(x)-1,2)];
    xy[,,2]<-x[,seq(2,ncol(x),2)];
    x<-xy
  }
  nx<-x
  bindx<-data.Normalization(as.matrix(rbind(x[,,1],x[,,2])),type=type)
  nx[,,1]<-bindx[1:dim(x)[[1]],]
  nx[,,2]<-bindx[(dim(x)[[1]]+1):dim(bindx)[[1]],]
  sda=.simple2SO(nx)
  if(dataType=="separate_tables"){
    return (list(x=nx[,,1],y=nx[,,2],simple=nx,sda=sda))
  }
  if(dataType=="sda" || dataType=="simple"){
    return (list(simple=nx,sda=sda))
  }
  if(dataType=="rows"){
    x<-array(0,c(nrow(x)*2,ncol(x)))
    x[seq(1,nrow(x)-1,2),]<-nx[,,1];
    x[seq(2,nrow(x),2),]<-nx[,,2];
    return (list(x=x,sda=sda))
  }
  if(dataType=="rows"){
    x<-array(0,c(nrow(x),ncol(x)*2))
    x[,seq(1,nrow(x)-1,2)]<-nx[,,1];
    x[,seq(2,nrow(x),2)]<-nx[,,2];
    return (list(x=x,sda=sda))
  }
}
