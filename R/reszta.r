plotCategorial<-function(x, pairsofVar=NULL, cl=NULL, clColors=NULL,...)
{

pary<-function (x, labels, panel = points,  lower.panel = panel, 
    upper.panel = panel, diag.panel = NULL, ..., text.panel = textPanel, 
    label.pos = 0.5 + has.diag/3, cex.labels = NULL, font.labels = 1, 
    row1attop = TRUE, gap = 1) 
{
	innyDol<-innaGora<-TRUE
	if (identical(lower.panel,panel))
	{
		innyDol<-FALSE
	}
	if (identical(upper.panel,panel))
	{
		innaGora<-FALSE
	}
    textPanel <- function(x = 0.5, y = 0.5, txt, cex, font) text(x, 
        y, txt, cex = cex, font = font)
    localAxis1 <- function(side, x, y, xpd, bg, col = NULL, main, 
        oma, ...) {
        if (side%%2 == 1) 
            Axis(x, side = side, xpd = NA, ...)
        else Axis(y, side = side, xpd = NA, ...)
    }
    localAxis <- function(side, x, y, xpd, bg, col = NULL, main, 
        oma, ...) {
        if (side%%2 == 1)
            Axis(x,at=as.integer(levels(as.factor(x))), side = side, xpd = NA, ...)
        else Axis(y,at=as.integer(levels(as.factor(y))), side = side, xpd = NA, ...)
    }
    localPlot <- function(..., main, oma, font.main, cex.main) plot(...)
    localLowerPanel <- function(..., main, oma, font.main, cex.main) lower.panel(...)
    localUpperPanel <- function(..., main, oma, font.main, cex.main) upper.panel(...)
	lower.panel1<-lower.panel
	upper.panel1<-upper.panel
    localLowerPanel1 <- function(..., main, oma, font.main, cex.main) lower.panel1(...)
    localUpperPanel1 <- function(..., main, oma, font.main, cex.main) upper.panel1(...)
    dots <- list(...)
    nmdots <- names(dots)
    if (!is.matrix(x)) {
        x <- as.data.frame(x)
        for (i in seq(along = names(x))) {
            if (is.factor(x[[i]]) || is.logical(x[[i]])) 
                x[[i]] <- as.numeric(x[[i]])
            if (!is.numeric(unclass(x[[i]]))) 
                stop("non-numeric argument to 'pairs'")
        }
    }
    else if (!is.numeric(x)) 
        stop("non-numeric argument to 'pairs'")
    panel <- match.fun(panel)
    if ((has.lower <- !is.null(lower.panel)) && !missing(lower.panel)) 
        lower.panel <- match.fun(lower.panel)
    if ((has.upper <- !is.null(upper.panel)) && !missing(upper.panel)) 
        upper.panel <- match.fun(upper.panel)
    if ((has.diag <- !is.null(diag.panel)) && !missing(diag.panel)) 
        diag.panel <- match.fun(diag.panel)
    if (row1attop) {
        tmp <- lower.panel
        lower.panel <- upper.panel
        upper.panel <- tmp
        tmp <- has.lower
        has.lower <- has.upper
        has.upper <- tmp
    }
    nc <- ncol(x)
    if (nc < 2) 
        stop("only one column in the argument to 'pairs'")
    has.labs <- TRUE
    if (missing(labels)) {
        labels <- colnames(x)
        if (is.null(labels)) 
            labels <- paste("V", 1:nc)
    }
    else if (is.null(labels)) 
        has.labs <- FALSE
    oma <- if ("oma" %in% nmdots) 
        dots$oma
    else NULL
    main <- if ("main" %in% nmdots) 
        dots$main
    else NULL
    if (is.null(oma)) {
        oma <- c(4, 4, 4, 4)
        if (!is.null(main)) 
            oma[3] <- 6
    }
    opar <- par(mfrow = c(nc, nc), mar = rep.int(gap/2, 4), oma = oma)
    on.exit(par(opar))
    for (i in if (row1attop) 
        1:nc
    else nc:1) for (j in 1:nc) {
        localPlot(x[, j], x[, i], xlab = "", ylab = "", axes = FALSE, 
            type = "n", ...)
        if (i == j || (i < j && has.lower) || (i > j && has.upper)) {
            box()
            if (i == 1 && (!(j%%2) || !has.upper || !has.lower)) 
                localAxis(1 + 2 * row1attop, x[, j], x[, i], 
                  ...)
            if (i == nc && (j%%2 || !has.upper || !has.lower)) 
                localAxis(3 - 2 * row1attop, x[, j], x[, i], 
                  ...)
            if (j == 1 && (!(i%%2) || !has.upper || !has.lower)) 
                localAxis(2, x[, j], x[, i], ...)
            if (j == nc && (i%%2 || !has.upper || !has.lower)) 
                localAxis(4, x[, j], x[, i], ...)
            mfg <- par("mfg")
            if (i == j) {
                if (has.diag) 
                  diag.panel(as.vector(x[, i]))
                if (has.labs) {
                  par(usr = c(0, 1, 0, 1))
                  if (is.null(cex.labels)) {
                    l.wid <- strwidth(labels, "user")
                    cex.labels <- max(0.8, min(2, 0.9/max(l.wid)))
                  }
                  text.panel(0.5, label.pos, labels[i], cex = cex.labels, 
                    font = font.labels)
                }
            }
            else{
                        rozmiary<-as.vector(x[,i])
                        for (ii in 1:length(rozmiary))
                        {
                                rozmiary[ii]<-nrow(x[x[,i]==x[ii,i],][x[x[,i]==x[ii,i],j]==x[ii,j],])
                                
                        }
                        rozmiary<-rozmiary/max(rozmiary)*12/ncol(x)
            
             if (i > j)
             { 
                if(innyDol)
                {
					localLowerPanel1(x[, c(j,i)],...)
				}
				else
				{
					points(as.vector(x[, j]), as.vector(x[,i]), cex=rozmiary,...)
				}
             }
            else 
            {
            
								if(innaGora)
								{
                                localUpperPanel1(x[, c(j,i)],...)
                                }
                                else
                                {
                                points(as.vector(x[, j]), as.vector(x[,i]),cex=rozmiary,...)
                                }
                                }
                        }
            if (any(par("mfg") != mfg)) 
                stop("the 'panel' function made a new plot")
        }
        else par(new = FALSE)
    }
    if (!is.null(main)) {
        font.main <- if ("font.main" %in% nmdots) 
            dots$font.main
        else par("font.main")
        cex.main <- if ("cex.main" %in% nmdots) 
            dots$cex.main
        else par("cex.main")
        mtext(main, 3, 3, TRUE, 0.5, cex = cex.main, font = font.main)
    }
    invisible(NULL)
}

	data<-x
	if (!is.null(pairsofVar))
	{
		data<-data[,pairsofVar]
	}
	plot(0., 0., xlim = c(0, max(data[,1])+1), ylim = c(0,max(data[,2])+1),axes = FALSE, xlab = "", ylab = "",type="n")
	clusters<-cl
	if(!is.null(cl))
	{
		if (!is.null(clColors))
		{
				prawda<-FALSE
				if (class(clColors)=="logical")
					if (clColors==TRUE)
					{
						prawda<-TRUE
					}
				if (prawda)
				{
					colorsnames<-rainbow(max(cl)+1)
				} 
				else
				{
					colorsnames<-clColors
				}
		}
		else
		{
			colorsnames<-rainbow(max(cl)+1)
		}		
		pary(data,col=(colorsnames[clusters]),pch=16,...)
	}
	else
	{
		pary(data,col=rainbow(10)[sample(1:10,1)],pch=16,...)
	}
}

