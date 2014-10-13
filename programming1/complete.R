complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- list.files(path=directory, pattern="*.csv")
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  counts<- vector()
  ids<-vector()
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  for (identifier in id){
    filename <- sprintf("%03d.csv", identifier)
    filepath <- paste(directory, filename, sep="/")
    data <- read.csv(filepath)
    #select your column 
    ids <- c(ids, identifier)
    
    ## Calculate and store the count of complete cases
    completeCases <- data[complete.cases(data),]
    counts <- c(counts, nrow(completeCases))
  }
  data.frame(id=ids,nobs=counts)
}
