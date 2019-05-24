.cdf<-function (x) 
{
    cl <- typeof(x)
    n <- length(x)
    a <- sum(is.na(x))
    if (n == 0L) 
        return(NaN)
    f <- factor(x)
    tf <- tabulate(f)
    n1 <- max(tf)
    if (a > 0L) {
        n2 <- ifelse(length(tf) > 1L, max(tf[tf != n1]), 0L)
        if (n2 + a >= n1) 
            return(as.vector(NA, mode = cl))
    }
    lf <- levels(f)[tf == n1]
    if (is.factor(x)) {
        return(as.factor(lf))
    }
    else {
        return(as.vector(lf, mode = cl))
    }
}

cluster.Description<-function (x, cl, sdType = "sample",precission=4,modeAggregationChar=";") 
{
  if (sdType != "sample" && sdType != "population") 
    stop("sdType parameter should be one of two values: sample or population")
  if (is.null(dim(x))) {
    dim(x) <- c(length(x), 1)
  }
  m <- ncol(x)
  n <- length(cl)
  k <- max(cl)
  result <- array(0, c(k, m, 5))
  for (i in 1:k) {
    for (j in 1:m) {
      result[i, j, 1] = round(as.numeric(mean(x[cl == i, j])),precission)
      result[i, j, 2] = round(sd(x[cl == i, j]),precission)
      if (sdType == "population") 
        if (sum(cl == i) == 1) {
          result[i, j, 2] = 0
        }
      else {
        result[i, j, 2] = round(sd(x[cl == i, j]) * sqrt((sum(cl == 
                                                          i) - 1)/sum(cl == i)),precission)
      }
      result[i, j, 3] = round(median(x[cl == i, j]),precission)
      result[i, j, 4] = round(mad(x[cl == i, j]),precission)
    }
    if (sum(cl == i) == 1) 
      result[i, , 5] <- round(x[cl == i, ],precission)
    else {
      t <- x[cl == i, ]
      if (m == 1) {
        result[i, 1, 5]<- paste(round(.cdf(t[j]),precission),collapse=modeAggregationChar) 
      }
      else for (j in 1:m) {
        result[i, j, 5]<- paste(round(.cdf(t[,j]),precission),collapse=modeAggregationChar) 
      }
    }
  }
  result
}
