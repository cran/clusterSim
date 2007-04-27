\name{dist.GDM}
\alias{dist.GDM}
\alias{GDM}
\alias{GDM1}
\alias{GDM2}
\title{Calculates Generalized Distance Measure}
\description{
Calculates Generalized Distance Measure for variables measured on metric scale (ratio & interval) or ordinal scale.
}
\usage{dist.GDM (x,method="GDM1")
GDM(x,method="GDM1")
GDM1(x)
GDM2(x)
}
\arguments{
\item{x}{matrix or data set}
\item{method}{GDM1 or GDM2}
"GDM1" - metric scale (ratio & interval) 

"GDM2" - ordinal scale
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\distGDM\_details.pdf for further details
}
\value{
object with calculated distance
}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\references{

Jajuga, K., Walesiak, M., Bak, A. (2003), \emph{On the general distance measure}, In: M. Schwaiger, O. Opitz (Eds.), Exploratory data analysis in empirical research, Springer-Verlag, Berlin, Heidelberg, pp. 104-109.

Walesiak, M. (2006), \emph{Uogólniona miara odleglosci w statystycznej analizie wielowymiarowej [The Generalized Distance Measure in multivariate statistical analysis]}, Wydawnictwo AE, Wroclaw.

}
\seealso{
\code{\link{dist.BC}}, \code{\link{dist.SM}}, \code{\link{dist}}
}
\examples{
library(clusterSim)
data(data_ratio)
d1<-GDM(data_ratio,method="GDM1")
data(data_ordinal)
d2<-GDM(data_ordinal,method="GDM2")
d3<-GDM1(data_ratio)
d4<-GDM2(data_ordinal)
}
\keyword{cluster}

