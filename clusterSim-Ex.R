pkgname <- "clusterSim"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('clusterSim')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("HINoV.Mod")
### * HINoV.Mod

flush(stderr()); flush(stdout())

### Name: HINoV.Mod
### Title: Modification of Carmone, Kara & Maxwell Heuristic Identification
###   of Noisy Variables (HINoV) method
### Aliases: HINoV.Mod
### Keywords: cluster

### ** Examples

# for metric data
library(clusterSim)
data(data_ratio)
r1<- HINoV.Mod(data_ratio, type="metric", s=1, 4, method="kmeans",
     Index="cRAND")
print(r1$stopri)
plot(r1$stopri[,2],xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r1$stopri[,1])),labels=r1$stopri[,1])

# for nonmetric data
library(clusterSim)
data(data_nominal)
r2<- HINoV.Mod (data_nominal, type="nonmetric", Index = "cRAND")
print(r2$stopri)
plot(r2$stopri[,2], xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r2$stopri[,1])),labels=r2$stopri[,1])

# for mixed data
library(clusterSim)
data(data_mixed)
r3<- HINoV.Mod(data_mixed, type=c("m","n","m","n"), s=2, 3, distance="d1",
     method="complete", Index="cRAND")
print(r3$stopri)
plot(r3$stopri[,2], xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r3$stopri[,1])),labels=r3$stopri[,1])




cleanEx()
nameEx("HINoV.Symbolic")
### * HINoV.Symbolic

flush(stderr()); flush(stdout())

### Name: HINoV.Symbolic
### Title: Modification of Carmone, Kara & Maxwell Heuristic Identification
###   of Noisy Variables (HINoV) method for symbolic interval data
### Aliases: HINoV.Symbolic
### Keywords: cluster

### ** Examples

library(clusterSim)
data(data_symbolic)
r<- HINoV.Symbolic(data_symbolic, u=5)
print(r$stopri)
plot(r$stopri[,2], xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r$stopri[,1])),labels=r$stopri[,1])

#symbolic data from .csv file
#library(clusterSim)
#dsym<-as.matrix(read.csv2(file="csv/symbolic.csv"))
#dim(dsym)<-c(dim(dsym)[1],dim(dsym)[2]%/%2,2)          
#r<- HINoV.Symbolic(dsym, u=5)
#print(r$stopri)
#plot(r$stopri[,2], xlab="Variable number", ylab="topri",
#xaxt="n", type="b")
#axis(1,at=c(1:max(r$stopri[,1])),labels=r$stopri[,1])




cleanEx()
nameEx("cluster.Description")
### * cluster.Description

flush(stderr()); flush(stdout())

### Name: cluster.Description
### Title: Descriptive statistics calculated separately for each cluster
###   and variable
### Aliases: cluster.Description
### Keywords: cluster

### ** Examples

library(clusterSim)
data(data_ratio)
cl <- pam(data_ratio,5)
desc <- cluster.Description(data_ratio,cl$cluster)
print(desc)



cleanEx()
nameEx("cluster.Gen")
### * cluster.Gen

flush(stderr()); flush(stdout())

### Name: cluster.Gen
### Title: Random cluster generation with known structure of clusters
### Aliases: cluster.Gen
### Keywords: cluster data multivariate

### ** Examples



# Example 1
library(clusterSim)
means <- matrix(c(0,7,0,7),2,2)
cov <- matrix(c(1,0,0,1),2,2)
grnd <- cluster.Gen(numObjects=60,means=means,cov=cov,model=2,
numOutliers=8)
colornames <- c("red","blue","green")
grnd$clusters[grnd$clusters==0]<-length(colornames)
plot(grnd$data,col=colornames[grnd$clusters],ask=TRUE)

# Example 2
library(clusterSim)
grnd <- cluster.Gen(50,model=4,dataType="m",numNoisyVar=2)
data <- as.matrix(grnd$data)
colornames <- c("red","blue","green")
plot(grnd$data,col=colornames[grnd$clusters],ask=TRUE)

# Example 3
library(clusterSim)
grnd<-cluster.Gen(50,model=4,dataType="o",numCategories=7, numNoisyVar=2)
plotCategorial(grnd$data,,grnd$clusters,ask=TRUE)

# Example 4 (1 nonnoisy variable and 2 noisy variables, 3 clusters)
library(clusterSim)
grnd <- cluster.Gen(c(40,60,20), model=2, means=c(2,14,25),
cov=c(1.5,1.5,1.5),numNoisyVar=2)
colornames <- c("red","blue","green")
plot(grnd$data,col=colornames[grnd$clusters],ask=TRUE)

# Example 5
library(clusterSim)
grnd <- cluster.Gen(c(20,35,20,25),model=14,dataType="m",numNoisyVar=1,
fixedCov=FALSE, numOutliers=0.1, outputCsv2="data14.csv")
data <- as.matrix(grnd$data)
colornames <- c("red","blue","green","brown","black")
grnd$clusters[grnd$clusters==0]<-length(colornames)
plot(grnd$data,col=colornames[grnd$clusters],ask=TRUE)

