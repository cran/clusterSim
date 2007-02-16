\name{data_nominal}
\alias{data_nominal}
\docType{data}
\title{Nominal data}
\description{Artificial nominal data}
\format{data.frame: 26 objects, 12 variables}
\source{Artificial data}
\examples{
library(clusterSim)
data(data_nominal)
cluster.Sim(data_nominal, p=4, 2, 5, icq="G3",
outputHtml="results4", methods=c("m2","m3","m5"))
}
\keyword{datasets}