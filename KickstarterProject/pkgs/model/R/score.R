#Scoring model
newdata <- read.csv('newdata.csv')
b <- predict(gbm.fit, newdata)
r <- which(b >= 0.80 & b < 0.99)

#table with names of projects that are predicted to be between 80 - 99 percent funded
project_name <- newdata[r,"name"]
result <- data.frame(project_name)
View(result)