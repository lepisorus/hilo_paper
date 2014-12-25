maxnum <- 1e5
maxgens <- 1e2

sim <- function (s) {
    noff <- ( rpois( maxnum, 1+s ) )
    nn <- numeric(maxgens)
    kk <- 0
    nn[1] <- 1
    for (k in 2:maxgens) {
        if ( (nn[k-1] == 0) || ( (kk + nn[k-1]) > maxnum ) ) { break; }
        nn[k] <- sum( noff[ seq(kk+1,length.out=nn[k-1]) ] )
        kk <- kk + nn[k-1]
    }
    return(nn)
}

svals <- seq(-.1,-.03,length.out=5)
lsims <- lapply( svals, function (s) replicate(1000,sim(s)) )
nsims <- sapply( lsims, function (x) rowMeans( ifelse(x==0,NA,x), na.rm=TRUE ) )

matplot( nsims, type='l', lty=1, col=seq_along(svals) )
abline( h=(-1/svals)*exp(-1)/(1-exp(-1)), col=seq_along(svals) )
