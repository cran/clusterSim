\name{dist.BC}
\alias{dist.BC}
\title{Calculates Bray-Curtis  distance measure for ratio data}
\description{Calculates Bray-Curtis distance measure for ratio data}
\usage{dist.BC (x)}
\arguments{
\item{x}{matrix or dataset}
}
\details{
See file $R_HOME\\library\\clusterSim\\pdf\\distBC_details.pdf for further details
}
\value{
object with calculated distance
}
\references{

Cormack, R.M. (1971), \emph{A review of classification (with discussion)}, "Journal of the Royal Statistical Society", ser. A, part 3, 321-367.

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, p. 41.
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland
}
\seealso{
\code{\link{dist.GDM}}, \code{\link{dist.SM}}, \code{\link{dist}}
}
\examples{
library(clusterSim)
sampleData <- cbind(c(2,3,5),c(4,5,6),c(5,3,4))
d <- dist.BC(sampleData)
}
\keyword{cluster}
