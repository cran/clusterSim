data.Normalization<-function(x, type="n0")
{
	if(is.vector(x) && !is.list(x))
	{
                          if(is.numeric(resul<- x)) 
				resul <- switch(type,
				n0=x,
				n1=(x - mean(x))/sd(x),
				n2=(x - median(x))/mad(x),
				n3=(x - mean(x))/(max(x) - min(x)),
				n4=(x - min(x))/(max(x) - min(x)),
				n5=(x - mean(x))/(max(abs(x) - mean(x))),
				n6=x/sd(x),
				n7=x/(max(x) - min(x)),
				n8=x/max(x),
				n9=x/mean(x),
				n10=x/sum(x),
				n11=x/(sum(x^2)^0.5)
				)                               
                          else warning("Data not numeric, normalization not applicable")
				names(resul)<-names(x)
	}	
	else if(is.data.frame(x)) 
	{
		resul <- NULL
		for(nn in names(x)) 
		{
                                	if(is.numeric(x[,nn]))
			{
				resul <- switch(type,
				n0=cbind(resul, (x[,nn])),
				n1=cbind(resul, (x[,nn] - mean(x[,nn]))/(sd(x[,nn]))),
				n2=cbind(resul, (x[,nn] - median(x[,nn]))/(mad(x[,nn]))),
				n3=cbind(resul, (x[,nn] - mean(x[,nn]))/(max(x[,nn]) - min(x[,nn]))),
				n4=cbind(resul, (x[,nn] - min(x[,nn]))/(max(x[,nn]) - min(x[,nn]))),
				n5=cbind(resul, (x[,nn] - mean(x[,nn]))/(max(abs(x[,nn]) - mean(x[,nn])))),
				n6=cbind(resul, (x[,nn])/ sd(x[,nn])),
				n7=cbind(resul, (x[,nn])/(max(x[,nn]) - min(x[,nn]))),
				n8=cbind(resul, (x[,nn])/(max(x[,nn]))),
				n9=cbind(resul, (x[,nn])/(mean(x[,nn]))),
				n10=cbind(resul, (x[,nn])/(sum(x[,nn]))),
				n11=cbind(resul, (x[,nn])/(sum(x[,nn]^2)^0.5))
				)                                 	}
                                	else
			{
				resul<- cbind(resul, x[, nn])
			                warning("Data not numeric, normalization not applicable")
                                	 }
		}
		resul <- data.frame(resul)
		names(resul) <- names(x)
		row.names(resul) <- row.names(x)
	}
	else if(is.matrix(x)) 
	{ 		
		if(is.numeric(resul<- x))
		{
			resul <- NULL
			for(i in 1:ncol(x))
				resul <- switch(type,
				n0=cbind(resul, (x[, i])),
				n1=cbind(resul, (x[, i] - mean(x[, i]))/(sd(x[, i]))),
				n2=cbind(resul, (x[, i] - median(x[, i]))/(mad(x[, i]))),
				n3=cbind(resul, (x[, i] - mean(x[, i]))/(max(x[, i]) - min(x[, i]))),
				n4=cbind(resul, (x[, i] - min(x[, i]))/(max(x[, i]) - min(x[, i]))),
				n5=cbind(resul, (x[, i] - mean(x[, i]))/(max(abs(x[, i]) - mean(x[, i])))),
				n6=cbind(resul, (x[, i])/ sd(x[, i])),
				n7=cbind(resul, (x[, i])/(max(x[, i]) - min(x[, i]))),
				n8=cbind(resul, (x[, i])/(max(x[, i]))),
				n9=cbind(resul, (x[, i])/(mean(x[, i]))),
				n10=cbind(resul, (x[, i])/(sum(x[, i]))),
				n11=cbind(resul, (x[, i])/(sum(x[, i]^2)^0.5))
				)
		}
	  else warning("Data not numeric, normalization not applicable")
    dimnames(resul) <- dimnames(x)
	}			
	else if(is.list(x)) 
	{
		resul <- list(length(x))
		xx<-as.numeric(x)
		for(i in 1:length(x))
          	if(is.numeric(resul[[i]]<-x[[i]]))
				resul[[i]] <- switch(type,
				n0=x[[i]],
				n1=(x[[i]] - mean(xx))/sd(xx),
				n2=(x[[i]] - median(xx))/mad(xx),
				n3=(x[[i]] - mean(xx))/(max(xx) - min(xx)),
				n4=(x[[i]] - min(xx))/(max(xx) - min(xx)),
				n5=(x[[i]] - mean(xx))/(max(abs(xx) - mean(xx))),
				n6=x[[i]]/ sd(xx),
				n7=x[[i]]/(max(xx) - min(xx)),
				n8=x[[i]]/(max(xx)),
				n9=x[[i]]/(mean(xx)),
				n10=x[[i]]/(sum(xx)),
				n11=x[[i]]/(sum(xx^2)^0.5)
				)                               
                else warning("Data not numeric, normalization not applicable")
	}
        else if(!is.numeric(resul<-x))           
                         warning("Data not numeric, normalization not applicable")
        else stop("unknown input type")						
	resul
}
