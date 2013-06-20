
set.seed(1337)
# create data frame of fake data

my_data <- data.frame(
 block = factor(rep(1,2,each=15)),
 groups = factor(rep(rep(c("A","B","C"),each=5),2)),
 depth = factor(rep(1:5,6)),
 values = rnorm(30,mean=5,sd=2)
)

# use ave to create a new vector of group means

my_data$group_mean <- ave(
     my_data$values,
     my_data$groups,
     my_data$depth
)

# see results

my_data

# compare results with tapply

test1 <- with(
     my_data,
     tapply(
          values,
          list(groups,depth),
          mean
          )
)


test2 <- my_data$group_mean[1:15]

# arrange vectors so they are comparable!

identical(
     as.vector(
          c(
               test1[1,],
               test1[2,],
               test1[3,]
          )
     )
     ,
     test2
)
