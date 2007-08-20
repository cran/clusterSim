\name{plotInterval}
\alias{plotInterval}
\title{Plot symbolic interval-valued data on a scatterplot matrix}
\description{Plot symbolic interval-valued data on a scatterplot matrix (optionally with clusters)}
\usage{plotInterval(x, pairsofsVar=NULL, cl=NULL, clColors=NULL,...)}
\arguments{
\item{x}{symbolic interval-valued data}
\item{pairsofsVar}{pairs of symbolic interval variables - all variables (\code{pairsofsVar=NULL}) or selected variables, e.g. \code{pairsofsVar=c(1,3,4)}}
\item{cl}{cluster membership vector}
\item{clColors}{The colors of clusters. The colors are given arbitrary (\code{clColors=TRUE}) or by hand, e.g. \code{clColors=c("red","blue","green")}. The number of colors equals the number of clusters}
\item{...}{Arguments to be passed to methods, such as graphical parameters (see \code{\link{par}}).} 
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\seealso{
\code{\link{plotCategorial}},\code{\link{plotCategorial3d}}, \code{\link{colors}}, \code{\link{pairs}}
}
\examples{

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

}
\keyword{hplot}


