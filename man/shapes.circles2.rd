\name{shapes.circles2}
\alias{shapes.circles2}
\alias{shapes.bulls.eye}
\title{Generation of data set containing two clusters with untypical ring shapes (circles)}
\description{Generation of data set containing two clusters with untypical ring shapes. For each point first random radius \code{r} from given interval is generated then random angle \code{alpha} and finally the coordinates of point are calculated as (\code{r*cos(alpha)},\code{r*sin(alpha)}). For bull's eye data set second shape is filled circle (\code{r} starts from 0)}
\usage{shapes.circles2(numObjects=180, shape1rFrom=0.75,shape1rTo=0.9,shape2rFrom=0.35,
shape2rTo=0.5,outputCsv="", outputCsv2="", outputColNames=TRUE,  outputRowNames=TRUE)
shapes.bulls.eye(numObjects=180, shape1rFrom=0.75,shape1rTo=0.95,shape2rTo=0.45,
outputCsv="", outputCsv2="", outputColNames=TRUE, outputRowNames=TRUE)}
\arguments{
\item{numObjects}{number of objects in each cluster - positive integer value or vector with length=2},
\item{shape1rFrom}{minimal value of radius for first ring}
\item{shape1rTo}{maximal value of radius for first ring}
\item{shape2rFrom}{minimal value of radius for second ring}
\item{shape2rTo}{maximal value of radius for second ring}
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
\code{\link{shapes.worms}},\code{\link{shapes.circles3}},\code{\link{shapes.bulls.eye}},\code{\link{shapes.two.moon}},\code{\link{shapes.blocks3d}}
}
\examples{
#Example1
library(clusterSim)
sc2<-shapes.circles2(180)
plot(sc2$data,col=rainbow(2)[sc2$clusters])

#Example2
library(clusterSim)
sbe<-shapes.bulls.eye(numObjects=c(120,60))
plot(sbe$data,col=rainbow(2)[sbe$clusters])
}
\keyword{cluster}
\keyword{dataset}