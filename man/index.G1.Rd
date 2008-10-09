\name{index.G1}
\alias{index.G1}
\title{Calculates Calinski-Harabasz pseudo F-statistic}
\description{Calculates Calinski-Harabasz pseudo F-statistic}
\usage{index.G1 (x,cl,d=NULL,centrotypes="centroids")}
\arguments{
\item{x}{data}
\item{cl}{A vector of integers indicating the cluster to which each object is allocated}
\item{d}{optional distance matrix, used for calculations if centrotypes="medoids"}
\item{centrotypes}{"centroids" or "medoids"}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexG1\_details.pdf for further details
}
\value{
Calinski-Harabasz pseudo F-statistic
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{

Calinski, R.B., Harabasz, J. (1974), \emph{A dendrite method for cluster analysis}, "Communications in Statistics", vol. 3, 1-27.

Everitt, B.S., Landau, E., Leese, M. (2001), \emph{Cluster analysis}, Arnold, London, p. 103.

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, p. 338.

Gordon, A.D. (1999), \emph{Classification}, Chapman & Hall/CRC, London, p. 62.

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, 159-179.

}
\seealso{
\code{\link{index.G2}},\code{\link{index.G3}},\code{\link{index.S}}, 
\code{\link{index.H}},\code{\link{index.KL}},\code{\link{index.Gap}}, \code{\link{index.DB}}
}
\examples{
# Example 1
library(clusterSim)
data(data_ratio)
c<- pam(data_ratio,10)
index.G1(data_ratio,c$clustering)

# Example 2
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="euclidean")
# nc - number_of_clusters
min_nc=2
max_nc=20
res <- array(0,c(max_nc-min_nc+1,2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl2 <- pam(md, nc, diss=TRUE)
res[nc-min_nc+1,2] <- G1 <- index.G1(data_ratio,cl2$cluster,centrotypes="centroids")
clusters <- rbind(clusters, cl2$cluster)
}
print(paste("max G1 for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max G1")
print(clusters[which.max(res[,2]),])
write.table(res,file="G1_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G1", xaxt="n")
axis(1, c(min_nc:max_nc))

# Example 3
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="euclidean")
# nc - number_of_clusters
min_nc=2
max_nc=20
res <- array(0,c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl2 <- pam(md, nc, diss=TRUE)
res[nc-min_nc+1,2] <- G1 <- index.G1(data_ratio,cl2$cluster,d=md,centrotypes="medoids")
clusters <- rbind(clusters, cl2$cluster)
}
print(paste("max G1 for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max G1")
print(clusters[which.max(res[,2]),])
write.table(res,file="G1_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G1", xaxt="n")
axis(1, c(min_nc:max_nc))
}
\keyword{cluster}