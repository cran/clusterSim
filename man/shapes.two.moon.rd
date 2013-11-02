\name{shapes.two.moon}
\alias{shapes.two.moon}
\title{Generation of data set containing two clusters with untypical shapes (similar to waxing and waning crescent moon)}
\description{Generation of data set containing two clusters with untypical shapes (similar to waxing and waning crescent moon). For each point first random radius \code{r} from given interval is generated then random angle \code{alpha} and finally the coordinates of point are calculated as (\code{a+abs(r*cos(alpha))},\code{r*sin(alpha)} for first shape and (\code{-abs(r*cos(alpha))},\code{r*sin(alpha)-b} for second shape}
\usage{shapes.two.moon(numObjects=180,shape1a=-0.4,shape2b=1,shape1rFrom=0.8,
shape1rTo=1.2,shape2rFrom=0.8, shape2rTo=1.2, outputCsv="", outputCsv2="", 
outputColNames=TRUE, outputRowNames=TRUE)}
\arguments{
\item{numObjects}{number of objects in each cluster - positive integer value or vector with length=2},
\item{shape1a}{parameter \code{a} for first shape}
\item{shape2b}{parameter \code{b} for first shape}
\item{shape1rFrom}{minimal value of radius for first shape}
\item{shape1rTo}{maximal value of radius for first shape}
\item{shape2rFrom}{minimal value of radius for second shape}
\item{shape2rTo}{maximal value of radius for second shape}
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
\code{\link{shapes.worms}},\code{\link{shapes.circles2}},\code{\link{shapes.circles3}},\code{\link{shapes.bulls.eye}},\code{\link{shapes.blocks3d}}
}
\examples{
library(clusterSim)
stm<-shapes.two.moon(180)
plot(stm$data,col=rainbow(2)[stm$clusters])
}
\keyword{cluster,dataset}