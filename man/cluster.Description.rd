\name{cluster.Description}
\alias{cluster.Description}
\title{Descriptive statistics calculated separately for each cluster and variable}
\description{Descriptive statistics calculated separately for each cluster and variable: arithmetic mean and standard deviation, median and median absolute deviation, mode }
\usage{
cluster.Description(x, cl, sdType="sample")
}
\arguments{
\item{x}{matrix or dataset}
\item{cl}{a vector of integers indicating the cluster to which each object is allocated}
\item{sdType}{type of standard deviation: for "sample" (n-1) or for "population" (n)}
}
\value{
Three-dimensional array: 

First dimension contains cluster number 

Second dimension contains original coordinate (variable) number from matrix or data set 

Third dimension contains number from 1 to 5: 

1 - arithmetic mean 

2 - standard deviation 

3 - median 

4 - median absolute deviation (mad) 

5 - mode (value of the variable which has the largest observed frequency. This formula is applicable for nominal and ordinal data only). 

For example: 

desc<-cluster.Description(x,cl) 

desc[2,4,2] - standard deviation of fourth coordinate of second cluster 

desc[3,1,5] - mode of first coordinate (variable) of third cluster 

desc[1,,] - all statistics for all dimensions (variables) of first cluster 

desc[,,3] - medians of all dimensions (variables) for each cluster
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\seealso{
\code{\link{cluster.Sim}}, \code{\link{mean}}, \code{\link{sd}}, \code{\link{median}}, \code{\link{mad}}
}
\examples{
library(clusterSim)
data(data_ratio)
cl <- pam(data_ratio,5)
desc <- cluster.Description(data_ratio,cl$cluster)
print(desc)
}
\keyword{cluster}