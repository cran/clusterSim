\name{index.KL}
\alias{index.KL}
\title{Calculates Krzanowski-Lai index}
\description{Calculates Krzanowski-Lai index}
\usage{index.KL (x,clall,d=NULL,centrotypes="centroids")}
\arguments{
\item{x}{data}
\item{clall}{Three vectors of integers indicating the cluster to which each object is allocated in partition of n objects into u-1, u, and u+1 clusters}
\item{d}{optional distance matrix, used for calculations if centrotypes="medoids"}
\item{centrotypes}{"centroids" or "medoids"}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexKL\_details.pdf for further details
}
\value{
Krzanowski-Lai index
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{

Krzanowski, W.J., Lai, Y.T. (1988), \emph{A criterion for determining the number of groups in a data set using sum of squares clustering}, "Biometrics", 44, 23-34.

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, 159-179.

Tibshirani, R., Walther, G., Hastie, T. (2001), \emph{Estimating the number of clusters in a data set via the gap statistic}, "Journal of the Royal Statistical Society", ser. B, vol. 63, part 2, 411-423.

}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, 
\code{\link{index.S}}, \code{\link{index.H}}, \code{\link{index.Gap}}, \code{\link{index.DB}}
}
\examples{
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
}
\keyword{cluster}