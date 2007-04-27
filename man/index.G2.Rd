\name{index.G2}
\alias{index.G2}
\title{Calculates G2 internal cluster quality index}
\description{Calculates G2 internal cluster quality index - Baker & Hubert adaptation of Goodman & Kruskal's Gamma statistic}
\usage{index.G2(d,cl)}
\arguments{
\item{d}{'dist' object}
\item{cl}{A vector of integers indicating the cluster to which each object is allocated}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexG2\_details.pdf for further details
}
\value{
calculated G2 index
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{
Everitt, B.S., Landau, E., Leese, M. (2001), \emph{Cluster analysis}, Arnold, London, p. 104.

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, p. 339.

Gordon, A.D. (1999), \emph{Classification}, Chapman & Hall/CRC, London, p. 62.

Hubert, L. (1974), \emph{Approximate evaluation technique for the single-link and complete-link hierarchical clustering procedures}, "Journal of the American Statistical Association", vol. 69, no. 347, 698-704.

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, pp. 159-179. 

}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G3}}, \code{\link{index.S}}, \code{\link{index.H}}, \code{\link{index.KL}}, \code{\link{index.Gap}}
}
\examples{
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.G2(d,c$clustering)
print(icq)
}
\keyword{cluster}
