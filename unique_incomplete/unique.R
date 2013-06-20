
# Unique strips out duplicate values from an object

a<-read.table("C:/Users/s162906/Dropbox/classicthesis1/data/soc_2011_data.csv",sep=",",header=T)

a$depth <- as.factor(a$depth)

a$vSOC <- a$OCC*a$BD*a$di

a<-subset(a,year == "2011")

SOC_melt <- melt(a,id.vars=names(a)[1:8],measure.vars="vSOC")
vSOC <- cast(SOC_melt,ID + block + ctrltmt + treat + dist + depth ~ variable, sum)


SOC_cast <- cast(SOC_melt,ID + block + ctrltmt + treat + dist ~ variable, sum)

#SOC_cast1 <- cast(SOC_melt,ID + block + ctrltmt + treat + dist ~ variable,subset=depth!="128", sum)

vSOC_summary<- unique(
     data.frame(mean=ave(SOC_cast$vSOC,SOC_cast$treat,SOC_cast$dist,FUN=mean),
                sd=ave(SOC_cast$vSOC,SOC_cast$treat,SOC_cast$dist,FUN=sd),
                se=ave(SOC_cast$vSOC,SOC_cast$treat,SOC_cast$dist,FUN=se),
                n=ave(SOC_cast$vSOC,SOC_cast$treat,SOC_cast$dist,FUN=length)
     )
)

vSOC_summary