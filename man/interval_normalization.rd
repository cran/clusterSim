\name{interval_normalization}
\alias{interval_normalization}
\title{Types of normalization formulas for interval-valued symbolic variables}
\description{Types of normalization formulas for interval-valued symbolic variables}
\usage{interval_normalization(x,dataType="simple",type="n0",y=NULL,...)}
\arguments{
\item{x}{matrix dataset or symbolic table object}
\item{dataType}{Type of symbolic data table passed to function, 

'sda' - full symbolicDA format object; 

'simple' - three dimensional array with lower and upper bound of intervals in third dimension;

'separate_tables' - lower bounds of intervals in \code{x}, upper bounds in  \code{y};

'rows' - lower and upper bound of intervals in neighbouring rows;

'columns' - lower and upper bound of intervals in neighbouring columns
}
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

\item{y}{matrix or dataset with upper bounds of intervals if argument \code{dataType} is uuqual to "separate_tables"}
\item{...}{arguments passed to \code{sum}, \code{mean}, \code{min} \code{sd}, \code{mad} and other aggregation functions. In particular: 
\code{na.rm} - a logical value indicating whether NA values should be stripped before the computation}
}
\value{
Normalized data
}

\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland
}
\references{
Jajuga, K., Walesiak, M. (2000), \emph{Standardisation of data set under different measurement scales}, In: R. Decker, W. Gaul (Eds.), Classification and information processing at the turn of the millennium, Springer-Verlag, Berlin, Heidelberg, 105-112. Available at: \doi{10.1007/978-3-642-57280-7_11}.

Milligan, G.W., Cooper, M.C. (1988), \emph{A study of standardization of variables in cluster analysis}, "Journal of Classification", vol. 5, 181-204. Available at: \doi{10.1007/BF01897163}.

Walesiak, M. (2014), \emph{Przeglad formul normalizacji wartosci zmiennych oraz ich wlasnosci w statystycznej analizie wielowymiarowej [Data normalization in multivariate data analysis. An overview and properties]}, "Przeglad Statystyczny" ("Statistical Review"), vol. 61, no. 4, 363-372. Available at: \doi{10.5604/01.3001.0016.1740}.

Walesiak, M., Dudek, A. (2017), \emph{Selecting the Optimal Multidimensional Scaling Procedure for Metric Data with R Environment}, „STATISTICS IN TRANSITION new series”, September, Vol. 18, No. 3, pp. 521-540. Available at: \doi{10.59170/stattrans-2017-027}.
}
\seealso{
\code{\link{data.Normalization}}
}
\examples{
library(clusterSim)
data(data_symbolic_interval_polish_voivodships)
n<-interval_normalization(data_symbolic_interval_polish_voivodships,dataType="simple",type="n2")
plotInterval(n$simple)
}
\keyword{interval-valued data}
\keyword{normalization}
\keyword{symbolic data analysis}

