#Splitting data between test and training sets using caret
set.seed(3456)
trainIndex <- createDataPartition(ks.final$failed, p = .8, list = FALSE, times = 1)
head(trainIndex)

ks.final.train <- ks.final[trainIndex,]
ks.final.Test <- ks.final[-trainIndex,]