# Example 6 (this example needs files means_24.csv) 
# and cov_24.csv to be placed in working directory
# library(clusterSim)
# grnd<-cluster.Gen(c(50,80,20),model=24,dataType="m",numNoisyVar=1, 
# numOutliers=10, rangeOutliers=c(1,5))
# print(grnd)
# data <- as.data.frame(grnd$data)
# colornames<-c("red","blue","green","brown")
# grnd$clusters[grnd$clusters==0]<-length(colornames)
# plot(data,col=colornames[grnd$clusters],ask=TRUE)

# Example 7 (this example needs files means_25.csv and cov_25_1.csv) 
# cov_25_2.csv, cov_25_3.csv, cov_25_4.csv, cov_25_5.csv
# to be placed in working directory
# library(clusterSim)
# grnd<-cluster.Gen(c(40,30,20,35,45),model=25,numNoisyVar=3,fixedCov=F)
# data <- as.data.frame(grnd$data)
# colornames<-c("red","blue","green","magenta","brown")
# plot(data,col=colornames[grnd$clusters],ask=TRUE)



cleanEx()
nameEx("cluster.Sim")
### * cluster.Sim

flush(stderr()); flush(stdout())

### Name: cluster.Sim
### Title: Determination of optimal clustering procedure for a data set
### Aliases: cluster.Sim
### Keywords: cluster data optimize multivariate

### ** Examples

library(clusterSim)
data(data_ratio)
cluster.Sim(data_ratio, 1, 2, 3, "G1", outputCsv="results1")
data(data_interval)
cluster.Sim(data_interval, 2, 2, 4, "G1", outputHtml="results2")
data(data_ordinal)
cluster.Sim(data_ordinal, 3, 2, 4,"G2", outputCsv2="results3")
data(data_nominal)
cluster.Sim(data_nominal, p=4, 2, 4, icq="G3", outputHtml="results4", methods=c("m2","m3","m5"))
data(data_binary)
cluster.Sim(data_binary, p=5, 2, 4, icq="S", outputHtml="results5", distances=c("b1","b3","b6"))
data(data_ratio)
cluster.Sim(data_ratio, 1, 2, 4,"G1", outputCsv="results6",normalizations=c("n1","n3"),
distances=c("d2","d5"),methods=c("m5","m3","m1"))



cleanEx()
nameEx("comparing.Partitions")
### * comparing.Partitions

flush(stderr()); flush(stdout())

### Name: comparing.Partitions
### Title: Calculate agreement indices between two partitions
### Aliases: comparing.Partitions
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
dataSet<-cluster.Gen(model=5)
cl1<-dataSet$clusters
cl2<-kmeans(dataSet$data,2)$cluster
print(comparing.Partitions(cl1,cl2,type="rand"))

# Example 2
library(clusterSim)
data(data_patternGDM1)
z<-data.Normalization(data_patternGDM1,type="n1")
d<-dist.GDM(z,method="GDM1")
cl1<-pam(d,3,diss=TRUE)$clustering
cl2<-pam(d,4,diss=TRUE)$clustering
print(comparing.Partitions(cl1,cl2,type="crand"))

# Example 3
library(clusterSim)
data(data_patternGDM1)
z<-data.Normalization(data_patternGDM1,type="n9")
d<-dist.GDM(z,method="GDM1")
cl1<-pam(d,3,diss=TRUE)$clustering
hc<-hclust(d, method="complete")
cl2<-cutree(hc,k=3)
print(comparing.Partitions(cl1,cl2,type="nowak"))



cleanEx()
nameEx("data.Normalization")
### * data.Normalization

flush(stderr()); flush(stdout())

### Name: data.Normalization
### Title: Types of variable normalization formulas
### Aliases: data.Normalization
### Keywords: cluster

### ** Examples

library(clusterSim)
data(data_ratio)
z1 <- data.Normalization(data_ratio, "n1")
z2 <- data.Normalization(data_ratio, type="n2")
z8 <- data.Normalization(data_ratio, type="n8")



cleanEx()
nameEx("data_binary")
### * data_binary

flush(stderr()); flush(stdout())

### Name: data_binary
### Title: Binary data
### Aliases: data_binary
### Keywords: datasets

### ** Examples

library(clusterSim)
data(data_binary)
cluster.Sim(data_binary, p=5, 2, 6, icq="S", 
outputHtml="results5", distances=c("b1","b3","b6"))



cleanEx()
nameEx("data_interval")
### * data_interval

flush(stderr()); flush(stdout())

### Name: data_interval
### Title: Interval data
### Aliases: data_interval
### Keywords: datasets

### ** Examples

library(clusterSim)
data(data_interval)
cluster.Sim(data_interval, 2, 2, 3, "G1", outputHtml="results2")



cleanEx()
nameEx("data_mixed")
### * data_mixed

flush(stderr()); flush(stdout())

### Name: data_mixed
### Title: Mixed data
### Aliases: data_mixed
### Keywords: datasets

### ** Examples

library(clusterSim)
data(data_mixed)
r3 <- HINoV.Mod(data_mixed, type=c("m","n","m","n"), s=2, 3, distance="d1",
     method="complete", Index="cRAND")
print(r3$stopri)
plot(r3$stopri[,2], xlab="Variable number", ylab="topri", xaxt="n")
axis(1,at=c(1:max(r3$stopri[,1])),labels=r3$stopri[,1])



