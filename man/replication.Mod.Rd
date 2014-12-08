\name{replication.Mod}
\alias{replication.Mod}
\title{Modification of replication analysis for cluster validation }
\description{Modification of replication analysis for cluster validation}
\usage{
replication.Mod(x, v="m", u=2, centrotypes="centroids", 
	normalization=NULL, distance=NULL, method="kmeans", 
	S=10, fixedAsample=NULL)
}
\arguments{
\item{x}{data matrix}
\item{v}{type of data: metric ("r" - ratio, "i" - interval, "m" - mixed), nonmetric ("o" - ordinal, "n" - multi-state nominal, "b" - binary)}
\item{u}{number of clusters given arbitrary}
\item{centrotypes}{"centroids" or "medoids"}
\item{normalization}{optional, normalization formulas for metric data (normalization by variable):

for ratio data: "n0" - without normalization, "n6" - (x/sd), "n6a" - (x/mad), "n7" - (x/range), "n8" - (x/max), "n9" - (x/mean),
"n9a" - (x/median), "n10" - (x/sum), "n11" - x/sqrt(SSQ)

for interval or mixed data: "n0" - without normalization, "n1" - (x-mean)/sd, "n2" - (x-median)/mad, "n3" - (x-mean)/range, "n3a" - positional unitization (x-median)/range,
"n4" - (x-min)/range, "n5" - (x-mean)/max[abs(x-mean)], "n5a" - (x-median)/max[abs(x-median)], "n12" - normalization (x - mean)/(sum(x - mean)^2)^0.5,
"n12a" - positional normalization (x - median)/(sum(x - median)^2)^0.5, "n13" - normalization with zero being the central point ((x-midrange)/(range/2))
}
\item{distance}{distance measures

NULL for "kmeans" method (based on data matrix),

for ratio data: "d1" - Manhattan, "d2" - Euclidean, "d3" - Chebychev (max), "d4" - squared Euclidean, "d5" - GDM1, "d6" - Canberra, "d7" - Bray-Curtis

for interval or mixed (ratio & interval) data: "d1", "d2", "d3", "d4", "d5"

for ordinal data: "d8" - GDM2

for multi-state nominal: "d9" - Sokal & Michener

for binary data: "b1" = Jaccard; "b2" = Sokal & Michener; "b3" = Sokal & Sneath (1); "b4" = Rogers & Tanimoto; "b5" = Czekanowski; "b6" = Gower & Legendre (1); "b7" = Ochiai; "b8" = Sokal & Sneath (2); "b9" = Phi of Pearson; "b10" = Gower & Legendre (2)
}
\item{method}{clustering method: "kmeans" (default), "single", "complete", "average", "mcquitty", "median", "centroid", "ward.D", "ward.D2", "pam", "diana"}
\item{S}{the number of simulations used to compute mean corrected Rand index}
\item{fixedAsample}{if NULL \emph{A} sample is generated randomly, otherwise this parameter contains object numbers arbitrarily assigned to \emph{A} sample}
}
\details{
See file \url{../doc/replication.Mod_details.pdf} for further details
}

\value{
\item{A}{3-dimensional array containing data matrices for A sample of objects in each simulation (first dimension represents simulation number, second - object number, third - variable number)}
\item{B}{3-dimensional array containing data matrices for B sample of objects in each simulation (first dimension represents simulation number, second - object number, third - variable number)}
\item{centroid}{3-dimensional array containing centroids of u clusters for A sample of objects in each simulation (first dimension represents simulation number, second - cluster number, third - variable number)}
\item{medoid}{3-dimensional array containing matrices of observations on u representative objects (medoids) for A sample of objects in each simulation (first dimension represents simulation number, second - cluster number, third - variable number)}
\item{clusteringA}{2-dimensional array containing cluster numbers for A sample of objects in each simulation (first dimension represents simulation number, second - object number)}
\item{clusteringB}{2-dimensional array containing cluster numbers for B sample of objects in each simulation (first dimension represents simulation number, second - object number)}
\item{clusteringBB}{2-dimensional array containing cluster numbers for B sample of objects in each simulation according to 4 step of replication analysis procedure (first dimension represents simulation number, second - object number)}
\item{cRand}{value of mean corrected Rand index for S simulations}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{

Breckenridge, J.N. (2000), \emph{Validating cluster analysis: consistent replication and symmetry}, "Multivariate Behavioral Research", 35 (2), 261-285.

Gordon, A.D. (1999), \emph{Classification}, Chapman and Hall/CRC, London.

Hubert, L., Arabie, P. (1985), \emph{Comparing partitions}, "Journal of Classification", no. 1, 193-218.

Milligan, G.W. (1996), \emph{Clustering validation: results and implications for applied analyses}, In P. Arabie, L.J. Hubert, G. de Soete (Eds.), \emph{Clustering and classification}, World Scientific, Singapore, 341-375.

Walesiak, M. (2008), \emph{Ocena stabilnosci wynikow klasyfikacji z wykorzystaniem analizy replikacji}, In: J. Pociecha (Ed.), \emph{Modelowanie i prognozowanie zjawisk spoleczno-gospodarczych}, Wydawnictwo AE, Krakow, 67-72. 


}
\seealso{\code{\link{cluster.Sim}}, \code{\link{hclust}}, \code{\link{kmeans}},  \code{\link{dist}},
\code{\link{dist.BC}}, \code{\link{dist.SM}}, \code{\link{dist.GDM}}, 

\code{\link{data.Normalization}}
}
\examples{
library(clusterSim)
data(data_ratio)
w <- replication.Mod(data_ratio, u=5, S=10)
print(w)

library(clusterSim)
data(data_binary)
replication.Mod(data_binary,"b", u=2, "medoids", NULL,"b1", "pam", fixedAsample=c(1,3,6,7))
}
\keyword{cluster}
\keyword{multivariate}
