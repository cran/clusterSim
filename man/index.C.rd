\name{index.C}
\alias{index.C}
\title{Calculates Hubert & Levin C index - internal cluster quality index}
\description{Calculates Hubert & Levin C index - internal cluster quality index}
\usage{index.C(d,cl)}
\arguments{
\item{d}{'dist' object}
\item{cl}{A vector of integers indicating the cluster to which each object is allocated}
}
\details{
See file \$R\_HOME\\library\\clusterSim\\pdf\\indexC\_details.pdf for further details

Thanks to Özge Sahin from Technical University of Munich for for pointing the difference between \code{\link{index.G3}} and \code{\link{index.C}}.

}
\value{
calculated C index
}
\references{
Hubert, L.J., Levin, J.R. (1976), A General Statistical Framework for Assessing Categorical Clustering in Free Recall, Psychological Bulletin, Vol. 83, No. 6, 1072-1080.
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\seealso{
\code{\link{index.G1}}, \code{\link{index.G2}},  \code{\link{index.G3}}, \code{\link{index.S}}, 
\code{\link{index.H}}, \code{\link{index.KL}}, \code{\link{index.Gap}}, \code{\link{index.DB}}
}
\examples{
# Example 1
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.C(d,c$clustering)
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
res[nc-min_nc+1,2] <- C <- index.C(d,cl2)
clusters <- rbind(clusters,cl2)
}
print(paste("min C for",(min_nc:max_nc)[which.min(res[,2])],"clusters=",min(res[,2])))
print("clustering for min C-index")
print(clusters[which.min(res[,2]),])
#write.table(res,file="C_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="C", xaxt="n")
axis(1, c(min_nc:max_nc))
}
\keyword{cluster}
