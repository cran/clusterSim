\name{dist.Symbolic}
\alias{dist.Symbolic}
\title{Calculates distance between symbolic interval-valued data}
\description{Calculates distance between symbolic interval-valued data for four distance types}
\usage{dist.Symbolic(data,type="U_2",gamma=0.5,power=2)}
\arguments{
\item{data}{symbolic data}
\item{type}{type of distance used for symbolic interval-valued data

U\_2 - Ichino and Yaguchi distance

M - distance between points given by means of intervals (for interval-values variables)

H - Hausdorff distance 

S - sum of distances between all corresponding vertices of hyperrectangles given by symbolic objects with interval-valued variables
}
\item{gamma}{parameter for calculating Ichino and Yaguchi distance - see file \$R\_HOME\\library\\clusterSim\\pdf\\distSymbolic\_details.pdf }
\item{power}{parameter (q) for calculating Ichino and Yaguchi distance - see file \$R\_HOME\\library\\clusterSim\\pdf\\distSymbolic\_details.pdf }
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\distSymbolic\_details.pdf for further details
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{

Billard, L., Diday, E. (2006): \emph{Symbolic data analysis. Conceptual statistics and data mining}, Wiley, Chichester.

}
\seealso{
\code{\link{dist.SM}}
}
\examples{
}
\keyword{cluster}