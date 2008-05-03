\name{dist.SM}
\alias{dist.SM}
\title{Calculates Sokal-Michener distance measure for nominal variables}
\description{Calculates Sokal-Michener distance measure for nominal variables}
\usage{dist.SM(x)}
\arguments{
\item{x}{matrix or data set}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\distSM\_details.pdf for further details
}
\value{
object with calculated distance
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, p. 43.

Kaufman, L., Rousseeuw, P.J. (1990), \emph{Finding groups in data: an introduction to cluster analysis}, Wiley, New York, p. 28.

}
\seealso{
\code{\link{dist.GDM}}, \code{\link{dist.BC}}, \code{\link{dist}}
}
\examples{
library(clusterSim)
data(data_nominal)
d <- dist.SM(data_nominal)
}
\keyword{cluster}