plotCategorial3d<-function(x, tripleofVar=c(1,2,3), cl=NULL, clColors=NULL,...)
{
	require("rgl")
	rozmiary<-x[,1]
	klasy<-cl
	x<-x[,tripleofVar]
	dane<-x
	for (i in 1:length(rozmiary))
	{
		t<-dane[dane[,1]==dane[i,1],][dane[dane[,1]==dane[i,1],2]==dane[i,2],]
		rozmiary[i]<-nrow(t[t[,3]==dane[i,3],])
		
	}
	rozmiary<-data.Normalization(rozmiary,type="n4")
	plot3d(0., 0.,0., xlim = c(0, max(dane[,1])+1), ylim = c(0,max(dane[,2])+1),zlim = c(0,max(dane[,3])+1), xlab = "", ylab = "",zlab="",type="n",axes=FALSE,zoom=3,...)
	#open3d
	kolor=rainbow(10)[sample(1:10,1)]
	for (i in 1:nrow(dane))
	{
		if(!is.null(cl))
		{
		if (!is.null(clColors))
		{
			prawda<-FALSE
			if (class(clColors)=="logical")
				if (clColors==TRUE)
				{
					prawda<-TRUE
				}
				if (prawda)
				{
					colorsnames<-rainbow(max(cl)+1)
				} 
				else
				{
					colorsnames<-clColors
				}
			}
			else
			{
				colorsnames<-rainbow(max(cl)+1)
			}
			spheres3d(dane[i,1],dane[i,2],dane[i,3],rozmiary[i],color=(colorsnames[klasy[i]]))
		}
		else
		{
			spheres3d(dane[i,1],dane[i,2],dane[i,3],rozmiary[i],color=kolor)
		}
	}
}


