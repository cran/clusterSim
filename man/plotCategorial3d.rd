\name{plotCategorial3d}
\alias{plotCategorial3d}
\title{Plot categorial data with three-dimensional plots}
\description{Plot categorial data with three-dimensional plots (optionally with clusters)}
\usage{plotCategorial3d(x, tripleofVar=c(1,2,3), cl=NULL, clColors=NULL,...)}
\arguments{
\item{x}{data matrix (rows correspond to observations and columns correspond to variables)}
\item{tripleofVar}{triple of variables - vector of the number of variables, e.g. \code{tripleofVar = c(1, 3, 4)}}
\item{cl}{cluster membership vector}
\item{clColors}{The colors of clusters. The colors are given arbitrary (\code{clColors=TRUE}) or by hand, e.g. \code{clColors=c("red","blue","green")}. The number of colors equals the number of clusters}
\item{...}{Arguments to be passed to methods, such as graphical parameters (see \code{\link{par}}).} 
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\seealso{
\code{\link{plotCategorial}},\code{\link{colors}}
}
\examples{


# These examples do not run on Mac_OS-X. We're working to fix them
# They run quite well on Windows and Linux in meantime

# Example 1

#library(clusterSim)
#data(data_ordinal)
#plotCategorial3d(data_ordinal, tripleofVar=c(1,3,9), cl=NULL, 
#clColors = NULL)

# Example 2

#library(clusterSim)
#grnd <- cluster.Gen(50,model=5,dataType="o",numCategories=5)
#plotCategorial3d(grnd$data, tripleofVar=c(1,2,3), cl=grnd$clusters, 
#clColors = TRUE)

# Example 3

#library(clusterSim)
#grnd<-cluster.Gen(50,model=4,dataType="o",numCategories=7, numNoisyVar=2)
#plotCategorial3d(grnd$data, tripleofVar=c(1,2,4), cl=grnd$clusters, 
#clColors=c("red","blue","green"))

}
\keyword{hplot}