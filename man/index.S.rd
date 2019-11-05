\name{index.S}
\alias{index.S}
\title{Calculates Rousseeuw's Silhouette internal cluster quality index}
\description{Calculates Rousseeuw's Silhouette internal cluster quality index}
\usage{index.S(d,cl,singleObject=0)}
\arguments{
\item{d}{'dist' object}
\item{cl}{A vector of integers indicating the cluster to which each object is allocated}
\item{singleObject}{0 - s(i)=0 or 1 - s(i)=1. When cluster contains a single object, it is unclear how a(i) of Silhouette index should be defined (see Kaufman & Rousseeuw (1990), p. 85).}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexS\_details.pdf for further details
}
\value{
calculated Silhouette index
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{

Gatnar, E., Walesiak, M. (Eds.) (2004), \emph{Metody statystycznej analizy wielowymiarowej w badaniach marketingowych [Multivariate statistical analysis methods in marketing research]}, Wydawnictwo AE, Wroclaw, 342-343, erratum. Available at: \url{http://keii.ue.wroc.pl/pracownicy/mw/2004_Gatnar_Walesiak_Metody_SAW_w_badaniach_marketingowych.pdf}.

Kaufman, L., Rousseeuw, P.J. (1990), \emph{Finding groups in data: an introduction to cluster analysis}, Wiley, New York, pp. 83-88. ISBN: 978-0-471-73578-6.
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}}, \code{\link{index.G3}}, \code{\link{index.C}},
\code{\link{index.KL}}, \code{\link{index.H}}, \code{\link{index.Gap}}, \code{\link{index.DB}}
}
\examples{
# Example 1
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.S(d,c$clustering)
print(icq)

# Example 2
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="manhattan")
# nc - number_of_clusters
min_nc=2
max_nc=20
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl2 <- pam(md, nc, diss=TRUE)
res[nc-min_nc+1, 2] <- S <- index.S(md,cl2$cluster)
clusters <- rbind(clusters, cl2$cluster)
}
print(paste("max S for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max S")
print(clusters[which.max(res[,2]),])
#write.table(res,file="S_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="S",xaxt="n")
axis(1, c(min_nc:max_nc))
}
\keyword{cluster}