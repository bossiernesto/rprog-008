corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  completes <- complete(directory, 1:332)
  completes <- subset(completes, nobs > threshold )
  
  ## Initialize correlation vector
  correlations <- vector()
  
  ## Loop over the passed id's
  for(id in completes$id ) {
    
    filename <- sprintf("%03d.csv", id)
    filepath <- paste(directory, filename, sep="/")
    
    ## Load data
    data <- read.csv(filepath)
    
    completeCases <- data[complete.cases(data),]
    count <- nrow(completeCases)
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    if( count >= threshold ) {
      correlations <- c(correlations, cor(completeCases$nitrate, completeCases$sulfate) )
    }
  }
  
  ## Return a numeric vector of correlations
  correlations
  
}

