#Script for Naive Model
#Part 1: Predict failure
#Naive model is that project will fail

fit1 <- glm(formula = train$state.failed ~ 1, data = train, family = binomial)
predict1 <- predict(fit1, test)
postResample(pred = predict1, obs = test$state.failed)


#Part 2: Predict project will be over 20% funded
#Naive model is that project will be over 20% funded

fit2 <- glm(formula = train2$over20 ~ 1, data = train2, family = binomial)
predict2 <- predict(fit2, test2)
postResample(pred = predict2, obs = test2$over20)


