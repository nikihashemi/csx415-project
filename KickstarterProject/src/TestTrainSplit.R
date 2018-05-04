#Splitting data between test and training sets using caret
set.seed(3456)
trainIndex <- createDataPartition(ks_final$state[ks_final$state == "failed"], p = .8, list = FALSE, times = 1)
head(trainIndex)

ks_final.train <- ks_final[trainIndex,]
ks_final.test <- ks_final[-trainIndex,]

