#Update train and test datasets to only include successful/failed projects so output is easier to read
train <- train[ which(train$state == 'successful' | train$state == 'failed' ), ]
test <- test[which(test$state == 'successful' | test$state == 'failed'), ]

#Classification Tree
class.tree.result <- rpart(state ~ year + main_category + backers + pledged + goal, data = train, method = "class")
fancyRpartPlot(class.tree.result, cex = 0.5)
printcp(class.tree.result)

#Regression Tree
reg.tree.result <- rpart(pledged ~ year + main_category + backers + pledged + goal + state, data = train, method = "anova")
fancyRpartPlot(reg.tree.result, cex = 0.6)
printcp(reg.tree.result)