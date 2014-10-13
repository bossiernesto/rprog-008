pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## Get a list of filenames
  files <- list.files(path=directory, pattern="*.csv")
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  values<- vector()
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  for (identifier in id){
    filename <- sprintf("%03d.csv", identifier)
    filepath <- paste(directory, filename, sep="/")
    data <- read.csv(filepath)
    #select your column 
    d <- data[,pollutant]
    d <- d[!is.na(d)]
    values <-c(values,d)
  }
  
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  round(mean(values), 3)
}


