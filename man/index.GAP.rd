\name{index.Gap}
\alias{index.Gap}
\title{Calculates Tibshirani, Walther and Hastie gap index}
\description{Calculates Tibshirani, Walther and Hastie gap index}
\usage{index.Gap (x, clall, reference.distribution="unif", B=10, 
	method="pam",d=NULL,centrotypes="centroids")}
\arguments{
\item{x}{data}
\item{clall}{Two vectors of integers indicating the cluster to which each object is allocated in partition of n objects into u, and u+1 clusters}
\item{reference.distribution}{"unif" - generate each reference variable uniformly over the range of the observed values for that variable
or
"pc" - generate the reference variables from a uniform distribution over a box aligned with the principal components of the data. In detail, if $X=\{x_{ij}\}$  is our   n x m data matrix, assume that the columns have mean 0 and compute the singular value decomposition $X=UDV^T$. We transform via $X'=XV$ and then draw uniform features Z'  over the ranges of the columns of X' , as in method a) above. Finally we back-transform via $Z=Z'V^T$   to give reference data Z 
}
\item{B}{the number of simulations used to compute the gap statistic}
\item{method}{the cluster analysis method to be used. This should be one of: "ward.D", "ward.D2", "single", "complete", "average", "mcquitty", "median", "centroid", "pam", "k-means","diana"}
\item{d}{optional distance matrix, used for calculations if centrotypes="medoids"}
\item{centrotypes}{"centroids" or "medoids"}
}
\value{
\item{Gap}{Tibshirani, Walther and Hastie gap index for u clusters}
\item{diffu}{necessary value for choosing correct number of clusters via gap statistic Gap(u)-[Gap(u+1)-s(u+1)]}
}
\details{
See file \url{../doc/indexGap_details.pdf} for further details

Thanks to dr Michael P. Fay from National Institute of Allergy and Infectious Diseases for finding "one column error".
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{
Tibshirani, R., Walther, G., Hastie, T. (2001), \emph{Estimating the number of clusters in a data set via the gap statistic}, "Journal of the Royal Statistical Society", ser. B, vol. 63, part 2, 411-423. Available at: \url{http://dx.doi.org/10.1111/1467-9868.00293}.
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, \code{\link{index.C}},
\code{\link{index.S}}, \code{\link{index.H}}, \code{\link{index.KL}}, \code{\link{index.DB}}
}
\examples{
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
}
\keyword{cluster}