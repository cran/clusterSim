\name{index.G1}
\alias{index.G1}
\title{Calculates Calinski-Harabasz pseudo F-statistic}
\description{Calculates Calinski-Harabasz pseudo F-statistic}
\usage{index.G1 (x,cl)}
\arguments{
\item{x}{data}
\item{cl}{A vector of integers indicating the cluster to which each object is allocated}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexG1\_details.pdf for further details
}
\value{
Calinski-Harabasz pseudo F-statistic
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{

Calinski, R.B., Harabasz, J. (1974), \emph{A dendrite method for cluster analysis}, "Communications in Statistics", vol. 3, 1-27.

Everitt, B.S., Landau, E., Leese, M. (2001), \emph{Cluster analysis}, Arnold, London, p. 103.

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, p. 338.

Gordon, A.D. (1999), \emph{Classification}, Chapman & Hall/CRC, London, p. 62.

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, pp. 159-179.

}
\seealso{
\code{\link{index.G2}},\code{\link{index.G3}},\code{\link{index.S}}, 
\code{\link{index.H}},\code{\link{index.KL}},\code{\link{index.Gap}}
}
\examples{
library(clusterSim)
data(data_ratio)
c<- pam(data_ratio,10)
index.G1(data_ratio,c$clustering)
}
\keyword{cluster}

