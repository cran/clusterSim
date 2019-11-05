\name{shapes.worms}
\alias{shapes.worms}
\title{Generation of data set containing two clusters with untypical parabolic shapes (worms)}
\description{Generation of data set containing two clusters with untypical parabolic shapes (first is given by y=x^2, second by y=-(x-a)^2+b with distortion from <-tol,+tol>)}
\usage{shapes.worms(numObjects=180,shape1x1=-2,shape1x2=2,shape2x1=-0.5,
shape2x2=2.5,shape2a=1.5,shape2b=5.5,tol=0.1,outputCsv="", outputCsv2="", 
outputColNames=TRUE, outputRowNames=TRUE)}
\arguments{
\item{numObjects}{number of objects in each cluster - positive integer value or vector with length=2}
\item{shape1x1}{starting value on abscissa axis for shape 1}
\item{shape1x2}{end value on abscissa axis for shape 1}
\item{shape2x1}{starting value on abscissa axis for shape 2}
\item{shape2x2}{end value on abscissa axis for shape 2}
\item{shape2a}{parameter \code{a} of shape 2}
\item{shape2b}{parameter \code{b} of shape 2}
\item{tol}{tolerance - each generated point is randomized by adding runif(1,0,tol)}
\item{outputCsv}{optional, name of csv file with generated data (first column contains id, second - number of cluster and others - data)}
\item{outputCsv2}{optional, name of csv (a comma as decimal point and a semicolon as field separator) file with generated data (first column contains id, second - number of cluster and others - data)}
\item{outputColNames}{\code{outputColNames=TRUE} indicates that output file (given by \code{outputCsv} and \code{outputCsv2} parameters) contains first row with column names}
\item{outputRowNames}{\code{outputRowNames=TRUE} indicates that output file (given by \code{outputCsv} and \code{outputCsv2} parameters) contains a vector of row names}}
\value{
\item{clusters}{cluster number for each object} 
\item{data}{generated data - matrix with objects in rows and variables in columns}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}

\seealso{
\code{\link{shapes.worms}},\code{\link{shapes.circles2}},\code{\link{shapes.circles3}},\code{\link{shapes.bulls.eye}},\code{\link{shapes.two.moon}},\code{\link{shapes.blocks3d}}
}
\examples{
library(clusterSim)
sw<-shapes.worms(180)
plot(sw$data,col=rainbow(2)[sw$clusters])
}
\keyword{cluster}
\keyword{dataset}