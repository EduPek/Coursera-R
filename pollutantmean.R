fileNbr <- function(n){
  char = ""
  if(n<10){
    char = paste("00",n,".csv", sep = "")  
  } else if(n<100){
    char = paste("0",n,".csv", sep = "")  
  } else {
    char = paste(n,".csv", sep = "")  
  } 
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
 
  workDir <- getwd()
  setwd(directory)
  wdata <- read.csv(fileNbr(id[1]))
  if(length(id) > 1){
    for(i in 2:length(id)){
      wdata2 <- read.csv(fileNbr(id[i]))
      wdata <- rbind(wdata, wdata2)
      }
    }
  setwd(workDir)

  mean(wdata[[pollutant]],na.rm = TRUE)
}