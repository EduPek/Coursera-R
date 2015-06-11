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

complete <- function(directory, id = 1:332) {
  workDir <- getwd()
  if(directory != "") setwd(directory)
  
  nobs<- matrix(nrow = length(id), ncol = 2) 
  colnames(nobs) = c("id", "nobs") 
  row.names(nobs) = id
  
  for(i in 1:length(id)){
    wdata <- read.csv(fileNbr(id[i]))
    nobs[i,1] <- id[i]
    ok <- complete.cases(wdata) 
    nobs[i,2] = sum(ok)
  }
  setwd(workDir)
  nobs =as.data.frame(nobs)
}