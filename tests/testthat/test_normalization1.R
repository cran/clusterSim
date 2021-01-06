context("normalization1")

test_that("normalization1", {
  a<-matrix(runif(10,1,10),10,1)
  b<-as.vector(a[,1])
  for(i in 0:13){
    t=paste("n",i,sep="")
    an<-data.Normalization(a,type=t)
    bn<-data.Normalization(b,type=t)
    expect_equal(as.vector(an[,1]),as.vector(bn))
  }

  for(i in c(3,5,6,9,12)){
    t=paste("n",i,"a",sep="")
    an<-data.Normalization(a,type=t)
    bn<-data.Normalization(b,type=t)
    expect_equal(as.vector(an[,1]),as.vector(bn))
  }  
})
