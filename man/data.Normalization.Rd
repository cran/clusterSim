\name{data.Normalization}
\alias{data.Normalization}
\title{Types of variable normalization formulas}
\description{Types of variable normalization formulas}
\usage{data.Normalization (x,type="n0")}
\arguments{
\item{x}{vector, matrix or dataset}
\item{type}{type of normalization:}
n0 - without normalization 

n1 - standardization ((x-mean)/sd)

n2 - Weber standardization ((x-Me)/MAD)

n3 - unitization ((x-mean)/range)

n4 - unitization with zero minimum ((x-min)/range)

n5 - normalization in range <-1,1> ((x-mean)/max(abs(x-mean)))

n6 - quotient transformation (x/sd)

n7 - quotient transformation (x/range)

n8 - quotient transformation (x/max)

n9 - quotient transformation (x/mean)

n10 - quotient transformation (x/sum)

n11 - quotient transformation (x/sqrt(SSQ))

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
Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, 35-38.

Jajuga, K., Walesiak, M. (2000), \emph{Standardisation of data set under different measurement scales}, In: R. Decker, W. Gaul (Eds.), Classification and information processing at the turn of the millennium, Springer-Verlag, Berlin, Heidelberg, 105-112.

Milligan, G.W., Cooper, M.C. (1988), \emph{A study of standardization of variables in cluster analysis}, "Journal of Classification", vol. 5, 181-204.
}
\seealso{
\code{\link{cluster.Sim}}
}
\examples{
library(clusterSim)
data(data_ratio)
z1 <- data.Normalization(data_ratio, "n1")
z2 <- data.Normalization(data_ratio, type="n2")
z8 <- data.Normalization(data_ratio, type="n8")
}
\keyword{cluster}