cleanEx()
nameEx("data_nominal")
### * data_nominal

flush(stderr()); flush(stdout())

### Name: data_nominal
### Title: Nominal data
### Aliases: data_nominal
### Keywords: datasets

### ** Examples

library(clusterSim)
data(data_nominal)
cluster.Sim(data_nominal, p=4, 2, 5, icq="G3",
outputHtml="results4", methods=c("m2","m3","m5"))



cleanEx()
nameEx("data_ordinal")
### * data_ordinal

flush(stderr()); flush(stdout())

### Name: data_ordinal
### Title: Ordinal data
### Aliases: data_ordinal
### Keywords: datasets

### ** Examples

library(clusterSim)
data(data_ordinal)
cluster.Sim(data_ordinal, 3, 3, 12,"S", 
outputCsv2="results3")



cleanEx()
nameEx("data_patternGDM1")
### * data_patternGDM1

flush(stderr()); flush(stdout())

### Name: data_patternGDM1
### Title: Metric data with 17 objects and 10 variables (8 stimulant
###   variables, 2 destimulant variables)
### Aliases: data_patternGDM1
### Keywords: datasets

### ** Examples

# Example 1
library(clusterSim)
data(data_patternGDM1)
res<-pattern.GDM1(data_patternGDM1,
performanceVariable=c("s","s","s","s","s","s","d","d","s","s"),
scaleType="r",nomOptValues=NULL,weightsType<-"equal",weights=NULL,
normalization<-"n4",patternType<-"lower",patternCoordinates<-"manual",
patternManual<-c(0,0,0,0,0,"min","max","max","min","min"),
nominalTransfMethod <-NULL)
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(max(gdm_p),min(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)),xaxt="n",
xlab="Order of objects from the best to the worst", 
ylab="GDM distances from pattern object",lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)

# Example 2
library(clusterSim)
data(data_patternGDM1)
res<-pattern.GDM1(data_patternGDM1,
performanceVariable=c("s","s","s","s","s","s","d","d","s","s"),
scaleType="r",nomOptValues=NULL,weightsType<-"equal",weights=NULL,
normalization<-"n2",patternType<-"upper",
patternCoordinates<-"dataBounds",patternManual<-NULL,
nominalTransfMethod <-NULL)
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(min(gdm_p),max(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)),xaxt="n",
xlab="Order of objects from the best to the worst", 
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)



cleanEx()
nameEx("data_patternGDM2")
### * data_patternGDM2

flush(stderr()); flush(stdout())

### Name: data_patternGDM2
### Title: Ordinal data with 27 objects and 6 variables (3 stimulant
###   variables, 2 destimulant variables and 1 nominant variable)
### Aliases: data_patternGDM2
### Keywords: datasets

### ** Examples

# Example 1
library(clusterSim)
data(data_patternGDM2)
res<-pattern.GDM2(data_patternGDM2,
performanceVariable=c("s","s","s","d","d","n"),
nomOptValues=c(NA,NA,NA,NA,NA,3), weightsType<-"equal", weights=NULL,
patternType="lower", patternCoordinates="manual",
patternManual=c("min","min",0,5,"max","max"),
nominalTransfMethod="symmetrical")
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(max(gdm_p),min(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)), 
xaxt="n",xlab="Order of objects from the best to the worst",
ylab="GDM distances from pattern object",lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)

# Example 2
library(clusterSim)
data(data_patternGDM2)
res<-pattern.GDM2(data_patternGDM2,
performanceVariable=c("s","s","s","d","d","n"),
nomOptValues=c(NA,NA,NA,NA,NA,3), weightsType<-"equal", weights=NULL,
patternType="upper", patternCoordinates="dataBounds",
patternManual=NULL, nominalTransfMethod="database")
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p), xlim=c(min(gdm_p),max(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)), 
xaxt="n",xlab="Order of objects from the best to the worst",
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)



cleanEx()
nameEx("data_ratio")
### * data_ratio

flush(stderr()); flush(stdout())

### Name: data_ratio
### Title: Ratio data
### Aliases: data_ratio
### Keywords: datasets

### ** Examples

library(clusterSim)
data(data_ratio)
c <- pam(data_ratio,10)
index.G1(data_ratio, c$clustering)



cleanEx()
nameEx("data_symbolic")
### * data_symbolic

flush(stderr()); flush(stdout())

### Name: data_symbolic
### Title: Symbolic interval data
### Aliases: data_symbolic
### Keywords: datasets

### ** Examples

library(clusterSim)
data(data_symbolic)
r<- HINoV.Symbolic(data_symbolic, u=5)
print(r$stopri)
plot(r$stopri[,2], xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r$stopri[,1])),labels=r$stopri[,1])



cleanEx()
nameEx("dist.BC")
### * dist.BC

flush(stderr()); flush(stdout())

### Name: dist.BC
### Title: Calculates Bray-Curtis distance measure for ratio data
### Aliases: dist.BC
### Keywords: cluster

### ** Examples

library(clusterSim)
sampleData <- cbind(c(2,3,5),c(4,5,6),c(5,3,4))
d <- dist.BC(sampleData)



cleanEx()
nameEx("dist.GDM")
### * dist.GDM

