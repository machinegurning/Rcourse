
# Setup vector

a <- seq(1,12,1)

################ not necessary, but included from original use

Ymd.format <- "%Y-%m-%d"

Ymd <- function(x){ as.POSIXct(strptime(x, format=Ymd.format))}

################

b <- Ymd(
     sapply(a,function(x) {
          paste("2013",x,01,sep="-")
     }
     )
)

print(b)