\name{data_symbolic_interval_polish_voivodships}
\alias{data_symbolic_interval_polish_voivodships}
\docType{data}
\title{The evaluation of Polish voivodships tourism attractiveness level}
\description{The empirical study uses the statistical data referring to the attractiveness level of 18 objects (16 Polish NUTS-2 regions - voivodships, pattern and anti-pattern object). 

Two-stage data collection was performed. Firstly, data on tourist attractiveness were collected for 380 counties using 9 classic metric variables (measured on a ratio scale): 

x1 - beds in hotels per 1000 inhabitants of a county,

x2 - number of nights spent daily by resident tourists per 1000 inhabitants of a county,

x3 - number of nights spent daily by foreign tourists per 1000 inhabitants of a county, 

x4 - dust pollution emission in tons per 10 km2 of a county area,

x5 - gas pollution emission in tons per 1 km2 of a county area,

x6 - number of criminal offences, crimes against life and health and property crimes per 1000 inhabitants of a county,

x7 - forest cover of the county in %,

x8 - participants of mass events per 1000 inhabitants of a county,

x9 - number of tourist economy entities (sections: I, N79) registered in the system REGON per 1000 inhabitants of a county. 

The three variables (x4, x5 and x6) are destimulants. Other variables are stimulants.

In the second step, the data were aggregated to the level of the voivodships (NUTS-2), giving the symbolic interval-valued data. The lower bound of the interval for each symbolic interval-valued variable in the voivodship was obtained by calculating the first quartile on the basis of data from counties. The upper bound of the interval was obtained by calculating the third quartile.
}
\format{Tree-dimansional array: 18 objects (16 Polish NUTS-2 regions - voivodships, pattern and anti-pattern object), 9 symbolic interval-valued variables with lower and upper values of interval in third dimension. The coordinates of an pattern object cover the most preferred preference variable values.
The coordinates of an anti-pattern object cover the least preferred preference variable values.}
\source{
The statistical data were collected in 2016 and come from the Local Data Bank of the Central Statistical Office of Poland.
}
\examples{
library(clusterSim)
data(data_symbolic_interval_polish_voivodships)
print(data_symbolic_interval_polish_voivodships)
}
\keyword{data set}