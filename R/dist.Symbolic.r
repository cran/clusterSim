dist.Symbolic<-function(dane,type="U_2",gamma=0.5,power=2){
indivIC<-dane
individuals<-table.Symbolic$individuals
individualsNo<-dim(dane)[1]
variablesNo<-dim(dane)[2]
if (is.null(variableSelection))
	variableSelection=(1:variablesNo)
distS<-array(0,c(individualsNo,individualsNo))
for (i in 1:(individualsNo-1))
for (j in (i+1):individualsNo)
{
	D<-0
	for(k in variableSelection)
	{
	if (variables[k,"type"]=="IC")
	{
		 d<-(max(indivIC[i,k,2],indivIC[j,k,2])-min(indivIC[i,k,1],indivIC[j,k,1]))
		 if (!((indivIC[i,k,2]<=indivIC[j,k,1]) || (indivIC[j,k,2]<=indivIC[i,k,1])))
		{
			 if (indivIC[i,k,1]<=indivIC[j,k,1])
			{
				if (indivIC[i,k,2]<=indivIC[j,k,2])
					d<-d-(1-2*gamma)*abs(indivIC[i,k,2]-indivIC[j,k,1])
				else
					d<-d-(1-2*gamma)*abs(indivIC[j,k,2]-indivIC[j,k,1])
			}
			else
			{
				if (indivIC[j,k,2]<=indivIC[i,k,2])
					d<-d-(1-2*gamma)*abs(indivIC[j,k,2]-indivIC[i,k,1])
				else
					d<-d-(1-2*gamma)*abs(indivIC[i,k,2]-indivIC[i,k,1])
			}
		} 
		d<-d-gamma*abs(indivIC[j,k,2]-indivIC[j,k,1])
		d<-d-gamma*abs(indivIC[i,k,2]-indivIC[i,k,1])
	}
	D<-D+d^power
	}
	distS[i,j]<-D^(1/power)		
	distS[j,i]<-distS[i,j]
}
	as.dist(distS)
}