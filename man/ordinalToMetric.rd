\name{ordinalToMetric}
\alias{ordinalToMetric}
\title{Reinforcing measurement scale for ordinal data}
\description{Reinforcing measurement scale for ordinal data (ordinal to metric scale)}
\usage{
ordinalToMetric(data,scaleType="o",patternCoordinates)
}
\arguments{
\item{data}{matrix or dataset}
\item{scaleType}{"o" - variables measured on ordinal scale, "m" - variables measured on metric scale, 
"o/m" - vector with mixed variables - e.g. c("o","m","m","o","o","m")}
\item{patternCoordinates}{vector containing pattern coordinates c(...) given by the reaseracher for data (for metric variables - NA,
 for ordinal variables - one of the categories for each ordinal variable (e.g. maximum category))}
}
\details{
See file \url{../doc/ordinalToMetric_details.pdf} for further details
}
\value{
\item{pdata}{raw (primary) data matrix}
\item{tdata}{data matrix after transformation of ordinal variables into metric variables}
\item{cpattern}{vector containing pattern coordinates}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, Wroclaw University of Economics, Poland
}
\references{

Jajuga, K., Walesiak, M., Bak, A. (2003), \emph{On the general distance measure}, In: M. Schwaiger, O. Opitz (Eds.), Exploratory data analysis in empirical research, Springer-Verlag, Berlin, Heidelberg, 104-109. Available at: \doi{10.1007/978-3-642-55721-7_12}.

Walesiak, M. (1993), \emph{Statystyczna analiza wielowymiarowa w badaniach marketingowych [Multivariate statistical analysis in marketing research]}. Wroclaw University of Economics, Research Papers no. 654.

Walesiak, M. (1999), \emph{Distance Measure for Ordinal Data}, "Argumenta Oeconomica", No. 2 (8), 167-173.

Walesiak, M. (2011), \emph{Uogólniona miara odległości GDM w statystycznej analizie wielowymiarowej z wykorzystaniem programu R [The Generalized Distance Measure GDM in multivariate statistical analysis with R]}, Wydawnictwo Uniwersytetu Ekonomicznego, Wroclaw.

Walesiak, M. (2014), \emph{Wzmacnianie skali pomiaru dla danych porządkowych w statystycznej analizie wielowymiarowej [Reinforcing measurement scale for ordinal data in multivariate statistical analysis]}, Taksonomia 22, Prace Naukowe Uniwersytetu Ekonomicznego we Wrocławiu no. 327, 60-68.
}

\seealso{
\code{\link{dist.GDM}}
}
\examples{
# Example 1
library(clusterSim)
data(data_patternGDM2)
res1<-ordinalToMetric(data_patternGDM2,scaleType="o",patternCoordinates=c(5,4,3,1,1,3))
print(res1)

# Example 2
library(clusterSim)
data(data_patternGDM2)
res2<-ordinalToMetric(data_patternGDM2,scaleType="o",patternCoordinates=c(5,4,3,4,2,4))
print(res2)
}
\keyword{ordinal scale}
\keyword{GDM distance}
\keyword{reinforcing measurement scale}
\keyword{multivariate statistical analysis}