dist.Symbolic<-function(data,type="U_2",gamma=0.5,power=2){
indivIC<-dane
individualsNo<-dim(dane)[1]
variablesNo<-dim(dane)[2]
variableSelection<-(1:variablesNo)
distS<-array(0,c(individualsNo,individualsNo))
dane<-data
if (type=="U_2")
{
	for (i in 1:(individualsNo-1))
	for (j in (i+1):individualsNo)
	{
		D<-0
		for(k in variableSelection)
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
		distS[i,j]<-D^(1/power)		
		distS[j,i]<-distS[i,j]
	}
		resul<-as.dist(distS)
}
if (type=="M")
{
	xmean<-array(0,c(dim(dane)[1],dim(dane)[2]))
	for (i in 1:dim(dane)[1])
	{
		xmean[i,]<-apply(dane[i,,],2,"mean")
		
	}
	resul<-dist(xmean,method="minkowski",p=power)
}
if (type=="H" || type=="S")
{
	zmienne<-0
	zmienne<-dim(dane)[2]
	for (i in 1:(individualsNo-1))
	for (j in (i+1):individualsNo)
	{
		if (type=="S")
		{
			distS[j,i]<-2^(zmienne-1)*(dist(rbind(dane[i,,1],dane[j,,1]))^2+dist(rbind(dane[i,,2],dane[j,,2]^2)))
			distS[i,j]<-distS[j,i]
		}
		
		if (type=="H")
		{
			s<-0
			for (k in 1:zmienne)
			{
				s<-s+max(c(abs(dane[i,k,1]-dane[j,k,1]),abs(dane[i,k,1]-dane[j,k,1])))^2
			}
			distS[i,j]<-distS[j,i]<-s^0.5
		}			
	}
	resul=as.dist(distS)
}

resul
}


