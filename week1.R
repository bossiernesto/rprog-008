hw1_data <- read.csv("~/hw1_data.csv")
View(hw1_data)
x <- 4L
class(x)
x <- c(4, TRUE)
class(x)
x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x,y)
x <- list(2, "a", "b", TRUE)
class(x[[1]])
x <- 1:4
y <- 2
x+y
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 10] <- 4

count_from_sumbset = function(data ,fac, lev){nrow(subset(data, fac==lev))}

ozone_na <- subset(hw1_data, is.na(hw1_data$Ozone))
nrow(ozone_na)

ozone_na <- (hw1_data$Ozone)
ozone_na<-na.omit(ozone_na)
mean(ozone_na)

z <- subset(hw1_data,(hw1_data$Ozone>31 & hw1_data$Temp>90))[2]
mean(z$Solar.R)

z <- subset(hw1_data,(hw1_data$Month==6))
mean(z$Temp)
