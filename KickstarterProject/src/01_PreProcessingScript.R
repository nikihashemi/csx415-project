#Pre-Processing script

#set working directory to KickstarterProject data folder to load dataset
setwd('C:/Users/hashemin/csx415-project/KickstarterProject/data')

#rename dataset
ks <- read.csv('ks-projects-201801.csv')

#Check for NA values
sapply(ks, function(x) sum(is.na(x)))

#Add columns to dataset
ks$percent.funded <- round(ks$usd_pledged_real/ks$usd_goal_real, digits = 2)
ks$percent.funded <- ifelse(ks$percent.funded > 1.00, 1.00, ks$percent.funded) 
ks$over20 <- ifelse(ks$percent.funded >= 0.20, 1, 0)
ks$state.failed <- ifelse(ks$state != "successful", 1, 0)


#Save dataframe as ks.final in data folder
write.csv(ks, file = "C:/Users/hashemin/csx415-project/KickstarterProject/data/ks.final.csv")
ks_final <- read.csv('ks.final.csv')

#Load libraries
library('ProjectTemplate')
library('tidyverse')
library('caret')
library('gbm')
library('devtools')
library('roxygen2')
library('testthat')
library('rpart')
library('rattle')

#Splitting data between test and training sets
set.seed(3456)
trainIndex <- createDataPartition(ks_final$percent.funded, p = 0.7, list = FALSE, times = 1)
head(trainIndex)
train <- ks_final[trainIndex,]
test <- ks_final[-trainIndex,]

write.csv(train, file = "C:/Users/hashemin/csx415-project/KickstarterProject/data/ks.train.csv")
ks_train <- read.csv('ks.train.csv')

write.csv(test, file = "C:/Users/hashemin/csx415-project/KickstarterProject/data/ks.test.csv")
ks_test <- read.csv('ks.test.csv')

