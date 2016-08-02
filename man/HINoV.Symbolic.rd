\name{HINoV.Symbolic}
\alias{HINoV.Symbolic}
\title{Modification of Carmone, Kara \& Maxwell Heuristic Identification of Noisy Variables (HINoV) method for symbolic interval data}
\description{Modification of Heuristic Identification of Noisy Variables (HINoV) method for symbolic interval data}
\usage{
HINoV.Symbolic(x, u=NULL, distance="H", method = "pam", 
	Index = "cRAND")
}
\arguments{
\item{x}{symbolic interval data: a 3-dimensional table, first dimension represents object number, second dimension - variable number, and third dimension contains lower- and upper-bounds of intervals}
\item{u}{number of clusters}
\item{distance}{"M" - minimal distance between all vertices of hyper-cubes defined by symbolic interval variables; "H" - Hausdorff distance; "S" - sum of squares of distance between all vertices of hyper-cubes defined by symbolic interval variables }
\item{method}{clustering method: "single", "ward.D", "ward.D2", "complete", "average", "mcquitty", "median", "centroid", "pam" (default)}
\item{Index}{"cRAND" - corrected Rand index (default); "RAND" - Rand index}
}
\details{
See file \url{../doc/HINoVSymbolic_details.pdf} for further details
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
Carmone, F.J., Kara, A., Maxwell, S. (1999), \emph{HINoV: a new method to improve market segment definition by identifying noisy variables}, "Journal of Marketing Research", November, vol. 36, 501-509.

Hubert, L.J., Arabie, P. (1985), \emph{Comparing partitions}, "Journal of Classification", no. 1, 193-218.

Rand, W.M. (1971), \emph{Objective criteria for the evaluation of clustering methods}, "Journal of the American Statistical Association", no. 336, 846-850.

Walesiak, M., Dudek, A. (2008), \emph{Identification of noisy variables for nonmetric and symbolic data in cluster analysis}, In: C. Preisach, H. Burkhardt, L. Schmidt-Thieme, R. Decker (Eds.), Data analysis, machine learning and applications, Springer-Verlag, Berlin, Heidelberg, 85-92.
}
\seealso{
\code{\link{hclust}}, \code{\link{kmeans}}, \code{\link{cluster.Sim}}
}
\examples{
library(clusterSim)
data(data_symbolic)
r<- HINoV.Symbolic(data_symbolic, u=5)
print(r$stopri)
plot(r$stopri[,2], xlab="Variable number", ylab="topri",
xaxt="n", type="b")
axis(1,at=c(1:max(r$stopri[,1])),labels=r$stopri[,1])

#symbolic data from .csv file
#library(clusterSim)
#dsym<-as.matrix(read.csv2(file="csv/symbolic.csv"))
#dim(dsym)<-c(dim(dsym)[1],dim(dsym)[2]\%/\%2,2)          
#r<- HINoV.Symbolic(dsym, u=5)
#print(r$stopri)
#plot(r$stopri[,2], xlab="Variable number", ylab="topri",
#xaxt="n", type="b")
#axis(1,at=c(1:max(r$stopri[,1])),labels=r$stopri[,1])

}
\keyword{cluster}