#More advanced model training
#Part 1
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 5)
set.seed(825)
gbmFit1 <- train(over20 ~ main_category + usd_goal_real + backers + country + state.failed, 
                 data = train1, method = "gbm", trControl = fitControl, verbose = TRUE)
gbmFit1
advanced.predict1 <- predict(gbmFit1, test1)
postResample(pred = advanced.predict1, obs = test1$over20)

#Part 2
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 5)
set.seed(825)
gbmFit2 <- train(state.failed ~ main_category + usd_goal_real + backers + country, 
                 data = train2, method = "gbm", trControl = fitControl, verbose = TRUE)
gbmFit2
advanced.predict2 <- predict(gbmFit2, test2)
postResample(pred = advanced.predict2, obs = test2$state.failed)