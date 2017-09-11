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

clustering method: "kmeans" (default) , "single", "ward.D", "ward.D2", "complete", "average", "mcquitty", "median", "centroid", "pam"}
\item{Index}{"cRAND" - corrected Rand index (default); "RAND" - Rand index}
}
\details{
See file \url{../doc/HINoVMod_details.pdf} for further details
}
\value{
\item{parim}{\emph{m} x \emph{m} symmetric matrix (\emph{m} - number of variables). Matrix contains pairwise corrected Rand (Rand) indices for partitions formed by the \emph{j}-th variable with partitions formed by the \emph{l}-th variable}
\item{topri}{sum of rows of \code{parim}}
\item{stopri}{ranked values of \code{topri} in decreasing order}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{
Carmone, F.J., Kara, A., Maxwell, S. (1999), \emph{HINoV: a new method to improve market segment definition by identifying noisy variables}, "Journal of Marketing Research", November, vol. 36, 501-509. Available at: \url{http://dx.doi.org/10.2307/3152003}.

Hubert, L.J., Arabie, P. (1985), \emph{Comparing partitions}, "Journal of Classification", no. 1, 193-218. Available at: \url{http://dx.doi.org/10.1007\%2FBF01908075}.

Rand, W.M. (1971), \emph{Objective criteria for the evaluation of clustering methods}, "Journal of the American Statistical Association", no. 336, 846-850. Available at: \url{http://dx.doi.org/10.1080/01621459.1971.10482356}.

Walesiak, M. (2005), \emph{Variable selection for cluster analysis - approaches, problems, methods}, Plenary Session of the Committee on Statistics and Econometrics of the Polish Academy of Sciences, 15 March, Wroclaw.

Walesiak, M., Dudek, A. (2008), \emph{Identification of noisy variables for nonmetric and symbolic data in cluster analysis}, In: C. Preisach, H. Burkhardt, L. Schmidt-Thieme, R. Decker (Eds.), Data analysis, machine learning and applications, Springer-Verlag, Berlin, Heidelberg, 85-92. Available at: \url{http://dx.doi.org/10.1007/978-3-540-78246-9_11}
}
\seealso{
\code{\link{hclust}}, \code{\link{kmeans}}, \code{\link{dist}}, \code{\link{dist.GDM}}, \code{\link{dist.BC}}, \code{\link{dist.SM}}, 
\code{\link{cluster.Sim}}
}
\examples{
# for metric data
library(clusterSim)
data(data_ratio)
r1<- HINoV.Mod(data_ratio, type="metric", s=1, 4, method="kmeans",
     Index="cRAND")
print(r1$stopri)
plot(r1$stopri[,2],xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r1$stopri[,1])),labels=r1$stopri[,1])

# for nonmetric data
library(clusterSim)
data(data_nominal)
r2<- HINoV.Mod (data_nominal, type="nonmetric", Index = "cRAND")
print(r2$stopri)
plot(r2$stopri[,2], xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r2$stopri[,1])),labels=r2$stopri[,1])

# for mixed data
library(clusterSim)
data(data_mixed)
r3<- HINoV.Mod(data_mixed, type=c("m","n","m","n"), s=2, 3, distance="d1",
     method="complete", Index="cRAND")
print(r3$stopri)
plot(r3$stopri[,2], xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r3$stopri[,1])),labels=r3$stopri[,1])

}
\keyword{cluster}