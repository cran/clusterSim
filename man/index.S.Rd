\name{index.S}
\alias{index.S}
\title{Calculates Rousseeuw's Silhouette internal cluster quality index}
\description{Calculates Rousseeuw's Silhouette internal cluster quality index}
\usage{index.S(d,cl)}
\arguments{
\item{d}{'dist' object}
\item{cl}{A vector of integers indicating the cluster to which each object is allocated}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexS\_details.pdf for further details
}
\value{
calculated Silhouette index
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, pp. 342-343, erratum.

Kaufman, L., Rousseeuw, P.J. (1990), \emph{Finding groups in data: an introduction to cluster analysis}, Wiley, New York, pp. 83-88.
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, 
\code{\link{index.KL}}, \code{\link{index.H}}, \code{\link{index.Gap}}, \code{\link{index.DB}}
}
\examples{
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.S(d,c$clustering)
print(icq)
}
\keyword{cluster}
