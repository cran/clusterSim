\name{HINoV.Mod}
\alias{HINoV.Mod}
\title{Modification of Carmone, Kara \& Maxwell Heuristic Identification of Noisy Variables (HINoV) method}
\description{Modification of Heuristic Identification of Noisy Variables (HINoV) method}
\usage{
HINoV.Mod (x, type="metric", s = 2, u, distance=NULL, 
	method = "kmeans", Index ="cRAND")
}
\arguments{
\item{x}{data matrix}
\item{type}{"metric" (default) - all variables are metric (ratio, interval),
"nonmetric" - all variables are nonmetric (ordinal, nominal) or
vector containing for each variable value "m"(metric) or "n"(nonmetric) for mixed variables (metric and nonmetric), e.g. type=c("m", "n", "n", "m")
}
\item{s}{for metric data only: 1 - ratio data, 2 - interval or mixed (ratio & interval) data}
\item{u}{number of clusters (for metric data only)}
\item{distance}{NULL for kmeans method (based on data matrix) and nonmetric data

for ratio data: "d1" - Manhattan, "d2" - Euclidean, "d3" - Chebychev (max), "d4" - squared Euclidean, "d5" - GDM1, "d6" - Canberra, "d7" - Bray-Curtis

for interval or mixed (ratio & interval) data: "d1", "d2", "d3", "d4", "d5"}
\item{method}{NULL for nonmetric data

clustering method: "kmeans" (default) , "single", "ward", "complete", "average", "mcquitty", "median", "centroid", "pam"}
\item{Index}{"cRAND" - corrected Rand index (default); "RAND" - Rand index}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\HINoVMod\_details.pdf for further details
}
\value{
\item{parim}{\emph{m} x \emph{m} symmetric matrix (\emph{m} - number of variables). Matrix contains pairwise corrected Rand (Rand) indices for partitions formed by the \emph{j}-th variable with partitions formed by the \emph{l}-th variable}
\item{topri}{sum of rows of \code{parim}}
\item{stopri}{ranked values of \code{topri} in decreasing order}
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{
Carmone, F.J., Kara, A., Maxwell, S. (1999), \emph{HINoV: a new method to improve market segment definition by identifying noisy variables}, "Journal of Marketing Research", November, vol. 36, 501-509.

Hubert, L.J., Arabie, P. (1985), \emph{Comparing partitions}, "Journal of Classification", no. 1, 193-218.

Rand, W.M. (1971), \emph{Objective criteria for the evaluation of clustering methods}, "Journal of the American Statistical Association", no. 336, 846-850.

Walesiak, M. (2007), \emph{Wybor zmiennych w zagadnieniu klasyfikacji - podejscia, problemy, metody}, A., Zelias  (Ed.), Wklad statystyki i ekonometrii w rozwoj badan ekonomicznych, KSiE PAN, Krakow (in press).
}
\seealso{
\code{\link{hclust}}, \code{\link{kmeans}}, \code{\link{dist}}, \code{\link{dist.GDM}}, \code{\link{dist.BC}}, \code{\link{dist.SM}}, 
\code{\link{cluster.Sim}}
}
\examples{
#for metric data
library(clusterSim)
data(data_ratio)
r1<- HINoV.Mod(data_ratio, type="metric", s=1, 4, method="kmeans",
     Index="cRAND")
print(r1$stopri)
plot(r1$stopri[,2],xlab="Variable number", ylab="topri", xaxt="n")
axis(1,at=c(1:max(r1$stopri[,1])),labels=r1$stopri[,1])

#for nonmetric data
library(clusterSim)
data(data_nominal)
r2<- HINoV.Mod (data_nominal, type="nonmetric", Index = "cRAND")
print(r2$stopri)
plot(r2$stopri[,2], xlab="Variable number", ylab="topri", xaxt="n")
axis(1,at=c(1:max(r2$stopri[,1])),labels=r2$stopri[,1])

#for mixed data
library(clusterSim)
data(data_mixed)
r3<- HINoV.Mod(data_mixed, type=c("m","n","m","n"), s=2, 3, distance="d1",
     method="complete", Index="cRAND")
print(r3$stopri)
plot(r3$stopri[,2], xlab="Variable number", ylab="topri", xaxt="n")
axis(1,at=c(1:max(r3$stopri[,1])),labels=r3$stopri[,1])

}
\keyword{cluster}
