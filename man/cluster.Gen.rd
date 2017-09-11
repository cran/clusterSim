\name{cluster.Gen}
\alias{cluster.Gen}
\title{Random cluster generation with known structure of clusters}
\description{Random cluster generation with known structure of clusters (optionally with noisy variables and outliers)}
\usage{cluster.Gen(numObjects=50, means=NULL, cov=NULL, fixedCov=TRUE,
                   model=1, dataType="m",numCategories=NULL, 
                   numNoisyVar=0, numOutliers=0, rangeOutliers=
                   c(1,10), inputType="csv2", inputHeader=TRUE, 
                   inputRowNames=TRUE, outputCsv="", outputCsv2="", 
                   outputColNames=TRUE, outputRowNames=TRUE)}
\arguments{
\item{numObjects}{number of objects in each cluster - positive integer value or vector with the same size as \emph{nrow(means)},
e.g. \code{numObjects=c(50,20)}}
\item{means}{matrix of cluster means (e.g. \code{means=matrix(c(0,8,0,8),2,2)}). If \code{means = NULL} matrix should be read from \emph{means\_<modelNumber>.csv file}}
\item{cov}{covariance matrix (the same for each cluster, e.g. \code{cov=matrix(c(1, 0, 0, 1), 2, 2)}).
If \code{cov=NULL} matrix should be read from

\emph{cov\_<modelNumber>.csv file}.
Note: you cannot use this argument for generation of clusters with different covariance matrices. 
Those kind of generation should be done by setting \code{fixedCov} to \code{FALSE} and using appropriate model}
\item{model}{model number,
\code{model=1} - no cluster structure. Observations are simulated from uniform distribution over the unit hypercube in number of 
dimensions (variables) given in \code{numNoisyVar} argument; 

\code{model=2} - means and covariances are taken from arguments \code{means} and \code{cov} (see Example 1);
 
\code{model=3,4,...,20} - see file 

\$R\_HOME\\library\\clusterSim\\pdf\\clusterGen\_details.pdf; 

\code{model=21,22,...} - if \code{fixedCov=TRUE} \code{means} should be read from 

\emph{means\_<modelNumber>.csv} and  covariance matrix for all clusters should be read 
from \emph{cov\_<modelNumber>.csv} and if  \code{fixedCov=FALSE} \code{means} should be read from 

\emph{means\_<modelNumber>.csv} 
and covariance matrices should be read separately for each cluster 
from \emph{cov\_<modelNumber>\_<clusterNumber>.csv}}

\item{fixedCov}{if \code{fixedCov=TRUE} covariance matrix for all clusters is the same 
and if 

\code{fixedCov=FALSE} each cluster is generated from different covariance matrix - see \code{model}}
\item{dataType}{"m" - metric (ratio, interval), "o" -  ordinal, "s" - symbolic interval}
\item{numCategories}{number of categories (for ordinal data only). Positive integer value or vector with the same size as \emph{ncol(means)} plus number of noisy variables.}
\item{numNoisyVar}{number of noisy variables. For \code{model=1} it means number of variables}
\item{numOutliers}{number of outliers (for metric and symbolic interval data only). If a positive integer - number of outliers, if value from <0,1> - percentage of outliers in whole data set}
\item{rangeOutliers}{range for outliers (for metric and symbolic interval data only). The default range is [1, 10].The outliers are generated independently for each variable for the whole data set from uniform distribution. The generated values are randomly added to maximum of \emph{j}-th variable or subtracted from minimum of \emph{j}-th variable} 
\item{inputType}{"csv" - a dot as decimal point or "csv2" - a comma as decimal point in 

\emph{means\_<modelNumber>.csv} and \emph{cov\_<modelNumber>.csv} files}
\item{inputHeader}{\code{inputHeader=TRUE} indicates that input files (\emph{means\_<modelNumber>.csv};

\emph{cov\_<modelNumber...>.csv}) contain header row}
\item{inputRowNames}{\code{inputRowNames=TRUE} indicates that input files (\emph{means\_<modelNumber>.csv}; \emph{cov\_<modelNumber...>.csv}) contain first column with row names or with number of objects (positive integer values)}
\item{outputCsv}{optional, name of csv file with generated data (first column contains id, second - number of cluster and others - data)}
\item{outputCsv2}{optional, name of csv (a comma as decimal point and a semicolon as field separator) file with generated data (first column contains id, second - number of cluster and others - data)}
\item{outputColNames}{\code{outputColNames=TRUE} indicates that output file (given by \code{outputCsv} and \code{outputCsv2} parameters) contains first row with column names}
\item{outputRowNames}{\code{outputRowNames=TRUE} indicates that output file (given by \code{outputCsv} and \code{outputCsv2} parameters) contains a vector of row names}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\clusterGen\_details.pdf for further details
}
\value{
\item{clusters}{cluster number for each object, for \code{model=1} each 
object belongs to its own cluster thus this variable contains objects numbers} 
\item{data}{generated data: for metric and ordinal data - matrix with 
objects in rows and variables in columns; 
for symbolic interval data three-dimensional structure: first dimension represents object number,
 second - variable number and third dimension contains lower- and upper-bounds of intervals}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{
Billard, L., Diday, E. (2006), \emph{Symbolic data analysis. Conceptual statistics and data mining}, Wiley, Chichester. ISBN: 978-0-470-09016-9.

Qiu, W., Joe, H. (2006), \emph{Generation of random clusters with specified degree of separation}, "Journal of Classification", vol. 23, 315-334. Available at: \url{http://dx.doi.org/10.1007/s00357-006-0018-y}.

Steinley, D., Henson, R. (2005), \emph{OCLUS: an analytic method for generating clusters with known overlap}, "Journal of Classification", vol. 22, 221-250. Available at: \url{http://dx.doi.org/10.1007/s00357-005-0015-6}.

Walesiak, M., Dudek, A. (2008), \emph{Identification of noisy variables for nonmetric and symbolic data in cluster analysis}, In: C. Preisach, H. Burkhardt, L. Schmidt-Thieme, R. Decker (Eds.), Data analysis, machine learning and applications, Springer-Verlag, Berlin, Heidelberg, 85-92. Available at: \url{http://keii.ue.wroc.pl/pracownicy/mw/2008_Walesiak_Dudek_Springer.pdf}.

Walesiak, M. (2016), \emph{Uogólniona miara odległości GDM w statystycznej analizie wielowymiarowej z wykorzystaniem programu R. Wydanie 2 poprawione i rozszerzone [The Generalized Distance Measure GDM in multivariate statistical analysis with R]}, Wydawnictwo Uniwersytetu Ekonomicznego, Wroclaw. Available at: \url{http://keii.ue.wroc.pl/pracownicy/mw/2016_Walesiak_Uogolniona_miara_odleglosci_GDM.pdf}.
}
\examples{


# Example 1
library(clusterSim)
means <- matrix(c(0,7,0,7),2,2)
cov <- matrix(c(1,0,0,1),2,2)
grnd <- cluster.Gen(numObjects=60,means=means,cov=cov,model=2,
numOutliers=8)
colornames <- c("red","blue","green")
grnd$clusters[grnd$clusters==0]<-length(colornames)
plot(grnd$data,col=colornames[grnd$clusters],ask=TRUE)

# Example 2
library(clusterSim)
grnd <- cluster.Gen(50,model=4,dataType="m",numNoisyVar=2)
data <- as.matrix(grnd$data)
colornames <- c("red","blue","green")
plot(grnd$data,col=colornames[grnd$clusters],ask=TRUE)

# Example 3
library(clusterSim)
grnd<-cluster.Gen(50,model=4,dataType="o",numCategories=7, numNoisyVar=2)
plotCategorial(grnd$data,,grnd$clusters,ask=TRUE)

# Example 4 (1 nonnoisy variable and 2 noisy variables, 3 clusters)
library(clusterSim)
grnd <- cluster.Gen(c(40,60,20), model=2, means=c(2,14,25),
cov=c(1.5,1.5,1.5),numNoisyVar=2)
colornames <- c("red","blue","green")
plot(grnd$data,col=colornames[grnd$clusters],ask=TRUE)

# Example 5
library(clusterSim)
grnd <- cluster.Gen(c(20,35,20,25),model=14,dataType="m",numNoisyVar=1,
fixedCov=FALSE, numOutliers=0.1, outputCsv2="data14.csv")
data <- as.matrix(grnd$data)
colornames <- c("red","blue","green","brown","black")
grnd$clusters[grnd$clusters==0]<-length(colornames)
plot(grnd$data,col=colornames[grnd$clusters],ask=TRUE)

# Example 6 (this example needs files means_24.csv) 
# and cov_24.csv to be placed in working directory
# library(clusterSim)
# grnd<-cluster.Gen(c(50,80,20),model=24,dataType="m",numNoisyVar=1, 
# numOutliers=10, rangeOutliers=c(1,5))
# print(grnd)
# data <- as.data.frame(grnd$data)
# colornames<-c("red","blue","green","brown")
# grnd$clusters[grnd$clusters==0]<-length(colornames)
# plot(data,col=colornames[grnd$clusters],ask=TRUE)

# Example 7 (this example needs files means_25.csv and cov_25_1.csv) 
# cov_25_2.csv, cov_25_3.csv, cov_25_4.csv, cov_25_5.csv
# to be placed in working directory
# library(clusterSim)
# grnd<-cluster.Gen(c(40,30,20,35,45),model=25,numNoisyVar=3,fixedCov=F)
# data <- as.data.frame(grnd$data)
# colornames<-c("red","blue","green","magenta","brown")
# plot(data,col=colornames[grnd$clusters],ask=TRUE)
}
\keyword{cluster}
\keyword{data}
\keyword{multivariate}