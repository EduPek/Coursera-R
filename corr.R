corr <- function(directory, threshold = 0) {
  
  workDir <- getwd()
  setwd(directory)
  
  k = 1
  
  cr<-numeric(length=0)
  
  for(i in 1:332){
    rr <- complete("",i)
    wdata <- read.csv(fileNbr(i))
    if ( rr[1,2] > threshold){
       cr[k] <- cor(wdata[["nitrate"]], wdata[["sulfate"]], use = "na.or.complete")
       k <- k+1
    }
  }
  
  setwd(workDir)
  
  cr <- na.omit(cr)
  as.numeric(cr)
}
