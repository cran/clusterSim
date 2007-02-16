\name{replication.Mod}
\alias{replication.Mod}
\title{Modification of replication analysis for cluster validation }
\description{Modification of replication analysis for cluster validation}
\usage{
replication.Mod(x, v="m", u=2, centrotypes="centers", 
	normalization=NULL, distance=NULL, method="kmeans", S=10)
}
\arguments{
\item{x}{data matrix}
\item{v}{type of data: metric ("r" - ratio, "i" - interval, "m" - mixed), nonmetric ("o" - ordinal, "n" - multi-state nominal, "b" - binary)}
\item{u}{number of clusters given arbitrary}
\item{centrotypes}{"centroids" or "medoids"}
\item{normalization}{optional, normalization formulas for metric data:

for ratio data: "n6" - (x/sd), "n7" - (x/range), "n8" - (x/max), "n9" - (x/mean), "n10" - (x/sum), "n11" - x/sqrt(SSQ)

for interval or mixed data: "n1" - (x-mean)/sd, "n2" - (x-Me)/MAD, "n3" - (x-mean)/range, "n4" - (x-min)/range, "n5" - (x-mean)/max[abs(x-mean)]}
\item{distance}{distance measures

NULL for "kmeans" method (based on data matrix),

for ratio data: "d1" - Manhattan, "d2" - Euclidean, "d3" - Chebychev (max), "d4" - squared Euclidean, "d5" - GDM1, "d6" - Canberra, "d7" - Bray-Curtis

for interval or mixed (ratio & interval) data: "d1", "d2", "d3", "d4", "d5"

for ordinal data: "d8" - GDM2

for multi-state nominal: "d9" - Sokal & Michener

for binary data: "b1" = Jaccard; "b2" = Sokal & Michener; "b3" = Sokal & Sneath (1); "b4" = Rogers & Tanimoto; "b5" = Czekanowski; "b6" = Gower & Legendre (1); "b7" = Ochiai; "b8" = Sokal & Sneath (2); "b9" = Phi of Pearson; "b10" = Gower & Legendre (2)
}
\item{method}{clustering method: "kmeans" (default), "single", "complete", "average", "mcquitty", "median", "centroid", "ward", "pam"}
\item{S}{the number of simulations used to compute mean corrected Rand index}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\replication.Mod\_details.pdf for further details
}

\value{
\item{A}{3-dimensional array of A samples (first dimension represent iteration step, second - object number, third - variable number)}
\item{B}{3-dimensional array of B samples (first dimension represent iteration step, second - object number, third - variable number)}
\item{centroid}{Array of matrices of class centroids for sample A (first dimension represent iteration step)}
\item{medoid}{Array of matrix of observations on u representative objects (medoids) for sample A (first dimension represent iteration step)}
\item{clusteringA}{Array of \eqn{A=\{A_1,A_2,...,A_u\}} (first dimension represents iteration step, second - cluster number for each object)}
\item{clusteringB}{Array of \eqn{B=\{B_1,B_2,...,B_u\}} (first dimension represents iteration step, second - cluster number for each object)}
\item{clusteringBB}{Array of \eqn{BB=\{BB_1,BB_2,...,BB_u\}} (first dimension represents iteration step, second - cluster number for each object)}
\item{cRand}{value of mean corrected Rand index for S simulations}
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{

Breckenridge, J.N. (2000), \emph{Validating cluster analysis: consistent replication and symmetry}, "Multivariate Behavioral Research", 35 (2), 261-285.

Gordon, A.D. (1999), \emph{Classification}, Chapman and Hall/CRC, London.

Hubert, L., Arabie, P. (1985), \emph{Comparing partitions}, "Journal of Classification", no. 1, 193-218.

Milligan, G.W. (1996), \emph{Clustering validation: results and implications for applied analyses}, In P. Arabie, L.J. Hubert, G. de Soete (Eds.), \emph{Clustering and classification}, World Scientific, Singapore, 341-375.

Walesiak, M. (2007), \emph{Ocena stabilnosci wynikow klasyfikacji z wykorzystaniem analizy replikacji}, Prace Naukowe AE we Wroclawiu (in preparation).

}
\seealso{\code{\link{cluster.Sim}}, \code{\link{hclust}}, \code{\link{kmeans}},  \code{\link{dist}},
\code{\link{dist.BC}}, \code{\link{dist.SM}}, \code{\link{dist.GDM}}, \code{\link{data.Normalization}}
}
\examples{
library(clusterSim)
data(data_ratio)
w<-replication.Mod(data_ratio,u=5,S=10)
print(w)
}
\keyword{cluster}
\keyword{multivariate}
