
require("plotrix")
require("RColorBrewer")

a<- read.table("W:/2012/PhD/june_2013/gantt.csv",header=T,sep=",")[1:18,]

a$description <- as.character(a$description)
a$start <- as.character(a$start)
a$end <- as.character(a$end)
     
par(lwd = 0.5)

ganttKey<-1:length(a[,1])

Ymd.format <- "%Y-%m-%d"

Ymd <- function(x){ as.POSIXct(strptime(x, format=Ymd.format))}

gantt.info <- list(
     labels     = a$description,
     starts     = Ymd(a$start),
     ends       = Ymd(a$end),
     priorities = a$priorities
)

#ganttVgridPos <- as.Date(seq(41440,41800,7),origin="1900-01-01")
ganttVgridPos <- as.Date(seq(41440,41800,7),origin="1900-01-01")

ganttCols <- brewer.pal(5,"Set1")


gantt.chart(
     gantt.info,
     main = "",
     hgrid = T,
     vgrid.format = "%b",
     vgridpos = Ymd(ganttVgridPos),
     taskcolors = ganttCols,
     xlim=c(Ymd("2013-06-17"),Ymd("2014-01-01"))
     #cylindrical=T
     #half.height=0.25
     #label.cex=0.75
)
