\name{index.H}
\alias{index.H}
\title{Calculates Hartigan index}
\description{Calculates Hartigan index}
\usage{index.H (x,clall)}
\arguments{
\item{x}{data}
\item{clall}{Two vectors of integers indicating the cluster to which each object is allocated in partition of n objects into u and u+1 clusters}
}
\value{
Hartigan index
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexH\_details.pdf for further details
}
\references{

Hartigan, J. (1975), \emph{Clustering algorithms}, Wiley, New York.

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, pp. 159-179.

Tibshirani, R., Walther, G., Hastie, T. (2001), \emph{Estimating the number of clusters in a data set via the gap statistic}, "Journal of the Royal Statistical Society", ser. B, vol. 63, part 2, 411-423.

}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, \code{\link{index.S}}, \code{\link{index.KL}}, \code{\link{index.Gap}}
}
\examples{
library(clusterSim)
data(data_ratio)
cl1<-pam(data_ratio,4)
cl2<-pam(data_ratio,5)
clall<-cbind(cl1$clustering,cl2$clustering)
index.H(data_ratio,clall)
}
\keyword{cluster}

