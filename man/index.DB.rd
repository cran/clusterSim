\name{index.DB}
\alias{index.DB}
\title{Calculates Davies-Bouldin's index}
\description{Calculates Davies-Bouldin's cluster separation measure}
\usage{index.DB(x, cl, d=NULL, centrotypes="centroids", p=2, q=2)}
\arguments{
\item{x}{data}
\item{cl}{vector of integers indicating the cluster to which each object is allocated}
\item{d}{optional distance matrix, used for calculations if centrotypes="medoids"}
\item{centrotypes}{"centroids" or "medoids"}
\item{p}{the power of the Minkowski distance between centroids or medoids of clusters: p=1 - Manhattan distance; p=2 - Euclidean distance}
\item{q}{the power of dispersion measure of a cluster: q=1 - the average distance of objects in the r-th cluster to the centroid or medoid
of the r-th cluster; q=2 - the standard deviation of the distance of objects in the r-th cluster to the centroid or medoid of the r-th cluster}
}
\details{
See file \url{../doc/indexDB_details.pdf} for further details

Thanks to prof. Christian Hennig \email{c.hennig@ucl.ac.uk} for finding and fixing the "immutable p" error  
}
\value{
\item{DB}{Davies-Bouldin's index}
\item{r}{vector of maximal R values for each cluster}
\item{R}{R matrix $(S_r+S_s)/d_{rs}$}
\item{d}{matrix of distances between centroids or medoids of clusters}
\item{S}{vector of dispersion measures for each cluster}
\item{centers}{coordinates of centroids or medoids for all clusters}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim/}
}
\references{
Davies, D.L., Bouldin, D.W. (1979), \emph{A cluster separation measure}, IEEE Transactions on Pattern Analysis and Machine Intelligence, vol. 1, no. 2, 224-227. Available at: \doi{10.1109/TPAMI.1979.4766909}.
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, \code{\link{index.C}},
\code{\link{index.S}}, \code{\link{index.H}}, \code{\link{index.Gap}}, \code{\link{index.KL}}
}
\examples{
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
#write.table(res,file="DB_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
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
#write.table(res,file="DB_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="DB", xaxt="n")
axis(1, c(min_nc:max_nc))
}
\keyword{cluster}