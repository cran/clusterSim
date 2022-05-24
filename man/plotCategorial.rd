\name{plotCategorial}
\alias{plotCategorial}
\title{Plot categorial data on a scatterplot matrix}
\description{Plot categorial data on a scatterplot matrix (optionally with clusters)}
\usage{plotCategorial(x, pairsofVar=NULL, cl=NULL, clColors=NULL,...)}
\arguments{
\item{x}{data matrix (rows correspond to observations and columns correspond to variables)}
\item{pairsofVar}{pairs of variables - all variables (\code{pairsofVar=NULL}) or selected variables, e.g. \code{pairsofVar=c(1,3,4)}}
\item{cl}{cluster membership vector}
\item{clColors}{The colors of clusters. The colors are given arbitrary (\code{clColors=TRUE}) or by hand, e.g. \code{clColors=c("red","blue","green")}. The number of colors equals the number of clusters}
\item{...}{Arguments to be passed to methods, such as graphical parameters (see \code{\link{par}}).} 
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim/}
}
\seealso{
\code{\link{colors}}, \code{\link{pairs}}
}
\examples{
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

}
\keyword{hplot}