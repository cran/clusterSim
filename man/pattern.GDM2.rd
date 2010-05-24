\name{pattern.GDM2}
\alias{pattern.GDM2}
\title{An application of GDM2 distance for ordinal data to compute the distances of objects from the pattern object (upper or lower)}
\description{An application of GDM2 distance for ordinal data to compute the distances of objects from the upper (ideal point co-ordinates) or lower (anti-ideal point co-ordinates) pattern object}
\usage{
pattern.GDM2(data, performanceVariable, nomOptValues=NULL,
weightsType="equal", weights=NULL, patternType="upper",
patternCoordinates="dataBounds", patternManual=NULL,
nominalTransfMethod=NULL)
}
\arguments{
\item{data}{matrix or dataset}
\item{performanceVariable}{vector containing three types of performance variables:

\code{s} for stimulants where higher value means better performance

\code{d} for destimulants where low values indicate better performance 

\code{n} for nominants where the best value is implied. Object performance is positively assessed if the measure has implied value}
\item{nomOptValues}{vector containing optimal values for nominant variables and NA values for stimulants and destimulants. If \code{performanceVariable} do not contain nominant variables this \code{nomOptValues} may be set to NULL}
\item{weightsType}{equal or different1 or different2

"equal" - equal weights

"different1" - vector of different weights should satisfy conditions: each weight takes value from interval [0; 1] and sum of weights equals one
 
"different2" - vector of different weights should satisfy conditions: each weight takes value from interval [0; m] and sum of weights equals m (m - the number of variables)
}
\item{weights}{vector of weights}
\item{patternType}{"upper" - ideal point co-ordinates consists of the best variables' values

"lower" - anti-ideal point co-ordinates consists of the worst variables' values

}

\item{patternCoordinates}{
"dataBounds" - pattern should be calculated as following: "upper" pattern (maximum for stimulants, minimum for destimulants, nominal value for nominants), "lower" pattern (minimum for stimulants, maximum for destimulants)

"manual" - pattern should be given in \code{patternManual} variable}
\item{patternManual}{Pattern co-ordinates contain:

real numbers 

"min" - for minimal value of variable

"max" - for maximal value of variable

"nom" - for nominal value of variable (for upper pattern only - given in \code{nomOptValues} vector)
}
\item{nominalTransfMethod}{method of transformation of nominant to destimulant variable for patternType="lower":

"database" - for each nominant separately GDM2 distance is calculated between each nominant observation (with repetitions - all variable values are used in calculation) and nominal value. Next the variable observations are replaced by those distances


"symmetrical" - for each nominant separately GDM2 distance is calculated between each nominant observation (without repetition - each observation is used once) and nominal value. Next the variable observations are replaced by those distances
}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\patternGDM2\_details.pdf for further details
}
\value{
\item{pdata}{raw (primary) data matrix}
\item{data}{data matrix after transformation of nominant variables (with pattern in last row)}
\item{distances}{GDM2 distances from pattern object}
\item{sortedDistances}{sorted GDM2 distances from pattern object}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{

Jajuga, K., Walesiak, M., Bak, A. (2003), \emph{On the general distance measure}, In: M. Schwaiger, O. Opitz (Eds.), Exploratory data analysis in empirical research, Springer-Verlag, Berlin, Heidelberg, 104-109.

Walesiak, M. (1993), \emph{Statystyczna analiza wielowymiarowa w badaniach marketingowych [Multivariate statistical analysis in marketing research]}. Wroclaw University of Economics, Research Papers no. 654.

Walesiak, M. (1999), \emph{Distance Measure for Ordinal Data}, "Argumenta Oeconomica", No. 2 (8), 167-173.

Walesiak, M. (2006), \emph{Uogolniona miara odleglosci w statystycznej analizie wielowymiarowej [The Generalized Distance Measure in multivariate statistical analysis]}, Wydawnictwo AE, Wroclaw.
}

\seealso{
\code{\link{dist.GDM}}
}
\examples{
# Example 1
library(clusterSim)
data(data_patternGDM2)
res<-pattern.GDM2(data_patternGDM2,
performanceVariable=c("s","s","s","d","d","n"),
nomOptValues=c(NA,NA,NA,NA,NA,3), weightsType<-"equal", weights=NULL,
patternType="lower", patternCoordinates="manual",
patternManual=c("min","min",0,5,"max","max"),
nominalTransfMethod="symmetrical")
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(max(gdm_p),min(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)), 
xaxt="n",xlab="Order of objects from the best to the worst",
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)

# Example 2
library(clusterSim)
data(data_patternGDM2)
res<-pattern.GDM2(data_patternGDM2,
performanceVariable=c("s","s","s","d","d","n"),
nomOptValues=c(NA,NA,NA,NA,NA,3), weightsType<-"equal", weights=NULL,
patternType="upper", patternCoordinates="dataBounds",
patternManual=NULL, nominalTransfMethod="database")
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p), xlim=c(min(gdm_p),max(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)), 
xaxt="n",xlab="Order of objects from the best to the worst",
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)
}
\keyword{cluster}