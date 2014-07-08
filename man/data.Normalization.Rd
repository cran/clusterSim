\name{data.Normalization}
\alias{data.Normalization}
\title{Types of variable (column) and object (row) normalization formulas}
\description{Types of variable (column) and object (row) normalization formulas}
\usage{data.Normalization (x,type="n0",normalization="column")}
\arguments{
\item{x}{vector, matrix or dataset}
\item{type}{type of normalization:}
n0 - without normalization 

n1 - standardization ((x-mean)/sd)

n2 - positional standardization ((x-median)/mad)

n3 - unitization ((x-mean)/range)

n3a - positional unitization ((x-median)/range)

n4 - unitization with zero minimum ((x-min)/range)

n5 - normalization in range <-1,1> ((x-mean)/max(abs(x-mean)))

n5a - positional normalization in range <-1,1> ((x-median)/max(abs(x-median)))

n6 - quotient transformation (x/sd)

n6a - positional quotient transformation (x/mad)

n7 - quotient transformation (x/range)

n8 - quotient transformation (x/max)

n9 - quotient transformation (x/mean)

n9a - positional quotient transformation (x/median)

n10 - quotient transformation (x/sum)

n11 - quotient transformation (x/sqrt(SSQ))

n12 - normalization ((x-mean)/sqrt(sum((x-mean)^2)))

n12a - positional normalization ((x-median)/sqrt(sum((x-median)^2)))

n13 - normalization with zero being the central point ((x-midrange)/(range/2))

\item{normalization}{"column" - normalization by variable, "row" - normalization by object}

}
\value{
Normalized data
}
\details{
See file \url{../doc/dataNormalization_details.pdf} for further details
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{
Anderberg, M.R. (1973), \emph{Cluster analysis for applications}, Academic Press, New York, San Francisco, London.

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, 35-38.

Jajuga, K., Walesiak, M. (2000), \emph{Standardisation of data set under different measurement scales}, In: R. Decker, W. Gaul (Eds.), Classification and information processing at the turn of the millennium, Springer-Verlag, Berlin, Heidelberg, 105-112.

Milligan, G.W., Cooper, M.C. (1988), \emph{A study of standardization of variables in cluster analysis}, "Journal of Classification", vol. 5, 181-204.

Mlodak, A. (2006), \emph{Analiza taksonomiczna w statystyce regionalnej}, Difin, Warszawa.

Walesiak, M. (2014), \emph{Przeglad formul normalizacyjnych wartosci zmiennych oraz ich wlasnosci w statystycznej analizie wielowymiarowej [Data normalization in multivariate data analysis. An overview and properties]}, W: K. Jajuga, M. Walesiak (Eds.), Klasyfikacja i analiza danych – teoria i zastosowania, Taksonomia, Prace Naukowe UE we Wroclawiu (w redakcji).
}
\seealso{
\code{\link{cluster.Sim}}
}
\examples{
library(clusterSim)
data(data_ratio)
z1 <- data.Normalization(data_ratio,type="n1",normalization="column")
z2 <- data.Normalization(data_ratio,type="n10",normalization="row")
}
\keyword{cluster}