flush(stderr()); flush(stdout())

### Name: dist.GDM
### Title: Calculates Generalized Distance Measure
### Aliases: dist.GDM GDM GDM1 GDM2
### Keywords: cluster

### ** Examples

#Example 1
library(clusterSim)
data(data_ratio)
d1 <- GDM(data_ratio, method="GDM1")
data(data_ordinal)
d2 <- GDM(data_ordinal, method="GDM2")
d3 <- GDM1(data_ratio)
d4 <- GDM2(data_ordinal)

#Example 2
library(clusterSim)
data(data_ratio)
d1w <- GDM(data_ratio, method="GDM1", weightsType="different1",
weights=c(0.4,0.1,0.3,0.15,0.05))
data(data_ordinal)
d2w <- GDM(data_ordinal, method="GDM2", weightsType="different2",
weights=c(1,3,0.5,1.5,1.8,0.2,0.4,0.6,0.2,0.4,0.9,1.5))



cleanEx()
nameEx("dist.SM")
### * dist.SM

flush(stderr()); flush(stdout())

### Name: dist.SM
### Title: Calculates Sokal-Michener distance measure for nominal variables
### Aliases: dist.SM
### Keywords: cluster

### ** Examples

library(clusterSim)
data(data_nominal)
d <- dist.SM(data_nominal)



cleanEx()
nameEx("dist.Symbolic")
### * dist.Symbolic

flush(stderr()); flush(stdout())

### Name: dist.Symbolic
### Title: Calculates distance between symbolic interval-valued data
### Aliases: dist.Symbolic
### Keywords: cluster

### ** Examples

library(clusterSim)
dataSymbolic<-cluster.Gen(numObjects=10,model=5,dataType="s")$data
print(dist.Symbolic(dataSymbolic))



cleanEx()
nameEx("index.DB")
### * index.DB

flush(stderr()); flush(stdout())

### Name: index.DB
### Title: Calculates Davies-Bouldin's index
### Aliases: index.DB
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
cl1 <- pam(data_ratio, 4)
d<-dist(data_ratio)
print(index.DB(data_ratio, cl1$clustering,d, centrotypes="medoids"))

# Example 2
library(clusterSim)
data(data_ratio)
cl2 <- pam(data_ratio, 5)
print(index.DB(data_ratio, cl2$clustering, centrotypes="centroids"))

