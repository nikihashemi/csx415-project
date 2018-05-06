#Splitting data between test and training sets using caret for Part 1
set.seed(3456)
trainIndex1 <- createDataPartition(ks_final$over20, p = 0.8, list = FALSE, times = 1)
head(trainIndex1)
train1 <- ks_final[trainIndex1,]
test1 <- ks_final[-trainIndex1,]





#Splitting data between test and training sets using caret for Part 2
ks_final2 <- subset(ks_final, over20 == 1, select = X:state.failed)

set.seed(3456)
trainIndex2 <- createDataPartition(ks_final2$state.failed, p = .8, list = FALSE, times = 1)
head(trainIndex2)

train2 <- ks_final2[trainIndex2,]
test2 <- ks_final2[-trainIndex2,]