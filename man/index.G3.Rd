\name{index.G3}
\alias{index.G3}
\title{Calculates G3 internal cluster quality index}
\description{Calculates G3 Hubert & Levine internal cluster quality index}
\usage{index.G3(d,cl)}
\arguments{
\item{d}{'dist' object}
\item{cl}{A vector of integers indicating the cluster to which each object is allocated}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexG3\_details.pdf for further details
}
\value{
calculated G3 index
}
\references{
Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, p. 339.

Gordon, A.D. (1999), \emph{Classification}, Chapman & Hall/CRC, London, p. 62.

Milligan, G.W., Cooper, M.C. (1985), \emph{An examination of procedures of determining the number of cluster in a data set}, "Psychometrika", vol. 50, no. 2, 159-179. 

}
\author{
Marek Walesiak \email{Marek.Walesiak@ae.jgora.pl}, Andrzej Dudek \email{Andrzej.Dudek@ae.jgora.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://www.ae.jgora.pl/keii}
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.S}}, 
\code{\link{index.H}}, \code{\link{index.KL}}, \code{\link{index.Gap}}, \code{\link{index.DB}}
}
\examples{
# Example 1
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.G3(d,c$clustering)
print(icq)

# Example 2
library(clusterSim)
data(data_ordinal)
d <- dist.GDM(data_ordinal, method="GDM2")
# nc - number_of_clusters
min_nc=2
max_nc=6
res <- array(0,c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
hc <- hclust(d, method="complete")
cl2 <- cutree(hc, k=nc)
res[nc-min_nc+1,2] <- G3 <- index.G3(d,cl2)
clusters <- rbind(clusters,cl2)
}
print(paste("min G3 for",(min_nc:max_nc)[which.min(res[,2])],"clusters=",min(res[,2])))
print("clustering for min G3")
print(clusters[which.min(res[,2]),])
write.table(res,file="G3_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G3", xaxt="n")
axis(1, c(min_nc:max_nc))
}
\keyword{cluster}