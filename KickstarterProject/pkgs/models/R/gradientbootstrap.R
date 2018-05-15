#Gradient Bootstrap Model
#Part 1: Predict if project will be over 20 percent funded
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 5)
set.seed(825)
gbmFit1 <- train(over20 ~ main_category + usd_goal_real + backers + country + state.failed, 
                 data = train1, method = "gbm", trControl = fitControl, verbose = TRUE)


#Part 2: if project is over 20 percent funded, predict that the project will fail
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 5)
set.seed(825)
gbmFit2 <- train(state.failed ~ main_category + usd_goal_real + backers + country, 
                 data = train2, method = "gbm", trControl = fitControl, verbose = TRUE)
