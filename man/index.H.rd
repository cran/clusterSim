\name{index.H}
\alias{index.H}
\title{Calculates Hartigan index}
\description{Calculates Hartigan index}
\usage{index.H (x,clall,d=NULL,centrotypes="centroids")}
\arguments{
\item{x}{data}
\item{clall}{Two vectors of integers indicating the cluster to which each object is allocated in partition of n objects into u and u+1 clusters}
\item{d}{optional distance matrix, used for calculations if centrotypes="medoids"}
\item{centrotypes}{"centroids" or "medoids"}
}
\value{
Hartigan index
}
\details{
See file $R_HOME\\library\\clusterSim\\pdf\\indexH_details.pdf for further details
}
\references{

Hartigan, J. (1975), \emph{Clustering algorithms}, Wiley, New York. ISBN 047135645X. 

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, 159-179. Available at: \doi{10.1007/BF02294245}.

Tibshirani, R., Walther, G., Hastie, T. (2001), \emph{Estimating the number of clusters in a data set via the gap statistic}, "Journal of the Royal Statistical Society", ser. B, vol. 63, part 2, 411-423. Available at: \doi{10.1111/1467-9868.00293}.
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, \code{\link{index.C}},
\code{\link{index.S}}, \code{\link{index.KL}}, \code{\link{index.Gap}}, \code{\link{index.DB}}
}
\examples{
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
#write.table(res,file="H_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
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
#write.table(res,file="H_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="H",xaxt="n")
abline(h=10, untf=FALSE)
axis(1, c(min_nc:max_nc))
}
\keyword{cluster}