# Example 3
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="euclidean")
# nc - number_of_clusters
min_nc=2
max_nc=8
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
hc <- hclust(md, method="complete")
cl2 <- cutree(hc, k=nc)
res[nc-min_nc+1, 2] <- DB <- index.DB(data_ratio, cl2, centrotypes="centroids")$DB
clusters <- rbind(clusters, cl2)
}
print(paste("min DB for",(min_nc:max_nc)[which.min(res[,2])],"clusters=",min(res[,2])))
print("clustering for min DB")
print(clusters[which.min(res[,2]),])
write.table(res,file="DB_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="DB", xaxt="n")
axis(1, c(min_nc:max_nc))

# Example 4
library(clusterSim)
data(data_ordinal)
md <- dist.GDM(data_ordinal, method="GDM2")
# nc - number_of_clusters
min_nc=2
max_nc=6
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
hc <- hclust(md, method="complete")
cl2 <- cutree(hc, k=nc)
res[nc-min_nc+1,2] <- DB <- index.DB(data_ordinal,cl2,d=md,centrotypes="medoids")$DB
clusters <- rbind(clusters, cl2)
}
print(paste("min DB for",(min_nc:max_nc)[which.min(res[,2])],"clusters=",min(res[,2])))
print("clustering for min DB")
print(clusters[which.min(res[,2]),])
write.table(res,file="DB_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="DB", xaxt="n")
axis(1, c(min_nc:max_nc))



cleanEx()
nameEx("index.G1")
### * index.G1

flush(stderr()); flush(stdout())

### Name: index.G1
### Title: Calculates Calinski-Harabasz pseudo F-statistic
### Aliases: index.G1
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
c<- pam(data_ratio,10)
index.G1(data_ratio,c$clustering)

# Example 2
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="euclidean")
# nc - number_of_clusters
min_nc=2
max_nc=20
res <- array(0,c(max_nc-min_nc+1,2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl2 <- pam(md, nc, diss=TRUE)
res[nc-min_nc+1,2] <- G1 <- index.G1(data_ratio,cl2$cluster,centrotypes="centroids")
clusters <- rbind(clusters, cl2$cluster)
}
print(paste("max G1 for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max G1")
print(clusters[which.max(res[,2]),])
write.table(res,file="G1_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G1", xaxt="n")
axis(1, c(min_nc:max_nc))

# Example 3
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="euclidean")
# nc - number_of_clusters
min_nc=2
max_nc=20
res <- array(0,c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl2 <- pam(md, nc, diss=TRUE)
res[nc-min_nc+1,2] <- G1 <- index.G1(data_ratio,cl2$cluster,d=md,centrotypes="medoids")
clusters <- rbind(clusters, cl2$cluster)
}
print(paste("max G1 for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max G1")
print(clusters[which.max(res[,2]),])
write.table(res,file="G1_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G1", xaxt="n")
axis(1, c(min_nc:max_nc))



cleanEx()
nameEx("index.G2")
### * index.G2

flush(stderr()); flush(stdout())

### Name: index.G2
### Title: Calculates G2 internal cluster quality index
### Aliases: index.G2
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.G2(d,c$clustering)
print(icq)

# Example 2
library(clusterSim)
data(data_ordinal)
d <- dist.GDM(data_ordinal, method="GDM2")
# nc - number_of_clusters
min_nc=2
max_nc=6
res <- array(0,c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl2 <- pam(d, nc, diss=TRUE)
res[nc-min_nc+1,2] <- G2 <- index.G2(d,cl2$cluster)
clusters <- rbind(clusters,cl2$cluster)
}
print(paste("max G2 for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max G2")
print(clusters[which.max(res[,2]),])
write.table(res,file="G2_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G2", xaxt="n")
axis(1, c(min_nc:max_nc))



cleanEx()
nameEx("index.G3")
### * index.G3

flush(stderr()); flush(stdout())

### Name: index.G3
### Title: Calculates G3 internal cluster quality index
### Aliases: index.G3
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.G3(d,c$clustering)
print(icq)

# Example 2
library(clusterSim)
data(data_ordinal)
d <- dist.GDM(data_ordinal, method="GDM2")
# nc - number_of_clusters
min_nc=2
max_nc=6
res <- array(0,c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
hc <- hclust(d, method="complete")
cl2 <- cutree(hc, k=nc)
res[nc-min_nc+1,2] <- G3 <- index.G3(d,cl2)
clusters <- rbind(clusters,cl2)
}
print(paste("min G3 for",(min_nc:max_nc)[which.min(res[,2])],"clusters=",min(res[,2])))
print("clustering for min G3")
print(clusters[which.min(res[,2]),])
write.table(res,file="G3_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G3", xaxt="n")
axis(1, c(min_nc:max_nc))



cleanEx()
nameEx("index.GAP")
### * index.GAP

flush(stderr()); flush(stdout())

### Name: index.Gap
### Title: Calculates Tibshirani, Walther and Hastie gap index
### Aliases: index.Gap
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
cl1<-pam(data_ratio,4)
cl2<-pam(data_ratio,5)
clall<-cbind(cl1$clustering,cl2$clustering)
g<-index.Gap(data_ratio, clall, reference.distribution="unif", B=10,
   method="pam")
print(g)

# Example 2
library(clusterSim)
means <- matrix(c(0,2,4,0,3,6), 3, 2)
cov <- matrix(c(1,-0.9,-0.9,1), 2, 2)
x <- cluster.Gen(numObjects=40, means=means, cov=cov, model=2)
x <- x$data
md <- dist(x, method="euclidean")^2
# nc - number_of_clusters
min_nc=1
max_nc=5
min <- 0
clopt <- NULL
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
found <- FALSE
for (nc in min_nc:max_nc){
  cl1 <- pam(md, nc, diss=TRUE)
  cl2 <- pam(md, nc+1, diss=TRUE)
  clall <- cbind(cl1$clustering, cl2$clustering)
  gap <- index.Gap(x,clall,B=20,method="pam",centrotypes="centroids")
  res[nc-min_nc+1, 2] <- diffu <- gap$diffu
  if ((res[nc-min_nc+1, 2] >=0) && (!found)){
    nc1 <- nc
    min <- diffu
    clopt <- cl1$cluster
    found <- TRUE
  }
}
if (found){
print(paste("Minimal nc where diffu>=0 is",nc1,"for diffu=",round(min,4)),quote=FALSE)
}else{
print("I have not found clustering with diffu>=0", quote=FALSE)
}
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="diffu",xaxt="n")
abline(h=0, untf=FALSE)
axis(1, c(min_nc:max_nc))

# Example 3
library(clusterSim)
means <- matrix(c(0,2,4,0,3,6), 3, 2)
cov <- matrix(c(1,-0.9,-0.9,1), 2, 2)
x <- cluster.Gen(numObjects=40, means=means, cov=cov, model=2)
x <- x$data
md <- dist(x, method="euclidean")^2
# nc - number_of_clusters
min_nc=1
max_nc=5
min <- 0
clopt <- NULL
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
found <- FALSE
for (nc in min_nc:max_nc){
  cl1 <- pam(md, nc, diss=TRUE)
  cl2 <- pam(md, nc+1, diss=TRUE)
  clall <- cbind(cl1$clustering, cl2$clustering)
  gap <- index.Gap(x,clall,B=20,method="pam",d=md,centrotypes="medoids")
  res[nc-min_nc+1, 2] <- diffu <- gap$diffu
  if ((res[nc-min_nc+1, 2] >=0) && (!found)){
    nc1 <- nc
    min <- diffu
    clopt <- cl1$cluster
    found <- TRUE
  }
}
if (found){
print(paste("Minimal nc where diffu>=0 is",nc1,"for diffu=",round(min,4)),quote=FALSE)
}else{
print("I have not found clustering with diffu>=0",quote=FALSE)
}
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="diffu", xaxt="n")
abline(h=0, untf=FALSE)
axis(1, c(min_nc:max_nc))



cleanEx()
nameEx("index.H")
### * index.H

flush(stderr()); flush(stdout())

### Name: index.H
### Title: Calculates Hartigan index
### Aliases: index.H
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
cl1<-pam(data_ratio,4)
cl2<-pam(data_ratio,5)
clall<-cbind(cl1$clustering,cl2$clustering)
index.H(data_ratio,clall)

# Example 2
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="euclidean")
# nc - number_of_clusters
min_nc=1
max_nc=20
min <- 0
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
found <- FALSE
clusters <- NULL
for (nc in min_nc:max_nc)
{
	print(nc)
	hc <- hclust(md, method="complete")
	cl1 <- cutree(hc, k=nc)
	cl2 <- cutree(hc, k=nc+1)
	clall <- cbind(cl1,cl2)
	res[nc-min_nc+1,2] <- H <- index.H(data_ratio,clall,centrotypes="centroids")
	if ((res[nc-min_nc+1, 2]<10) && (!found)){
       nc1 <- nc
       min <- H
       clopt <- cl1
		   found <- TRUE
	}
}
if (found)
{
	print(paste("minimal nc for H<=10 equals",nc1,"for H=",min))
	print("clustering for minimal nc where H<=10")
	print(clopt)
}else
{
	print("Clustering not found with H<=10")
}
write.table(res,file="H_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="H",xaxt="n")
abline(h=10, untf=FALSE)
axis(1, c(min_nc:max_nc))

# Example 3
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="manhattan")
# nc - number_of_clusters
min_nc=1
max_nc=20
min <- 0
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
found <- FALSE
clusters <- NULL
for (nc in min_nc:max_nc)
{
	print(nc)
	hc <- hclust(md, method="complete")
	cl1 <- cutree(hc, k=nc)
	cl2 <- cutree(hc, k=nc+1)
	clall <- cbind(cl1,cl2)
	res[nc-min_nc+1,2] <- H <- index.H(data_ratio,clall,d=md,centrotypes="medoids")
	if ((res[nc-min_nc+1, 2]<10) && (!found)){
       nc1 <- nc
       min <- H
       clopt <- cl1
		   found <- TRUE
	}
}
if (found)
{
	print(paste("minimal nc for H<=10 equals",nc1,"for H=",min))
	print("clustering for minimal nc where H<=10")
	print(clopt)
}else
{
	print("Clustering not found with H<=10")
}
write.table(res,file="H_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="H",xaxt="n")
abline(h=10, untf=FALSE)
axis(1, c(min_nc:max_nc))



cleanEx()
nameEx("index.KL")
### * index.KL

flush(stderr()); flush(stdout())

### Name: index.KL
### Title: Calculates Krzanowski-Lai index
### Aliases: index.KL
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
cl1<-pam(data_ratio,4)
cl2<-pam(data_ratio,5)
cl3<-pam(data_ratio,6)
clall<-cbind(cl1$clustering,cl2$clustering,cl3$clustering)
index.KL(data_ratio,clall)

# Example 2
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="manhattan")
# nc - number_of_clusters
min_nc=2
max_nc=15
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl1 <- pam(md, nc-1, diss=TRUE)
cl2 <- pam(md, nc, diss=TRUE)
cl3 <- pam(md, nc+1, diss=TRUE)
clall<- cbind(cl1$clustering, cl2$clustering, cl3$clustering)
res[nc-min_nc+1,2] <- KL <- index.KL(data_ratio,clall,centrotypes="centroids")
clusters <- rbind(clusters, cl2$cluster)
} 
print(paste("max KL for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max KL")
print(clusters[which.max(res[,2]),])
write.table(res,file="KL_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="KL",xaxt="n")
axis(1, c(min_nc:max_nc))

# Example 3
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="manhattan")
# nc - number_of_clusters
min_nc=2
max_nc=15
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl1 <- pam(md, nc-1, diss=TRUE)
cl2 <- pam(md, nc, diss=TRUE)
cl3 <- pam(md, nc+1, diss=TRUE)
clall<- cbind(cl1$clustering, cl2$clustering, cl3$clustering)
res[nc-min_nc+1,2] <- KL <- index.KL(data_ratio,clall,d=md,centrotypes="medoids")
clusters <- rbind(clusters, cl2$cluster)
} 
print(paste("max KL for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max KL")
print(clusters[which.max(res[,2]),])
write.table(res,file="KL_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="KL",xaxt="n")
axis(1, c(min_nc:max_nc))



cleanEx()
nameEx("index.S")
### * index.S

flush(stderr()); flush(stdout())

### Name: index.S
### Title: Calculates Rousseeuw's Silhouette internal cluster quality index
### Aliases: index.S
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.S(d,c$clustering)
print(icq)

# Example 2
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="manhattan")
# nc - number_of_clusters
min_nc=2
max_nc=20
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl2 <- pam(md, nc, diss=TRUE)
res[nc-min_nc+1, 2] <- S <- index.S(md,cl2$cluster)
clusters <- rbind(clusters, cl2$cluster)
}
print(paste("max S for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max S")
print(clusters[which.max(res[,2]),])
write.table(res,file="S_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="S",xaxt="n")
axis(1, c(min_nc:max_nc))



cleanEx()
nameEx("initial.Centers")
### * initial.Centers

flush(stderr()); flush(stdout())

### Name: initial.Centers
### Title: Calculation of initial clusters centers for k-means like
###   alghoritms
### Aliases: initial.Centers
### Keywords: cluster

### ** Examples

#Example 1 (numbers of objects choosen as initial cluster centers)
library(clusterSim)
data(data_ratio)
ic <- initial.Centers(data_ratio, 10)
print(ic)

#Example 2 (application with kmeans algorithm)
library(clusterSim)
data(data_ratio)
kmeans(data_ratio,data_ratio[initial.Centers(data_ratio, 10),]) 




cleanEx()
nameEx("pattern.GDM1")
### * pattern.GDM1

flush(stderr()); flush(stdout())

### Name: pattern.GDM1
### Title: An application of GDM1 distance for metric data to compute the
###   distances of objects from the pattern object (upper or lower)
### Aliases: pattern.GDM1
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_patternGDM1)
res<-pattern.GDM1(data_patternGDM1,
performanceVariable=c("s","s","s","s","s","s","d","d","s","s"),
scaleType="r",nomOptValues=NULL,weightsType<-"equal",weights=NULL,
normalization<-"n4",patternType<-"lower",patternCoordinates<-"manual",
patternManual<-c("min","min","min","min","min","min","max","max","min","min"),
nominalTransfMethod <-NULL)
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(max(gdm_p),min(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)),xaxt="n",
xlab="Order of objects from the best to the worst", 
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)

