\name{data_interval}
\alias{data_interval}
\docType{data}
\title{Interval data}
\description{Artificially generated interval data}
\format{data.frame: 75 objects, 5 variables, 5-class structure}
\source{Artificially generated data}
\examples{
library(clusterSim)
data(data_interval)
cluster.Sim(data_interval, 2, 2, 3, "G1", outputHtml="results2")
}
\keyword{datasets}