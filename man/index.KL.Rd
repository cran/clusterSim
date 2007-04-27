\name{index.KL}
\alias{index.KL}
\title{Calculates Krzanowski-Lai index}
\description{Calculates Krzanowski-Lai index}
\usage{index.KL (x,clall)}
\arguments{
\item{x}{data}
\item{clall}{Three vectors of integers indicating the cluster to which each object is allocated in partition of n objects into u-1, u, and u+1 clusters}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexKL\_details.pdf for further details
}
\value{
Krzanowski-Lai index
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{

Krzanowski, W.J., Lai, Y.T. (1988), \emph{A criterion for determining the number of groups in a data set using sum of squares clustering}, "Biometrics", 44, 23-34.

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, pp. 159-179.

Tibshirani, R., Walther, G., Hastie, T. (2001), \emph{Estimating the number of clusters in a data set via the gap statistic}, "Journal of the Royal Statistical Society", ser. B, vol. 63, part 2, 411-423.

}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, 
\code{\link{index.S}}, \code{\link{index.H}}, \code{\link{index.Gap}}
}
\examples{
library(clusterSim)
data(data_ratio)
cl1<-pam(data_ratio,4)
cl2<-pam(data_ratio,5)
cl3<-pam(data_ratio,6)
clall<-cbind(cl1$clustering,cl2$clustering,cl3$clustering)
index.KL(data_ratio,clall)}
\keyword{cluster}

