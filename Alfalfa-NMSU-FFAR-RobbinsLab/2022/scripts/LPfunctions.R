# functions for calculating GBLUPS for RR models


# functions for Legendre Polynomials
stdtime <- function(t, n, tmax, tmin){
    if(missing(tmax)) {
      tmax <- t[which.max(t)] # take max(t) if not provided
    }
    if(missing(tmin)) {
      tmin <- t[which.min(t)] # take min(t) if not provided
    }
    
    N <- n+1 # number of polynomial terms ( including intercept)
    M <- matrix(0, nrow=length(t), ncol=N) # empty matrix of size: length (t) * N
    a <- -1 + 2*(t-tmin)/(tmax - tmin) # rescale t into [-1,1]
    M[,1] <- 1 # first column = intercept (constant 1)
    
    for (i in 2:N){
      M[,i] <- a^(i-1) # fill columns with powers of a (linear, quadratic,...etc)
    }
    
    return(M)
  }


Legendre <- function(n, gengler){
    
    if (nargs()==1){
      gengler <- TRUE	
    }
    
    if (gengler != TRUE & gengler != FALSE){
      gengler=TRUE	
    }
    
    N <- n+1
    L <- matrix(0,nrow=N, ncol=N)
    
    for(i in (1:N)){
      if(i==1){
        L[i,i] <- 1
      }
      else if(i==2){
        L[i,i] <- 1
      }
      else  {
        tmp <- L[i-1,]
        tmp2 <- as.numeric()
        tmp2 <- c(0,tmp[1:(N-1)]) # shift one position right
        L[i,] <- (1/(i-2+1))*( (2*(i-2) + 1)*tmp2 -(i-2)*L[i-2,] ) # recursive definition for Legendre polynomials
      }
    }
    
    # Normalize rows
    for (j in (1:N)){	
      L[j,] <- (sqrt( (2*(j-1)+1)/2)  )*L[j,]
    }
    
    
    # Gengler (1999) scaling
    if (gengler==TRUE){
      L <- sqrt(2)*L
    }
    
    return(L)
    
  }

