\name{dist.SM}
\alias{dist.SM}
\title{Calculates Sokal-Michener distance measure for nominal variables}
\description{Calculates Sokal-Michener distance measure for nominal variables}
\usage{dist.SM(x)}
\arguments{
\item{x}{matrix or data set}
}
\details{
See file $R_HOME\\library\\clusterSim\\pdf\\distSM_details.pdf for further details
}
\value{
object with calculated distance
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland
}
\references{

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, p. 43.

Kaufman, L., Rousseeuw, P.J. (1990), \emph{Finding groups in data: an introduction to cluster analysis}, Wiley, New York, p. 28. ISBN: 978-0-471-73578-6.

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
