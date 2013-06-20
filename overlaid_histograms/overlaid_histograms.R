# set random seed

set.seed(211)

# create two normally distributed vectors of random data

data_a <- rnorm(100,mean=0,sd=2)
data_b <- rnorm(100,mean=1,sd=1)

# Set graphical parameters

par(
     xaxt="s",
     yaxt="s",
     mar=c(4.1,4.1,0,0.5),
     bty="l"
)

# plot first graph

p1<-hist(
     data_a,
     ylim=c(0,45),
     col=rgb(1,0,0,0.5),
     main=""
     )

# plot second graph - note used of 'add = TRUE'

p2<-hist(
     data_b,
     breaks=p1$breaks,
     add=TRUE,
     col=rgb(0,0,1,0.5)
     )