# Example 2
library(clusterSim)
data(data_patternGDM1)
res<-pattern.GDM1(data_patternGDM1,
performanceVariable=c("s","s","s","s","s","s","d","d","s","s"),
scaleType="r",nomOptValues=NULL,weightsType<-"equal",weights=NULL,
normalization<-"n2",patternType<-"upper",
patternCoordinates<-"dataBounds",patternManual<-NULL,
nominalTransfMethod<-NULL)
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(min(gdm_p),max(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)),xaxt="n",
xlab="Order of objects from the best to the worst", 
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)

# Example 3
library(clusterSim)
data(data_patternGDM1)
res<-pattern.GDM1(data_patternGDM1,
performanceVariable=c("s","s","s","s","s","s","d","d","s","s"),
scaleType="r",nomOptValues=NULL,weightsType<-"different2",
weights=c(1.1,1.15,1.15,1.1,1.1,0.7,0.7,1.2,0.8,1.0),
normalization<-"n6",patternType<-"upper",patternCoordinates<-"manual",
patternManual<-c(100,100,100,100,100,"max","min","min","max","max"),
nominalTransfMethod <-NULL)
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(min(gdm_p),max(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)),xaxt="n",
xlab="Order of objects from the best to the worst", 
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)



cleanEx()
nameEx("pattern.GDM2")
### * pattern.GDM2

