\name{shapes.circles3}
\alias{shapes.circles3}
\title{Generation of data set containing three clusters with untypical ring shapes (circles)}
\description{Generation of data set containing three clusters with untypical ring shapes. For each point first random radius \code{r} from given interval is generated then random angle \code{alpha} and finally the coordinates of point are calculated as (\code{r*cos(alpha)},\code{r*sin(alpha)})}
\usage{shapes.circles3(numObjects=180,shape1rFrom=0.15,shape1rTo=0.3,
shape2rFrom=0.55,shape2rTo=0.7,shape3rFrom=1.15,shape3rTo=1.3,
outputCsv="", outputCsv2="", outputColNames=TRUE, outputRowNames=TRUE)}
\arguments{
\item{numObjects}{number of objects in each cluster - positive integer value or vector with length=3},
\item{shape1rFrom}{minimal value of radius for first ring}
\item{shape1rTo}{maximal value of radius for first ring}
\item{shape2rFrom}{minimal value of radius for second ring}
\item{shape2rTo}{maximal value of radius for second ring}
\item{shape3rFrom}{minimal value of radius for third ring}
\item{shape3rTo}{maximal value of radius for third ring}
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
\code{\link{shapes.worms}},\code{\link{shapes.circles2}},\code{\link{shapes.bulls.eye}},\code{\link{shapes.two.moon}},\code{\link{shapes.blocks3d}}
}
\examples{
#Example1
library(clusterSim)
sc3a<-shapes.circles3(180)
plot(sc3a$data,col=rainbow(3)[sc3a$clusters])

#Example2
library(clusterSim)
sc3b<-shapes.circles3(numObjects=c(120,180,240))
plot(sc3b$data,col=rainbow(3)[sc3b$clusters])
}
\keyword{cluster}
\keyword{dataset}