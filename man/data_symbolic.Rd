\name{data_symbolic}
\alias{data_symbolic}
\docType{data}
\title{Symbolic interval data}
\description{Artificially generated symbolic interval data}
\format{3-dimensional array: 125 objects, 6 variables, third dimension represents  begining and end of interval, 5-class structure}
\source{Artificially generated data}
\examples{
library(clusterSim)
data(data_symbolic)
r<- HINoV.Symbolic(data_symbolic, u=5)
print(r$stopri)
plot(r$stopri[,2], xlab="Variable number", ylab="topri", xaxt="n")
axis(1,at=c(1:max(r$stopri[,1])),labels=r$stopri[,1])
}
\keyword{datasets}