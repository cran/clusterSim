\name{dist.Symbolic}
\alias{dist.Symbolic}
\title{Calculates distance between interval-valued symbolic data}
\description{Calculates distance between interval-valued symbolic data for four distance types}
\usage{dist.Symbolic(data,type="U_2",gamma=0.5,power=2)}
\arguments{
\item{data}{symbolic data}
\item{type}{type of distance used for symbolic interval-valued data

U_2 - Ichino and Yaguchi distance

M - distance between points given by means of intervals (for interval-values variables), 

H - Hausdorff distance, 

S - sum of distances between all corresponding vertices of hyperrectangles 
given by symbolic objects with interval-valued variables
}
\item{gamma}{parameter for calculating Ichino and Yaguchi distance}
\item{power}{parameter for calculating distance: Ichino and Yaguchi distance, Hausdorff distance}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{

Billard, L., Diday, E. (2006), \emph{Symbolic data analysis. Conceptual statistics and data mining}, Wiley, Chichester. ISBN: 978-0-470-09016-9.

Ichino, M., Yaguchi, H. (1994), \emph{Generalized Minkowski metrics for mixed feature type data analysis}, "IEEE Transactions on Systems Man and Cybernetics", Vol. 24, Issue 4, 698-708. Http://dx.doi.org/10.1109/21.286391.
}
\seealso{
\code{symbolicDA::dist.SDA} 
}
\examples{
library(clusterSim)
dataSymbolic<-cluster.Gen(numObjects=10,model=5,dataType="s")$data
print(dist.Symbolic(dataSymbolic))
}
\keyword{interval-valued data}
\keyword{symbolic data analysis}
\keyword{distances for interval-valued data}
