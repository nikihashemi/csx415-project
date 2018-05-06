#Splitting data between test and training sets using caret for Part 1
set.seed(3456)
trainIndex <- createDataPartition(ks_final$state.failed, p = .8, list = FALSE, times = 1)
head(trainIndex)

train <- ks_final[trainIndex,]
test <- ks_final[-trainIndex,]


#Splitting data between test and training sets using caret for Part 2
ks_final2 <- subset(ks_final, state.failed == 1, select = X:state.failed)
set.seed(3456)
trainIndex2 <- createDataPartition(ks_final2$over20, p = 0.8, list = FALSE, times = 1)
head(trainIndex2)

train2 <- ks_final2[trainIndex2,]
test2 <- ks_final2[-trainIndex2,]