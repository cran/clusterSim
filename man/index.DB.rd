\name{index.DB}
\alias{index.DB}
\title{Calculates Davies-Bouldin's index}
\description{Calculates Davies-Bouldin's cluster separation measure}
\usage{index.DB(x, cl, centrotypes="centroids", p=2, q=2)}
\arguments{
\item{x}{data}
\item{cl}{vector of integers indicating the cluster to which each object is allocated}
\item{centrotypes}{"centroids" or "medoids"}
\item{p}{the power of the Minkowski distance between centroids or medoids of clusters: p=1 - Manhattan distance; p=2 - Euclidean distance}
\item{q}{the power of dispersion measure of a cluster: q=1 - the average distance of objects in the r-th cluster to the centroid or medoid
of the r-th cluster; q=2 - the standard deviation of the distance of objects in the r-th cluster to the centroid or medoid of the r-th cluster}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexDB\_details.pdf for further details
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
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{
Davies, D.L., Bouldin, D.W. (1979), \emph{A cluster separation measure}, IEEE Transactions on Pattern Analysis and Machine Intelligence, vol. 1, no. 2, 224-227.

}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, 
\code{\link{index.S}}, \code{\link{index.H}}, \code{\link{index.Gap}}, \code{\link{index.KL}}
}
\examples{
#Example 1
library(clusterSim)
data(data_ratio)
cl1 <- pam(data_ratio, 4)
print(index.DB(data_ratio, cl1$clustering, centrotypes="medoids"))

#Example 2
library(clusterSim)
data(data_ratio)
cl2 <- pam(data_ratio, 5)
print(index.DB(data_ratio, cl2$clustering, centrotypes="centroids"))
}
\keyword{cluster}