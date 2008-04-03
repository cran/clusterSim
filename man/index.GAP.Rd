\name{index.Gap}
\alias{index.Gap}
\title{Calculates Tibshirani, Walther and Hastie gap index}
\description{Calculates Tibshirani, Walther and Hastie gap index}
\usage{index.Gap (x, clall, reference.distribution="unif", B=10, 
	method="pam")}
\arguments{
\item{x}{data}
\item{clall}{Two vectors of integers indicating the cluster to which each object is allocated in partition of n objects into u, and u+1 clusters}
\item{reference.distribution}{"unif" - generate each reference variable uniformly over the range of the observed values for that variable
or
"pc" - generate the reference variables from a uniform distribution over a box aligned with the principal components of the data. In detail, if $X=\{x_{ij}\}$  is our   n x m data matrix, assume that the columns have mean 0 and compute the singular value decomposition $X=UDV^T$. We transform via $X'=XV$ and then draw uniform features Z'  over the ranges of the columns of X' , as in method a) above. Finally we back-transform via $Z=Z'V^T$   to give reference data Z 
}
\item{B}{the number of simulations used to compute the gap statistic}
\item{method}{the cluster analysis method to be used. This should be one of: "ward", "single", "complete", "average", "mcquitty", "median", "centroid", "pam", "k-means"}
}
\value{
\item{Gap}{Tibshirani, Walther and Hastie gap index for u clusters}
\item{diffu}{necessary value for choosing correct number of clusters via gap statistic Gap(u)-[Gap(u+1)-s(u+1)]}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexGap\_details.pdf for further details

Thanks to dr Michael P. Fay from National Institute of Allergy and Infectious Diseases for finding "one column error".
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{
Tibshirani, R., Walther, G., Hastie, T. (2001),
\emph{Estimating the number of clusters in a data set via the gap statistic}, "Journal of the Royal Statistical Society", ser. B, vol. 63, part 2, 411-423.
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, 
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
d <- dist(x, method="euclidean")^2
min_class_no <- 1
max_class_no <- 15
min <- 0
clopt<-NULL
res<-NULL
results <- array(0, c(max_class_no-min_class_no+1,2))
results[,1] <- min_class_no:max_class_no
found <- FALSE
for (class_no in min_class_no:max_class_no){
  cl1 <- pam(d, class_no, diss=TRUE)
  cl2 <- pam(d, class_no+1, diss=TRUE)
  clall <- cbind(cl1$clustering, cl2$clustering)
  Gap <- index.Gap(x, clall, reference.distribution="pc", B=20, method="pam")
  results[class_no - min_class_no+1,2] <- diffu <- Gap$diffu
  if ((results[class_no - min_class_no+1,2]>=0) && (!found)){
    lk <- class_no
    min <- diffu
    clopt <- cl1$cluster
    res <- cl1$clusinfo
    found <- TRUE
  }
}
if (found){
  print(paste("Minimal number of clusters where diffu>=0 is ", lk, "for diffu=", round(min, 4)), quote=FALSE)
}else{
  print("I have not found clustering with diffu>=0", quote=FALSE)
}
write.table(results, file="diffu.csv", sep=";", dec=",", row.names=TRUE, col.names=FALSE)
write.table(clopt, file="clustering.csv", sep=";", dec=",", row.names=TRUE, col.names=FALSE)
write.table(res, file="clusinfo.csv", sep=";", dec=",", row.names=TRUE, col.names=TRUE)
options(OutDec=",")
plot(results, type="p", pch=0, xlab="Liczba klas", ylab="diffu", xaxt="n")
abline(h=0, untf=FALSE)
axis(1, c(min_class_no:max_class_no))
}
\keyword{cluster}