plotInterval<-function(x, pairsofsVar=NULL, cl=NULL, clColors=NULL,...)
{
	paryPrzedzialy<-function (x, labels, panel = points, ..., lower.panel = panel, 
		upper.panel = panel, diag.panel = NULL, text.panel = textPanel, 
		label.pos = 0.5 + has.diag/3, cex.labels = NULL, font.labels = 1, 
		row1attop = TRUE, gap = 1,colors=NULL,scale=NULL) 
	{
		textPanel <- function(x = 0.5, y = 0.5, txt, cex, font) text(x, 
			y, txt, cex = cex, font = font)
		localAxis <- function(side, x, y, xpd, bg, col = NULL, main, 
			oma, ...) {
			if (side%%2 == 1) 
				Axis(x, side = side, xpd = NA, ...)
			else Axis(y, side = side, xpd = NA, ...)
		}
		localPlot <- function(..., main, oma, font.main, cex.main) plot(...)
		localLowerPanel <- function(..., main, oma, font.main, cex.main) lower.panel(...)
		localUpperPanel <- function(..., main, oma, font.main, cex.main) upper.panel(...)
		dots <- list(...)
		nmdots <- names(dots)
		xprim<-x[,,2]
		x<-x[,,1]
		if (!is.matrix(x)) {
			x <- as.data.frame(x)
			for (i in seq(along = names(x))) {
				if (is.factor(x[[i]]) || is.logical(x[[i]])) 
					x[[i]] <- as.numeric(x[[i]])
				if (!is.numeric(unclass(x[[i]]))) 
					stop("non-numeric argument to 'pairs'")
			}
		}
		else if (!is.numeric(x)) 
			stop("non-numeric argument to 'pairs'")
		panel <- match.fun(panel)
		if ((has.lower <- !is.null(lower.panel)) && !missing(lower.panel)) 
			lower.panel <- match.fun(lower.panel)
		if ((has.upper <- !is.null(upper.panel)) && !missing(upper.panel)) 
			upper.panel <- match.fun(upper.panel)
		if ((has.diag <- !is.null(diag.panel)) && !missing(diag.panel)) 
			diag.panel <- match.fun(diag.panel)
		if (row1attop) {
			tmp <- lower.panel
			lower.panel <- upper.panel
			upper.panel <- tmp
			tmp <- has.lower
			has.lower <- has.upper
			has.upper <- tmp
		}
		nc <- ncol(x)
		if (nc < 2) 
			stop("only one column in the argument to 'pairs'")
		has.labs <- TRUE
		if (missing(labels)) {
			labels <- colnames(x)
			if (is.null(labels)) 
				labels <- paste("V", 1:nc)
		}
		else if (is.null(labels)) 
			has.labs <- FALSE
		oma <- if ("oma" %in% nmdots) 
			dots$oma
		else NULL
		main <- if ("main" %in% nmdots) 
			dots$main
		else NULL
		if (is.null(oma)) {
			oma <- c(4, 4, 4, 4)
			if (!is.null(main)) 
				oma[3] <- 6
		}
		opar <- par(mfrow = c(nc, nc), mar = rep.int(gap/2, 4), oma = oma)
		on.exit(par(opar))
		for (i in if (row1attop) 
			1:nc
		else nc:1) for (j in 1:nc) {
			if (is.null(scale))
			localPlot(c(x[, j],xprim[,j]), c(x[, i],xprim[,i]), xlab = "", ylab = "", axes = FALSE, 
				type = "n",xlim = c(min(x[,i])-1, max(xprim[,i])+1), ylim = c(min(x[,j])-1,max(xprim[,j])+1),...)
			else
					localPlot(c(x[, j],xprim[,j]), c(x[, i],xprim[,i]), xlab = "", ylab = "", axes = FALSE, 
				type = "n",xlim = scale, ylim = scale,...)
	
	#
			if (i == j || (i < j && has.lower) || (i > j && has.upper)) {
				box()
				if (i == 1 && (!(j%%2) || !has.upper || !has.lower)) 
					localAxis(1 + 2 * row1attop, x[, j], x[, i], 
					  ...)
				if (i == nc && (j%%2 || !has.upper || !has.lower)) 
					localAxis(3 - 2 * row1attop, x[, j], x[, i], 
					  ...)
				if (j == 1 && (!(i%%2) || !has.upper || !has.lower)) 
					localAxis(2, x[, j], x[, i], ...)
				if (j == nc && (i%%2 || !has.upper || !has.lower)) 
					localAxis(4, x[, j], x[, i], ...)
				mfg <- par("mfg")
				if (i == j) {
					if (has.diag) 
					  diag.panel(as.vector(x[, i]))
					if (has.labs) {
					  par(usr = c(0, 1, 0, 1))
					  if (is.null(cex.labels)) {
						l.wid <- strwidth(labels, "user")
						cex.labels <- max(0.8, min(2, 0.9/max(l.wid)))
					  }
					  text.panel(0.5, label.pos, labels[i], cex = cex.labels, 
						font = font.labels)
					}
				}
				else
				{
					for (kk in 1:dim(x)[1])
					{
					lines(c(x[kk,i],x[kk,i]),c(x[kk,j],xprim[kk,j]),col=colors[kk])
					lines(c(x[kk,i],xprim[kk,i]),c(xprim[kk,j],xprim[kk,j]),col=colors[kk])
					lines(c(xprim[kk,i],xprim[kk,i]),c(xprim[kk,j],x[kk,j]),col=colors[kk])
					lines(c(xprim[kk,i],x[kk,i]),c(x[kk,j],x[kk,j]),col=colors[kk])
					}
				}
				if (any(par("mfg") != mfg)) 
					stop("the 'panel' function made a new plot")
			}
			else par(new = FALSE)
		}
		if (!is.null(main)) {
			font.main <- if ("font.main" %in% nmdots) 
				dots$font.main
			else par("font.main")
			cex.main <- if ("cex.main" %in% nmdots) 
				dots$cex.main
			else par("cex.main")
			mtext(main, 3, 3, TRUE, 0.5, cex = cex.main, font = font.main)
		}
		invisible(NULL)
	}
	

	data<-x
	if (!is.null(pairsofsVar))
	{
		data<-data[,pairsofsVar,]
	}
	plot(0., 0.,axes = FALSE, xlab = "", ylab = "",type="n",...)
	clusters<-cl

	if(!is.null(cl))
	{
		if (!is.null(clColors))
		{
				prawda<-FALSE
				if (class(clColors)=="logical")
					if (clColors==TRUE)
					{
						prawda<-TRUE
					}
				if (prawda)
				{
					colorsnames<-rainbow(max(cl)+1)
				} 
				else
				{
					colorsnames<-clColors
				}
		}
		else
		{
			colorsnames<-rainbow(max(cl)+1)
		}
		paryPrzedzialy(data,colors=(colorsnames[cl]),pch=16,scale=NULL)
	}
	else
	{
		paryPrzedzialy(data,colors=rep(rainbow(10)[sample(1:10,1)],dim(x)[1]),pch=16,scale=NULL)
		
	}

} 