flush(stderr()); flush(stdout())

### Name: pattern.GDM2
### Title: An application of GDM2 distance for ordinal data to compute the
###   distances of objects from the pattern object (upper or lower)
### Aliases: pattern.GDM2
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_patternGDM2)
res<-pattern.GDM2(data_patternGDM2,
performanceVariable=c("s","s","s","d","d","n"),
nomOptValues=c(NA,NA,NA,NA,NA,3), weightsType<-"equal", weights=NULL,
patternType="lower", patternCoordinates="manual",
patternManual=c("min","min",0,5,"max","max"),
nominalTransfMethod="symmetrical")
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(max(gdm_p),min(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)), 
xaxt="n",xlab="Order of objects from the best to the worst",
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)

# Example 2
library(clusterSim)
data(data_patternGDM2)
res<-pattern.GDM2(data_patternGDM2,
performanceVariable=c("s","s","s","d","d","n"),
nomOptValues=c(NA,NA,NA,NA,NA,3), weightsType<-"equal", weights=NULL,
patternType="upper", patternCoordinates="dataBounds",
patternManual=NULL, nominalTransfMethod="database")
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p), xlim=c(min(gdm_p),max(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)), 
xaxt="n",xlab="Order of objects from the best to the worst",
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)



cleanEx()
nameEx("plotCategorial")
### * plotCategorial

flush(stderr()); flush(stdout())

### Name: plotCategorial
### Title: Plot categorial data on a scatterplot matrix
### Aliases: plotCategorial
### Keywords: hplot

### ** Examples

# Example 1
library(clusterSim)
data(data_ordinal)
plotCategorial(data_ordinal, pairsofVar=c(1,3,4,9), cl=NULL, 
clColors = NULL)

# Example 2
library(clusterSim)
grnd <- cluster.Gen(50,model=5,dataType="o",numCategories=5)
plotCategorial(grnd$data, pairsofVar=NULL, cl=grnd$clusters, 
clColors=TRUE)

# Example 3
library(clusterSim)
grnd<-cluster.Gen(50,model=4,dataType="o",numCategories=7, numNoisyVar=2)
plotCategorial(grnd$data, pairsofVar=NULL, cl=grnd$clusters, 
clColors = c("red","blue","green"))




cleanEx()
nameEx("plotCategorial3d")
### * plotCategorial3d

flush(stderr()); flush(stdout())

