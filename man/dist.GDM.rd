\name{dist.GDM}
\alias{dist.GDM}
\alias{GDM}
\alias{GDM1}
\alias{GDM2}
\title{Calculates Generalized Distance Measure}
\description{
Calculates Generalized Distance Measure for variables measured on metric scale (ratio & interval) or ordinal scale
}
\usage{dist.GDM(x, method="GDM1", weightsType="equal", weights=NULL)
GDM(x, method="GDM1", weightsType="equal", weights=NULL)
GDM1(x, weightsType="equal", weights=NULL)
GDM2(x, weightsType="equal", weights=NULL)
}
\arguments{
\item{x}{matrix or data set}
\item{method}{GDM1 or GDM2}

"GDM1" - metric scale (ratio & interval) 

"GDM2" - ordinal scale

\item{weightsType}{equal or different1 or different2}

"equal" - equal weights

"different1" - vector of different weights should satisfy conditions: each weight takes value from interval [0; 1] and sum of weights equals one
 
"different2" - vector of different weights should satisfy conditions: each weight takes value from interval [0; m] and sum of weights equals m (m - the number of variables)
\item{weights}{vector of weights}
}
\details{
See file $R_HOME\\library\\clusterSim\\pdf\\distGDM_details.pdf for further details
}
\value{
object with calculated distance
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim/}
}
\references{
Jajuga, K., Walesiak, M., Bak, A. (2003), \emph{On the general distance measure}, In: M. Schwaiger, O. Opitz (Eds.), Exploratory data analysis in empirical research, Springer-Verlag, Berlin, Heidelberg, 104-109. Available at: \doi{10.1007/978-3-642-55721-7_12}.

Walesiak, M. (1999), \emph{Distance Measure for Ordinal Data}, "Argumenta Oeconomica", No. 2 (8), 167-173. Available at: \url{http://keii.ue.wroc.pl/pracownicy/mw/1999_Walesiak_Argumenta_Oeconomica_no_2.pdf}.

Walesiak, M. (2006), \emph{Uogolniona miara odleglosci w statystycznej analizie wielowymiarowej [The Generalized Distance Measure in multivariate statistical analysis]}, Wydawnictwo AE, Wroclaw. Available at: \url{http://keii.ue.wroc.pl/pracownicy/mw/2006_Walesiak_Uogolniona_miara_odleglosci.pdf}.
}
\seealso{
\code{\link{dist.BC}}, \code{\link{dist.SM}}, \code{\link{dist}}
}
\examples{
#Example 1
library(clusterSim)
data(data_ratio)
d1 <- GDM(data_ratio, method="GDM1")
data(data_ordinal)
d2 <- GDM(data_ordinal, method="GDM2")
d3 <- GDM1(data_ratio)
d4 <- GDM2(data_ordinal)

#Example 2
library(clusterSim)
data(data_ratio)
d1w <- GDM(data_ratio, method="GDM1", weightsType="different1",
weights=c(0.4,0.1,0.3,0.15,0.05))
data(data_ordinal)
d2w <- GDM(data_ordinal, method="GDM2", weightsType="different2",
weights=c(1,3,0.5,1.5,1.8,0.2,0.4,0.6,0.2,0.4,0.9,1.5))
}
\keyword{cluster}