\name{comparing.Partitions}
\alias{comparing.Partitions}
\title{Calculate agreement indices between two partitions}
\description{Calculate agreement indices between two partitions}
\usage{comparing.Partitions(cl1,cl2,type="nowak")}
\arguments{
\item{cl1}{A vector of integers (or letters) indicating the cluster to which each object is allocated for first clustering }
\item{cl2}{A vector of integers (or letters) indicating the cluster to which each object is allocated for second clustering}
\item{type}{"rand" - for Rand index, "crand" - for adjusted Rand index or "nowak" for Nowak index}
}
\details{
See file $R_HOME\\library\\clusterSim\\pdf\\comparingPartitions_details.pdf for further details.

Rand and adjusted Rand indices uses \code{classAgreement} function from \code{e1071} library.
}
\value{
Returns value of index.
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim/}
}
\references{

Hubert, L., Arabie, P. (1985), \emph{Comparing partitions}, "Journal of Classification", no. 1, 193-218. Available at: \doi{10.1007/BF01908075}.

Nowak, E. (1985), \emph{Wskaznik podobienstwa wynikow podzialow}, "Przeglad Statystyczny" ["Statistical Review"], no. 1, 41-48.

Rand, W.M. (1971), \emph{Objective criteria for the evaluation of clustering methods}, "Journal of the American Statistical Association", no. 336, 846-850. Available at: \doi{10.1080/01621459.1971.10482356}.
}
\seealso{
\code{\link{replication.Mod}}
}
\examples{
# Example 1
library(clusterSim)
dataSet<-cluster.Gen(model=5)
cl1<-dataSet$clusters
cl2<-kmeans(dataSet$data,2)$cluster
print(comparing.Partitions(cl1,cl2,type="rand"))

# Example 2
library(clusterSim)
data(data_patternGDM1)
z<-data.Normalization(data_patternGDM1,type="n1")
d<-dist.GDM(z,method="GDM1")
cl1<-pam(d,3,diss=TRUE)$clustering
cl2<-pam(d,4,diss=TRUE)$clustering
print(comparing.Partitions(cl1,cl2,type="crand"))

# Example 3
library(clusterSim)
data(data_patternGDM1)
z<-data.Normalization(data_patternGDM1,type="n9")
d<-dist.GDM(z,method="GDM1")
cl1<-pam(d,3,diss=TRUE)$clustering
hc<-hclust(d, method="complete")
cl2<-cutree(hc,k=3)
print(comparing.Partitions(cl1,cl2,type="nowak"))
}
\keyword{cluster}