### Name: plotCategorial3d
### Title: Plot categorial data with three-dimensional plots
### Aliases: plotCategorial3d
### Keywords: hplot

### ** Examples

# These examples do not run on Mac_OS-X. We're working to fix them
# They run quite well on Windows and Linux in meantime

# Example 1
#library(clusterSim)
#data(data_ordinal)
#plotCategorial3d(data_ordinal, tripleofVar=c(1,3,9), cl=NULL,
#clColors=NULL)

# Example 2
#library(clusterSim)
#grnd <- cluster.Gen(50,model=5,dataType="o",numCategories=5)
#plotCategorial3d(grnd$data, tripleofVar=c(1,2,3), cl=grnd$clusters,
#clColors=TRUE)

# Example 3
#library(clusterSim)
#grnd <- cluster.Gen(50, model=4, dataType="o", numCategories=7, numNoisyVar=2)
#plotCategorial3d(grnd$data, tripleofVar=c(1,2,4), cl=grnd$clusters,
#clColors=c("red","blue","green"))



cleanEx()
nameEx("plotInterval")
### * plotInterval

flush(stderr()); flush(stdout())

### Name: plotInterval
### Title: Plot symbolic interval-valued data on a scatterplot matrix
### Aliases: plotInterval
### Keywords: hplot

### ** Examples

# Example 1
library(clusterSim)
data(data_symbolic)
plotInterval(data_symbolic, pairsofsVar=c(1,3,4,6), cl=NULL,
clColors=NULL)

# Example 2
library(clusterSim)
grnd <- cluster.Gen(60, model=5, dataType="s", numNoisyVar=1, 
numOutliers=10, rangeOutliers=c(1,5))
grnd$clusters[grnd$clusters==0] <- max(grnd$clusters)+1			
# To colour outliers
plotInterval(grnd$data, pairsofsVar=NULL, cl=grnd$clusters,
clColors=TRUE)

# Example 3
library(clusterSim)
grnd <- cluster.Gen(50, model=4, dataType="s", numNoisyVar=2, 
numOutliers=10, rangeOutliers=c(1,4))
grnd$clusters[grnd$clusters==0] <- max(grnd$clusters)+1			
# To colour outliers
plotInterval(grnd$data, pairsofsVar=NULL, cl=grnd$clusters, 
clColors=c("red","blue","green","yellow"))



cleanEx()
nameEx("replication.Mod")
### * replication.Mod

flush(stderr()); flush(stdout())

### Name: replication.Mod
### Title: Modification of replication analysis for cluster validation
### Aliases: replication.Mod
### Keywords: cluster multivariate

### ** Examples

library(clusterSim)
data(data_ratio)
w <- replication.Mod(data_ratio, u=5, S=10)
print(w)

library(clusterSim)
data(data_binary)
replication.Mod(data_binary,"b", u=2, "medoids", NULL,"b1",
"pam", fixedAsample=c(1,3,6,7))



cleanEx()
nameEx("speccl")
### * speccl

flush(stderr()); flush(stdout())

### Name: speccl
### Title: A spectral clustering algorithm
### Aliases: speccl
### Keywords: spectral clustering, cluster analysis, scales of measurement

### ** Examples

# Example 1
library(clusterSim)
library(mlbench)
data<-mlbench.spirals(100,1,0.03)
plot(data)
x<-data$x
res1<-speccl(x,nc=2,distance="GDM1",sigma="automatic",
sigma.interval="default",mod.sample=0.75,R=10,iterations=3)
clas1<-res1$cluster
print(data$classes)
print(clas1)
cRand<-classAgreement(table(as.numeric(as.vector(data$classes)),
res1$clusters))$crand
print(res1$sigma)
print(cRand)

# Example 2
library(clusterSim)
grnd2<-cluster.Gen(50,model=4,dataType="m",numNoisyVar=1)
data<-as.matrix(grnd2$data)
colornames<-c("red","blue","green")
grnd2$clusters[grnd2$clusters==0]<-length(colornames)
plot(grnd2$data,col=colornames[grnd2$clusters])
us<-nrow(data)*nrow(data)/2
res2<-speccl(data,nc=3,distance="sEuclidean",sigma="automatic",
sigma.interval=us,mod.sample=0.75,R=10,iterations=3)
cRand<-comparing.Partitions(grnd2$clusters,res2$clusters,type="crand")
print(res2$sigma)
print(cRand)

# Example 3
library(clusterSim)
grnd3<-cluster.Gen(40,model=4,dataType="o",numCategories=7)
data<-as.matrix(grnd3$data)
plotCategorial(grnd3$data,pairsofVar=NULL,cl=grnd3$clusters,
clColors=c("red","blue","green"))
res3<-speccl(data,nc=3,distance="GDM2",sigma="automatic",
sigma.interval="default",mod.sample=0.75,R=10,iterations=3)
cRand<-comparing.Partitions(grnd3$clusters,res3$clusters,type="crand")
print(res3$sigma)
print(cRand)

# Example 4
library(clusterSim)
data(data_nominal)
res4<-speccl(data_nominal,nc=4,distance="SM",sigma="automatic",
sigma.interval="default",mod.sample=0.75,R=10,iterations=3)
print(res4)




### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
