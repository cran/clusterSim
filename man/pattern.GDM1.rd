\name{pattern.GDM1}
\alias{pattern.GDM1}
\title{An application of GDM1 distance for metric data to compute the distances of objects from the pattern object (upper or lower)}
\description{An application of GDM1 distance for metric data to compute the distances of objects from the upper (ideal point co-ordinates) or lower (anti-ideal point co-ordinates) pattern object}
\usage{
pattern.GDM1(data, performanceVariable, scaleType="i",
nomOptValues=NULL, weightsType="equal", weights=NULL,
normalization="n0", patternType="upper",
patternCoordinates="dataBounds", patternManual=NULL,
nominalTransfMethod=NULL)
}
\arguments{
\item{data}{matrix or dataset}
\item{performanceVariable}{vector containing three types of performance variables:

\code{s} for stimulants where higher value means better performance

\code{d} for destimulants where low values indicate better performance 

\code{n} for nominants where the best value is implied. Object performance is positively assessed if the measure has implied value}

\item{scaleType}{"i" - variables measured on interval scale, "r" - variables measured on ratio scale, "r/i" - vector with mixed variables}
\item{nomOptValues}{vector containing optimal values for nominant variables and NA values for stimulants and destimulants. If \code{performanceVariable} do not contain nominant variables this \code{nomOptValues} may be set to NULL}
\item{weightsType}{equal or different1 or different2

"equal" - equal weights

"different1" - vector of different weights should satisfy conditions: each weight takes value from interval [0; 1] and sum of weights equals one
 
"different2" - vector of different weights should satisfy conditions: each weight takes value from interval [0; m] and sum of weights equals m (m - the number of variables)
}
\item{normalization}{normalization method "n0" - "n11" as in \code{data.Normalization} function}
\item{weights}{vector of weights}
\item{patternType}{"upper" - ideal point co-ordinates consists of the best variables' values

"lower" - anti-ideal point co-ordinates consists of the worst variables' values

}

\item{patternCoordinates}{
"dataBounds" - pattern should be calculated as following: "upper" pattern (maximum for stimulants, minimum for destimulants), "lower" pattern (minimum for stimulants, maximum for destimulants)

"manual" - pattern should be given in \code{patternManual} variable}
\item{patternManual}{Pattern co-ordinates contain:

real numbers 

"min" - for minimal value of variable

"max" - for maximal value of variable

}
\item{nominalTransfMethod}{method of transformation of nominant to stimulant variable:

"q" - quotient transformation

"d" - difference transformation
}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\patternGDM1\_details.pdf for further details
}
\value{
\item{pdata}{raw (primary) data matrix}
\item{tdata}{data matrix after transformation of nominant variables (with pattern in last row)}
\item{data}{data matrix after normalization (with pattern in last row)}
\item{distances}{GDM1 distances from pattern object}
\item{sortedDistances}{sorted GDM1 distances from pattern object}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{

Jajuga, K., Walesiak, M., Bak, A. (2003), \emph{On the general distance measure}, In: M. Schwaiger, O. Opitz (Eds.), Exploratory data analysis in empirical research, Springer-Verlag, Berlin, Heidelberg, 104-109.

Walesiak, M. (1993), \emph{Statystyczna analiza wielowymiarowa w badaniach marketingowych [Multivariate statistical analysis in marketing research]}. Wroclaw University of Economics, Research Papers no. 654.

Walesiak, M. (2006), \emph{Uogolniona miara odleglosci w statystycznej analizie wielowymiarowej [The Generalized Distance Measure in multivariate statistical analysis]}, Wydawnictwo AE, Wroclaw.
}

\seealso{
\code{\link{dist.GDM}},\code{\link{data.Normalization}}
}
\examples{
# Example 1
library(clusterSim)
data(data_patternGDM1)
res<-pattern.GDM1(data_patternGDM1,
performanceVariable=c("s","s","s","s","s","s","d","d","s","s"),
scaleType="r",nomOptValues=NULL,weightsType<-"equal",weights=NULL,
normalization<-"n4",patternType<-"lower",patternCoordinates<-"manual",
patternManual<-c("min","min","min","min","min","min","max","max","min","min"),
nominalTransfMethod <-NULL)
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(max(gdm_p),min(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)),xaxt="n",
xlab="Order of objects from the best to the worst", 
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)

# Example 2
library(clusterSim)
data(data_patternGDM1)
res<-pattern.GDM1(data_patternGDM1,
performanceVariable=c("s","s","s","s","s","s","d","d","s","s"),
scaleType="r",nomOptValues=NULL,weightsType<-"equal",weights=NULL,
normalization<-"n2",patternType<-"upper",
patternCoordinates<-"dataBounds",patternManual<-NULL,
nominalTransfMethod<-NULL)
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(min(gdm_p),max(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)),xaxt="n",
xlab="Order of objects from the best to the worst", 
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)

# Example 3
library(clusterSim)
data(data_patternGDM1)
res<-pattern.GDM1(data_patternGDM1,
performanceVariable=c("s","s","s","s","s","s","d","d","s","s"),
scaleType="r",nomOptValues=NULL,weightsType<-"different2",
weights=c(1.1,1.15,1.15,1.1,1.1,0.7,0.7,1.2,0.8,1.0),
normalization<-"n6",patternType<-"upper",patternCoordinates<-"manual",
patternManual<-c(100,100,100,100,100,"max","min","min","max","max"),
nominalTransfMethod <-NULL)
print(res)
gdm_p<-res$distances
plot(cbind(gdm_p,gdm_p),xlim=c(min(gdm_p),max(gdm_p)),
ylim=c(min(gdm_p),max(gdm_p)),xaxt="n",
xlab="Order of objects from the best to the worst", 
ylab="GDM distances from pattern object", lwd=1.6)
axis(1, at=gdm_p,labels=names(gdm_p), cex.axis=0.5)
}
\keyword{cluster}
