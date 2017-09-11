\name{initial.Centers}
\alias{initial.Centers}
\title{Calculation of initial clusters centers for k-means like alghoritms}
\description{Function calculates initial clusters centers for k-means like alghoritms with the following alghoritm (similar to SPSS QuickCluster function)

(a) if the distance between \eqn{x_k}{x_k} and its closest cluster center is greater
than the distance between the two closest centers (\eqn{M_m}{M_m} and \eqn{M_n}{M_n} ), then \eqn{x_k}{x_k}
replaces either \eqn{M_m}{M_m} or \eqn{M_n}{M_n}, whichever is closer to \eqn{x_k}{x_k}.

(b) If \eqn{x_k}{x_k} does not replace a cluster initial center in (a), a second test is made:
If that distance \eqn{d_q}{d_q}  greater than the distance between \eqn{M_q}{M_q} and its closest
\eqn{M_i}{M_i}, then \eqn{x_k}{x_k} replaces \eqn{M_q}{M_q}. 

where:

\eqn{M_i}{M_i} - initial center of \emph{i-th} cluster

\eqn{x_k}{x_k} - vector of \emph{k-th} observation

\eqn{d(...,...)}{d(...,...)} - Euclidean distance

\eqn{d_{mn}}{d_{mn}} = \eqn{min_{ij}  d(M_i,M_j)}{min_{ij}  d(M_i,M_j)}

\eqn{d_q  = min_i d(x_k,M_i)}{d_q  = min_i d(x_k,M_i)}

}
\usage{
initial.Centers(x, k)
}
\arguments{
\item{x}{matrix or dataset}
\item{k}{number of initial cluster centers}
}
\value{
Numbers of objects choosen as initial cluster centers 
}
\author{
Marek Walesiak \email{marek.walesiak@ue.wroc.pl}, Andrzej Dudek \email{andrzej.dudek@ue.wroc.pl} 

Department of Econometrics and Computer Science, University of Economics, Wroclaw, Poland \url{http://keii.ue.wroc.pl/clusterSim}
}
\references{
Hartigan, J. (1975), \emph{Clustering algorithms}, Wiley, New York. ISBN 0-471-35645-X.
}
\seealso{
\code{\link{cluster.Sim}}
}
\examples{
#Example 1 (numbers of objects choosen as initial cluster centers)
library(clusterSim)
data(data_ratio)
ic <- initial.Centers(data_ratio, 10)
print(ic)

#Example 2 (application with kmeans algorithm)
library(clusterSim)
data(data_ratio)
kmeans(data_ratio,data_ratio[initial.Centers(data_ratio, 10),]) 

}
\keyword{cluster}