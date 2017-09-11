data.Normalization<-function (x, type = "n0", normalization = "column") 
{
    bycolumn = T
    if (normalization == "row") 
        bycolumn = F
    if (is.vector(x) && !is.list(x)) {
        if (is.numeric(resul <- x)) {
            resul <- switch(type, n0 = x, n1 = (x - mean(x))/sd(x), 
                n2 = (x - median(x))/mad(x), n3 = (x - mean(x))/(max(x) - 
                  min(x)), n3a = (x - median(x))/(max(x) - min(x)), 
                n4 = (x - min(x))/(max(x) - min(x)), n5 = (x - 
                  mean(x))/(max(abs((x) - mean(x)))), n5a = (x - 
                  median(x))/(max(abs((x) - median(x)))), n6 = x/sd(x), 
                n6a = x/mad(x), n7 = x/(max(x) - min(x)), n8 = x/max(x), 
                n9 = x/mean(x), n9a = x/median(x), n10 = x/sum(x), 
                n11 = x/(sum(x^2)^0.5), n12 = (x - mean(x))/(sum((x - 
                  mean(x))^2)^0.5), 
                n12a = (x - median(x))/(sum((x - median(x))^2)^0.5),
                n13 = (x - ((max(x)+min(x))/2))/((max(x) - min(x))/2))
            params<- switch(type, n0 = c(0,1), n1 = c(mean(x),sd(x)), 
                n2 = c(median(x),mad(x)), n3 = c(mean(x),max(x) - 
                  min(x)), n3a = c(median(x),max(x) - min(x)), 
                n4 = c(min(x),max(x) - min(x)), n5 = c( 
                  mean(x),max(abs((x) - mean(x)))), n5a = c((
                  median(x)),(max(abs((x) - median(x))))), n6 = c(0,sd(x)), 
                n6a = c(0,mad(x)), n7=c(0,(max(x) - min(x))), n8 = c(0,max(x)), 
                n9 = c(0/mean(x)), n9a = c(0/median(x)), n10 = c(0/sum(x)), 
                n11 = c(0,(sum(x^2)^0.5)), n12 = c((mean(x)),(sum((x - 
                  mean(x))^2)^0.5)), 
                n12a = c((median(x)),(sum((x - median(x))^2)^0.5)),
                n13 = c((((max(x)+min(x))/2)),((max(x) - min(x))/2)))
            center<-params[1]
            scale<-params[2]
        }
        else warning("Data not numeric, normalization not applicable")
        names(resul) <- names(x)
    }
    else if (is.data.frame(x)) {
        resul <- NULL
        params <- NULL
        if (bycolumn) {
            for (nn in names(x)) {
                if (is.numeric(x[, nn])) {
                  resul <- switch(type, n0 = cbind(resul, (x[, 
                    nn])), n1 = cbind(resul, (x[, nn] - mean(x[, 
                    nn]))/(sd(x[, nn]))), n2 = cbind(resul, (x[, 
                    nn] - median(x[, nn]))/(mad(x[, nn]))), n3 = cbind(resul, 
                    (x[, nn] - mean(x[, nn]))/(max(x[, nn]) - 
                      min(x[, nn]))), n3a = cbind(resul, (x[, 
                    nn] - median(x[, nn]))/(max(x[, nn]) - min(x[, 
                    nn]))), n4 = cbind(resul, (x[, nn] - min(x[, 
                    nn]))/(max(x[, nn]) - min(x[, nn]))), n5 = cbind(resul, 
                    (x[, nn] - mean(x[, nn]))/(max(abs(x[, nn] - 
                      mean(x[, nn]))))), n5a = cbind(resul, (x[, 
                    nn] - median(x[, nn]))/(max(abs(x[, nn] - 
                    median(x[, nn]))))), n6 = cbind(resul, (x[, 
                    nn])/sd(x[, nn])), n6a = cbind(resul, (x[, 
                    nn])/mad(x[, nn])), n7 = cbind(resul, (x[, 
                    nn])/(max(x[, nn]) - min(x[, nn]))), n8 = cbind(resul, 
                    (x[, nn])/(max(x[, nn]))), n9 = cbind(resul, 
                    (x[, nn])/(mean(x[, nn]))), n9a = cbind(resul, 
                    (x[, nn])/(median(x[, nn]))), n10 = cbind(resul, 
                    (x[, nn])/(sum(x[, nn]))), n11 = cbind(resul, 
                    (x[, nn])/(sum(x[, nn]^2)^0.5)), n12 = cbind(resul, 
                    (x[, nn] - mean(x[, nn]))/(sum((x[, nn] - 
                      mean(x[, nn]))^2)^0.5)), 
                     n12a = cbind(resul, (x[, nn] - median(x[, nn]))/(sum((x[, nn] - 
                      median(x[, nn]))^2)^0.5)),
                     n13 = cbind(resul, (x[, nn] - ((max(x[, nn])+min(x[, nn]))/2))/((max(x[, nn]) - min(x[, nn]))/2)))

                  p <- switch(type, n0 = c(0,1), n1 = c( ( mean(x[, 
                    nn])),(sd(x[, nn]))), n2 = c(median(x[, nn]),(mad(x[, nn]))), n3 = c( 
                    ( mean(x[, nn])),(max(x[, nn]) - 
                      min(x[, nn]))), n3a = c(median(x[, nn]),(max(x[, nn]) - min(x[, 
                    nn]))), n4 = c( ( min(x[, 
                    nn])),(max(x[, nn]) - min(x[, nn]))), n5 = c( 
                    ( mean(x[, nn])),(max(abs( 
                      mean(x[, nn]))))), n5a = c( (x[, 
                    nn] - median(x[, nn])),(max(abs( 
                    median(x[, nn]))))), n6 = c( 0,sd(x[, nn])), 
                    n6a = c( (0),mad(x[, nn])), n7 = c( 0,max(x[, nn]) - min(x[, nn])), n8 = c( 
                    0,(max(x[, nn]))), n9 = c( 
                    0,mean(x[, nn])), n9a = c( 
                    0,median(x[, nn])), n10 = c( 
                    0,sum(x[, nn])), n11 = c( 
                    0,(sum(x[, nn]^2)^0.5)), n12 = c( 
                    ( mean(x[, nn])),(sum(( 
                      mean(x[, nn]))^2)^0.5)), 
                     n12a = c(median(x[, nn])/(sum((x[, nn] - 
                      median(x[, nn]))^2)^0.5)),
                     n13 = c( ((max(x[, nn])+min(x[, nn]))/2),((max(x[, nn]) - min(x[, nn]))/2)))
                 params<-cbind(params,p)
                }
                else {
                  resul <- cbind(resul, x[, nn])
                  params<-cbind(params,c(NA,NA))
                  warning("Data not numeric, normalization not applicable")
                }
            }
            center<-params[1,]
            scale<-params[2,]
        }
        else {
            for (nn in 1:nrow(x)) {
                if (sum(is.na(as.numeric((x[nn, ])))) == 0) {
                  resul <- switch(type, n0 = rbind(resul, (x[nn, 
                    ])), n1 = rbind(resul, (x[nn, ] - mean(as.numeric(x[nn, 
                    ])))/(sd(as.numeric(x[nn, ])))), n2 = rbind(resul, 
                    (x[nn, ] - median(as.numeric(x[nn, ])))/(mad(as.numeric(x[nn, 
                      ])))), n3 = rbind(resul, (x[nn, ] - mean(as.numeric(x[nn, 
                    ])))/(max(as.numeric(x[nn, ])) - min(as.numeric(x[nn, 
                    ])))), n3a = rbind(resul, (x[nn, ] - median(as.numeric(x[nn, 
                    ])))/(max(as.numeric(x[nn, ])) - min(as.numeric(x[nn, 
                    ])))), n4 = rbind(resul, (x[nn, ] - min(as.numeric(x[nn, 
                    ])))/(max(as.numeric(x[nn, ])) - min(as.numeric(x[nn, 
                    ])))), n5 = rbind(resul, (x[nn, ] - mean(as.numeric(x[nn, 
                    ])))/(max(abs(as.numeric(x[nn, ]) - mean(as.numeric(x[nn, 
                    ])))))), n5a = rbind(resul, (x[nn, ] - median(as.numeric(x[nn, 
                    ])))/(max(abs(as.numeric(x[nn, ]) - median(as.numeric(x[nn, 
                    ])))))), n6 = rbind(resul, (x[nn, ])/sd(as.numeric(x[nn, 
                    ]))), n6a = rbind(resul, (x[nn, ])/mad(as.numeric(x[nn, 
                    ]))), n7 = rbind(resul, (x[nn, ])/(max(as.numeric(x[nn, 
                    ])) - min(as.numeric(x[nn, ])))), n8 = rbind(resul, 
                    (x[nn, ])/(max(as.numeric(x[nn, ])))), n9 = rbind(resul, 
                    (x[nn, ])/(mean(as.numeric(x[nn, ])))), n9a = rbind(resul, 
                    (x[nn, ])/(median(as.numeric(x[nn, ])))), 
                    n10 = rbind(resul, (x[nn, ])/(sum(as.numeric(x[nn, 
                      ])))), n11 = rbind(resul, (x[nn, ])/(sum(as.numeric(x[nn, 
                      ])^2)^0.5)), n12 = rbind(resul, (x[nn, 
                      ] - mean(as.numeric(x[nn, ])))/(sum((as.numeric(x[nn, 
                      ]) - mean(as.numeric(x[nn, ])))^2)^0.5)), 
                    n12a = rbind(resul, (x[nn, ] - median(as.numeric(x[nn, 
                      ])))/(sum((as.numeric(x[nn, ]) - median(as.numeric(x[nn, 
                      ])))^2)^0.5)),
                    n13 = rbind(resul, (x[nn, ] - ((max(as.numeric(x[nn, ]))+min(as.numeric(x[nn, ])))/2))/
                    ((max(as.numeric(x[nn, ])) - min(as.numeric(x[nn, ])))/2)))
                  p <- switch(type, n0 = c(0,1), n1 = c( mean(x[nn,]),(sd(x[nn,])))
                    , n2 = c(median(x[nn,]),(mad(x[nn,]))), n3 = c( 
                    ( mean(x[nn,])),(max(x[nn,]) - 
                      min(x[nn,]))), n3a = c(median(x[nn,]),(max(x[nn,]) - min(x[nn, 
                    ]))), n4 = c( ( min(x[nn, 
                    ])),(max(x[nn,]) - min(x[nn,]))), n5 = c( 
                    ( mean(x[nn,])),(max(abs( 
                      mean(x[nn,]))))), n5a = c( (x[nn, 
                    ] - median(x[nn,])),(max(abs( 
                    median(x[nn,]))))), n6 = c( 0,sd(x[nn,])), 
                    n6a = c( (0),mad(x[nn,])), n7 = c( 0,max(x[nn,]) - min(x[nn,])), n8 = c( 
                    0,max(x[nn,])), n9 = c( 
                    0,mean(x[nn,])), n9a = c( 
                    0,median(x[nn,])), n10 = c( 
                    0,sum(x[nn,])), n11 = c( 
                    0,(sum(x[nn,]^2)^0.5)), n12 = c( 
                    ( mean(x[nn,])),(sum(( 
                      mean(x[nn,]))^2)^0.5)), 
                     n12a = c(median(x[nn,])/(sum((x[nn,] - 
                      median(x[nn,]))^2)^0.5)),
                     n13 = c( ((max(x[nn,])+min(x[nn,]))/2),((max(x[nn,]) - min(x[nn,]))/2)))

                 params<-cbind(params,p)

                }
                else {
                  resul <- rbind(resul, x[nn, ])
                  params<-cbind(params,c(NA,NA))
                  warning("Data not numeric, normalization not applicable")
                }
            }
        }
        resul <- data.frame(resul)
        center<-params[1,]
        scale<-params[2,]
        names(resul) <- names(x)
        row.names(resul) <- row.names(x)
        if(bycolumn){
          if(!is.null(dimnames(x)[[2]])){
            names(center)<-dimnames(x)[[2]]
            names(scale)<-dimnames(x)[[2]]
          }
          else{
            names(center)<-1:ncol(x)
            names(scale)<-1:ncol(x)
          }
        }
        else{
          if(!is.null(dimnames(x)[[1]])){
            names(center)<-dimnames(x)[[1]]
            names(scale)<-dimnames(x)[[1]]
          }
          else{
            names(center)<-1:nrow(x)
            names(scale)<-1:nrow(x)
          }
        }
    }
    else if (is.matrix(x)) {
        if (is.numeric(resul <- x)) {
            params<-NULL
            resul <- NULL
            if (bycolumn) {
                for (i in 1:ncol(x)) {
                resul <- switch(type, n0 = cbind(resul, 
                  (x[, i])), n1 = cbind(resul, (x[, i] - mean(x[, 
                  i]))/(sd(x[, i]))), n2 = cbind(resul, (x[, 
                  i] - median(x[, i]))/(mad(x[, i]))), n3 = cbind(resul, 
                  (x[, i] - mean(x[, i]))/(max(x[, i]) - min(x[, 
                    i]))), n3a = cbind(resul, (x[, i] - median(x[, 
                  i]))/(max(x[, i]) - min(x[, i]))), n4 = cbind(resul, 
                  (x[, i] - min(x[, i]))/(max(x[, i]) - min(x[, 
                    i]))), n5 = cbind(resul, (x[, i] - mean(x[, 
                  i]))/(max(abs(x[, i] - mean(x[, i]))))), n5a = cbind(resul, 
                  (x[, i] - median(x[, i]))/(max(abs(x[, i] - 
                    median(x[, i]))))), n6 = cbind(resul, (x[, 
                  i])/sd(x[, i])), n6a = cbind(resul, (x[, i])/mad(x[, 
                  i])), n7 = cbind(resul, (x[, i])/(max(x[, i]) - 
                  min(x[, i]))), n8 = cbind(resul, (x[, i])/(max(x[, 
                  i]))), n9 = cbind(resul, (x[, i])/(mean(x[, 
                  i]))), n9a = cbind(resul, (x[, i])/(median(x[, 
                  i]))), n10 = cbind(resul, (x[, i])/(sum(x[, 
                  i]))), n11 = cbind(resul, (x[, i])/(sum(x[, 
                  i]^2)^0.5)), n12 = cbind(resul, (x[, i] - mean(x[, 
                  i]))/(sum((x[, i] - mean(x[, i]))^2)^0.5)), 
                  n12a = cbind(resul, (x[, i] - median(x[, i]))/(sum((x[, 
                    i] - median(x[, i]))^2)^0.5)),
                  n13 = cbind(resul, (x[, i] - ((max(x[, i])+min(x[, i]))/2))/((max(x[, i]) - min(x[, i]))/2)))
                  
                    p <- switch(type, n0 = c(0,1), n1 = c( ( mean(x[, 
                    i])),(sd(x[, i]))), n2 = c(median(x[, i]),(mad(x[, i]))), n3 = c( 
                    ( mean(x[, i])),(max(x[, i]) - 
                      min(x[, i]))), n3a = c(median(x[, i]),(max(x[, i]) - min(x[, 
                    i]))), n4 = c( ( min(x[, 
                    i])),(max(x[, i]) - min(x[, i]))), n5 = c( 
                    ( mean(x[, i])),(max(abs( 
                      mean(x[, i]))))), n5a = c( (x[, 
                    i] - median(x[, i])),(max(abs( 
                    median(x[, i]))))), n6 = c( 0,sd(x[, i])), 
                    n6a = c( (0),mad(x[, i])), n7 = c( 0,max(x[, i]) - min(x[, i])), n8 = c( 
                    0,max(x[, i])), n9 = c( 
                    0,mean(x[, i])), n9a = c( 
                    0,median(x[, i])), n10 = c( 
                    0,sum(x[, i])), n11 = c( 
                    0,(sum(x[, i]^2)^0.5)), n12 = c( 
                    ( mean(x[, i])),(sum(( 
                      mean(x[, i]))^2)^0.5)), 
                     n12a = cbind(median(x[, i])/(sum((x[, i] - 
                      median(x[, i]))^2)^0.5)),
                     n13 = cbind( ((max(x[, i])+min(x[, i]))/2),((max(x[, i]) - min(x[, i]))/2)))
                 params<-cbind(params,p)

               }
            }
            else {
                for (i in 1:nrow(x)){ resul <- switch(type, n0 = rbind(resul, 
                  (x[i, ])), n1 = rbind(resul, (x[i, ] - mean(x[i, 
                  ]))/(sd(x[i, ]))), n2 = rbind(resul, (x[i, 
                  ] - median(x[i, ]))/(mad(x[i, ]))), n3 = rbind(resul, 
                  (x[i, ] - mean(x[i, ]))/(max(x[i, ]) - min(x[i, 
                    ]))), n3a = rbind(resul, (x[i, ] - median(x[i, 
                  ]))/(max(x[i, ]) - min(x[i, ]))), n4 = rbind(resul, 
                  (x[i, ] - min(x[i, ]))/(max(x[i, ]) - min(x[i, 
                    ]))), n5 = rbind(resul, (x[i, ] - mean(x[i, 
                  ]))/(max(abs(x[i, ] - mean(x[i, ]))))), n5a = rbind(resul, 
                  (x[i, ] - median(x[i, ]))/(max(abs(x[i, ] - 
                    median(x[i, ]))))), n6 = rbind(resul, (x[i, 
                  ])/sd(x[i, ])), n6a = rbind(resul, (x[i, ])/mad(x[i, 
                  ])), n7 = rbind(resul, (x[i, ])/(max(x[i, ]) - 
                  min(x[i, ]))), n8 = rbind(resul, (x[i, ])/(max(x[i, 
                  ]))), n9 = rbind(resul, (x[i, ])/(mean(x[i, 
                  ]))), n9a = rbind(resul, (x[i, ])/(median(x[i, 
                  ]))), n10 = rbind(resul, (x[i, ])/(sum(x[i, 
                  ]))), n11 = rbind(resul, (x[i, ])/(sum(x[i, 
                  ]^2)^0.5)), n12 = rbind(resul, (x[i, ] - mean(x[i, 
                  ]))/(sum((x[i, ] - mean(x[i, ]))^2)^0.5)), 
                  n12a = rbind(resul, (x[i, ] - median(x[i, ]))/(sum((x[i, 
                    ] - median(x[i, ]))^2)^0.5)),
                  n13 = rbind(resul, (x[i, ] - ((max(x[i, ])+min(x[i, ]))/2))/((max(x[i, ]) - min(x[i, ]))/2)))
                  p <- switch(type, n0 = c(0,1), n1 = c( mean(x[i]), 
                    sd(x[i,])), n2 = c(median(x[i,]),(mad(x[i,]))), n3 = c( 
                    ( mean(x[i,])),(max(x[i,]) - 
                      min(x[i,]))), n3a = c(median(x[i,]),(max(x[i,]) - min(x[i, 
                    ]))), n4 = c( ( min(x[i, 
                    ])),(max(x[i,]) - min(x[i,]))), n5 = c( 
                    ( mean(x[i,])),(max(abs( 
                      mean(x[i,]))))), n5a = c( (x[i, 
                    ] - median(x[i,])),(max(abs( 
                    median(x[i,]))))), n6 = c( 0,sd(x[i,])), 
                    n6a = c( (0),mad(x[i,])), n7 = c( 0,max(x[i,]) - min(x[i,])), n8 = c( 
                    0,max(x[i, ])), n9 = c( 
                    0,mean(x[i, ])), n9a = c( 
                    0,median(x[i, ])), n10 = c( 
                    0,sum(x[i, ])), n11 = c( 
                    0,(sum(x[i,]^2)^0.5)), n12 = c( 
                    ( mean(x[i,])),(sum(( 
                      mean(x[i,]))^2)^0.5)), 
                     n12a = cbind(median(x[i,])/(sum((x[i,] - 
                      median(x[i,]))^2)^0.5)),
                     n13 = cbind( ((max(x[i,])+min(x[i,]))/2),((max(x[i,]) - min(x[i,]))/2)))
                 params<-cbind(params,p)
                }
            }
            center<-params[1,]
            scale<-params[2,]
            if(bycolumn){
              if(!is.null(dimnames(x)[[2]])){
                names(center)<-dimnames(x)[[2]]
                names(scale)<-dimnames(x)[[2]]
              }
              else{

                names(center)<-1:ncol(x)
                names(scale)<-1:ncol(x)
              }
            }
            else{
              if(!is.null(dimnames(x)[[1]])){
                names(center)<-dimnames(x)[[1]]
                names(scale)<-dimnames(x)[[1]]
              }
              else{
                names(center)<-1:nrow(x)
                names(scale)<-1:nrow(x)
              }
            }
        }
        else {
            warning("Data not numeric, normalization not applicable")
            center<-NA
            scale<-NA
        }
        dimnames(resul) <- dimnames(x)
    }
    else if (is.list(x)) {
        resul <- list(length(x))
        center<- list(length(x))
        scale <- list(length(x))
        xx <- as.numeric(x)
       center<- switch(type, n0 = 0, n1 = mean(xx), 
            n2 = (median(xx)), 
            n3 = (mean(xx)), 
            n3a = (median(xx)), 
            n4 = (min(xx)), 
            n5 = (mean(xx)), 
            n5a = (median(xx)), 
            n6 = 0, n6a = 0, n7 = 0,
            n8 = 0, n9 = 0, 
            n9a = 0, n10 = 0, 
            n11 = 0, n12 = (
              mean(xx)), n12a = (
              median(xx)),
            n13 = (((max(xx)+min(xx))/2)))
        scale<- switch(type, n0 = 1, n1 = sd(xx), 
            n2 = mad(xx), 
            n3 = (max(xx) - min(xx)), 
            n3a = (max(xx) - min(xx)), 
            n4 = (max(xx) - min(xx)), 
            n5 = (max(abs((xx) - mean(xx)))), 
            n5a = (max(abs((xx) - median(xx)))), 
            n6 = sd(xx), n6a = mad(xx), n7 = (max(xx) - 
              min(xx)), n8 = (max(xx)), n9 = (mean(xx)), 
            n9a = (median(xx)), n10 = (sum(xx)), 
            n11 = (sum(xx^2)^0.5), n12 = (sum((xx - mean(xx))^2)^0.5), 
            n12a = (sum((xx - median(xx))^2)^0.5),
            n13 = ((max(xx) - min(xx))/2))
        for (i in 1:length(x)) if (is.numeric(resul[[i]] <- x[[i]])) {
            resul[[i]] <- switch(type, n0 = x[[i]], n1 = (x[[i]] - 
                mean(xx))/sd(xx), n2 = (x[[i]] - median(xx))/mad(xx), 
                n3 = (x[[i]] - mean(xx))/(max(xx) - min(xx)), 
                n3a = (x[[i]] - median(xx))/(max(xx) - min(xx)), 
                n4 = (x[[i]] - min(xx))/(max(xx) - min(xx)), 
                n5 = (x[[i]] - mean(xx))/(max(abs((xx) - mean(xx)))), 
                n5a = (x[[i]] - median(xx))/(max(abs((xx) - median(xx)))), 
                n6 = x[[i]]/sd(xx), n6a = x[[i]]/mad(xx), n7 = x[[i]]/(max(xx) - 
                  min(xx)), n8 = x[[i]]/(max(xx)), n9 = x[[i]]/(mean(xx)), 
                n9a = x[[i]]/(median(xx)), n10 = x[[i]]/(sum(xx)), 
                n11 = x[[i]]/(sum(xx^2)^0.5), n12 = (x[[i]] - 
                  mean(xx))/(sum((xx - mean(xx))^2)^0.5), n12a = (x[[i]] - 
                  median(xx))/(sum((xx - median(xx))^2)^0.5),
                n13 = (x[[i]] - ((max(xx)+min(xx))/2))/((max(xx) - min(xx))/2))

        }
        else {
            warning("Data not numeric, normalization not applicable")
        }
    }
    else if (!is.numeric(resul <- x)) {
        warning("Data not numeric, normalization not applicable")
        center<-NA
        scale<-NA

        }
    else stop("unknown input type")
    if (is.numeric(t <- x)) {
      if(sum(as.numeric(x)<=0)>0){
        if(type=="n6" || type=="n6a" || type=="n7" || type=="n8" || type=="n9" || type=="n9a" || type=="n10" || type=="n11"){
          warning("Data for this kind of normalization should be positive")
        }
      }
    }
    attr(resul, "normalized:shift") <- center
    attr(resul, "normalized:scale") <- scale

    resul
}
