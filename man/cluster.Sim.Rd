\name{cluster.Sim}
\alias{cluster.Sim}
\title{Determination of optimal clustering procedure for a data set }
\description{Determination of optimal clustering procedure for a data set by varying all combinations of normalization formulas, distance measures, and clustering methods}
\usage{
cluster.Sim (x,p,minClusterNo,maxClusterNo,icq="S",outputHtml="",
	outputCsv="",outputCsv2="",normalizations=NULL,
	distances=NULL,methods=NULL)
}
\arguments{
\item{x}{matrix or dataset}
\item{p}{path of simulation: 1 - ratio data, 2 - interval or mixed (ratio & interval) data, 3 - ordinal data, 4 - nominal data, 5 - binary data, 6 - ratio data without normalization, 7 - interval or mixed (ratio & interval) data without normalization, 8 - ratio data with k-means, 9 - interval or mixed (ratio & interval) data with k-means}
\item{minClusterNo}{minimal number of clusters, between 2  and no. of objects - 1 (for G3: no. of objects - 2)}
\item{maxClusterNo}{maximal number of clusters, between 2 and no. of objects - 1 (for G3: no. of objects - 2; for KL: no. of objects - 3), greater or equal minClusterNo}
\item{icq}{Internal cluster quality index, "S" - Silhouette,"G1" - Calinski & Harabasz index, "G2" - Baker & Hubert index ,"G3" - Hubert & Levine index, "KL" - Krzanowski & Lai index }
\item{outputHtml}{ optional, name of html file with results}
\item{outputCsv}{ optional, name of csv file with results}
\item{outputCsv2}{ optional, name of csv (comma as decimal point sign) file with results}
\item{normalizations}{ optional, vector of normalization formulas that should be used in procedure}
\item{distances}{ optional, vector of distance measures that should be used in procedure}
\item{methods}{ optional, vector of classification methods that should be used in procedure}
}
\details{
Parameter \code{normalizations} for each path may be the subset of the following values

path 1: "n6" to "n11" (if measurement scale of variables is ratio and transformed measurement scale of variables is ratio) or 
"n1" to "n5" (if measurement scale of variables is ratio and transformed measurement scale of variables is interval)

path 2: "n1" to "n5"

path 3 to 7 : "n0"

path 8: "n1" to "n11"

path 9: "n1" to "n5"


Parameter \code{distances} for each path may be the subset of the following values

path 1: "d1" to "d7" (if measurement scale of variables is ratio and transformed measurement scale of variables is ratio) or 
"d1" to "d5" (if measurement scale of variables is ratio and transformed measurement scale of variables is interval)

path 2: "d1" to "d5"

path 3: "d8"

path 4: "d9"

path 5: "b1" to "b10" 

path 6: "d1" to "d7"

path 7: "d1" to "d5"

path 8 and 9: N.A.

Parameter \code{methods} for each path may be the subset of the following values

path 1 to 7 : "m1" to "m8"

path 8: "m9"

path 9: "m9"

See file \$R\_HOME\\library\\clusterSim\\pdf\\clusterSim\_details.pdf for further details
}
\value{
\item{result}{optimal value of icq for all classifications}
\item{normalization}{normalization used to obtain optimal value of icq}
\item{distance}{distance measure used to obtain optimal value of icq}
\item{method}{clustering method used to obtain optimal value of icq}
\item{classes}{number of clusters for optimal value of icq}
\item{time}{time of all calculations for path}
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{
Everitt, B.S., Landau, E., Leese, M. (2001), \emph{Cluster analysis}, Arnold, London.

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw.

Gordon, A.D. (1999), \emph{Classification}, Chapman & Hall/CRC, London.

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, 159-179.

Milligan, G.W., Cooper, M.C. (1988), \emph{A study of standardization of variables in cluster analysis}, "Journal of Classification", vol. 5, 181-204. 

Walesiak, M., Dudek, A. (2006), \emph{Symulacyjna optymalizacja wyboru procedury klasyfikacyjnej dla danego typu danych - oprogramowanie komputerowe i wyniki badan}, Prace Naukowe AE we Wroclawiu, 1126, 120-129.

Walesiak, M., Dudek, A. (2007), \emph{Symulacyjna optymalizacja wyboru procedury klasyfikacyjnej dla danego typu danych - charakterystyka problemu}, Zeszyty Naukowe Uniwersytetu Szczecinskiego nr 450, 635-646. 
}
\seealso{\code{\link{data.Normalization}}, \code{\link{dist.GDM}}, \code{\link{dist.BC}}, \code{\link{dist.SM}}, \code{\link{index.G1}}, \code{\link{index.G2}}, 

\code{\link{index.G3}}, \code{\link{index.S}}, \code{\link{index.KL}}, \code{\link{hclust}}, \code{\link{dist}},
}
\examples{
library(clusterSim)
data(data_ratio)
cluster.Sim(data_ratio, 1, 2, 3, "G1", outputCsv="results1")
data(data_interval)
cluster.Sim(data_interval, 2, 2, 4, "G1", outputHtml="results2")
data(data_ordinal)
cluster.Sim(data_ordinal, 3, 2, 4,"G2", outputCsv2="results3")
data(data_nominal)
cluster.Sim(data_nominal, p=4, 2, 4, icq="G3", outputHtml="results4", methods=c("m2","m3","m5"))
data(data_binary)
cluster.Sim(data_binary, p=5, 2, 4, icq="S", outputHtml="results5", distances=c("b1","b3","b6"))
data(data_ratio)
cluster.Sim(data_ratio, 1, 2, 4,"G1", outputCsv="results6",normalizations=c("n1","n3"),
distances=c("d2","d5"),methods=c("m5","m3","m1"))
}
\keyword{cluster}
\keyword{data}
\keyword{optimize}
\keyword{multivariate}