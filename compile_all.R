
setwd("C:/Users/s162906/Dropbox/Rnotes/Tutorial/")

library(knitr)
loc <- 'C://Users/s162906/Dropbox/Rnotes/Tutorial/'
files <- list.files(loc)
in_files <- files[grep("Rhtml",files)]
out_files <- sub("Rhtml","html",in_files)
unlink("Tutorial/figure/*.*")
#unlink("*.html")


try(
     for (i in 1:length(files)) {
#for (i in 1:5) {
     
     
     knit(
          input = paste(loc,in_files[i],sep=""),
          output = paste(loc,out_files[i],sep=""))
     
}
)

newloc <- "C:/Users/s162906/Google Drive/R course/"

new_out_files <- c(
 out_files,
 "stylesheet.css"
)

file.copy(
     from = paste(
          loc,
          new_out_files,
          sep=""
          ),
     ,
     to = paste(
          newloc,
          new_out_files,
          sep=""
     ),
     overwrite=TRUE
     )

file.copy(
     from = paste(
          loc,
          "figure/",
          sep=""
     ),
     ,
     to = newloc,
     overwrite=TRUE,
     recursive=TRUE
)

file.copy(
     from = paste(
          loc,
          "screenshots/",
          sep=""
     ),
     ,
     to = newloc,
     overwrite=TRUE,
     recursive=TRUE
)

