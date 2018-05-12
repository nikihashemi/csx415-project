#Pre-Processing script

#set working directory to KickstarterProject data folder to load dataset
setwd('C:/Users/hashemin/csx415-project/KickstarterProject/data')

#rename dataset
ks <- read.csv('ks-projects-201801.csv')

#Check for NA values
sapply(ks, function(x) sum(is.na(x)))

#Add columns to dataset
ks$percent.funded <- round(ks$usd_pledged_real/ks$usd_goal_real, digits = 2)
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

