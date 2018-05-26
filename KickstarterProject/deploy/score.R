#Scoring model
ks_test <- read.csv('ks.test.csv')
b <- predict(gbm.fit, ks_test)
r <- which(b >= 0.80 & b < 0.99)

#table with names of projects that are predicted to be between 80 - 99 percent funded
project_name <- ks_test[r,"name"]
df <- data.frame(project_name)
View(df)