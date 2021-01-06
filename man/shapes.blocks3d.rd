\name{shapes.blocks3d}
\alias{shapes.blocks3d}
\title{Generation of data set containing two clusters with untypical shapes (cube divided into two parts by main diagonal plane)}
\description{Generation of data set containing two clusters with untypical shapes (cube starting at point (0,0,0) divided into two parts by main diagonal plane)}
\usage{shapes.blocks3d(numObjects=180,shapesUnitSize=0.5, shape2coordinateX=1.2,
shape2coordinateY=1.2,shape2coordinateZ=1.2, outputCsv="", outputCsv2="", 
outputColNames=TRUE, outputRowNames=TRUE)}
\arguments{
\item{numObjects}{number of objects in each cluster - positive integer value or vector with length=2}
\item{shapesUnitSize}{length of one unit for shape (maximal heigth, width and depth of shape is 2*shapesUnitSize)}
\item{shape2coordinateX}{maximal value for second shape in first (\code{X}) dimension}
\item{shape2coordinateY}{maximal value for second shape in second (\code{Y}) dimension}
\item{shape2coordinateZ}{maximal value for second shape in third (\code{Z}) dimension}
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

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim/}
}
\seealso{
\code{\link{shapes.worms}},\code{\link{shapes.circles2}},\code{\link{shapes.circles3}},\code{\link{shapes.bulls.eye}},\code{\link{shapes.two.moon}}
}
\examples{
library(clusterSim)
library(rgl)
sb3d<-shapes.blocks3d(300,1,3,3,3)
plot3d(sb3d$data,col=rainbow(2)[sb3d$clusters])
}
\keyword{cluster}
\keyword{dataset}