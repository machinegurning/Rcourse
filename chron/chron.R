# load chron

library(chron)

# setup YMD function from ?gantt.chart

Ymd.format <- "%Y-%m-%d"

Ymd <- function(x){ as.POSIXct(strptime(x, format=Ymd.format))}

# create vector of date values (using origin of 1900-01-01)

a <- seq(41440,41800,1)

# convert that vector into dates

b <- as.Date(a,origin="1900-01-01")

# Strip down to wednesdays only:

d <- b[which(weekdays(b)=="Wednesday")]

# Remove every other wednesday

e <- d[seq(1,length(d),2)]

# convert to chron object for use with > <

f <- chron(as.character(e),format = "y-m-d")

# strip out values before 13-07-16 and after 14-04-01

g <- f[f > "13-07-16" & f < "14-04-01"]

# create two vectors for use in gantt.chart

Ymd(as.Date(g,origin="1970-01-01"))

Ymd(as.Date(g+1,origin="1970-01-01"))




