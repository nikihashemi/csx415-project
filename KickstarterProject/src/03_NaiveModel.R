#Script for Naive Model
#Part 1: Predict project will be at least 20% funded
#Naive model is that project will be at least 20% funded

fit1 <- glm(formula = train1$over20 ~ 1, data = train1, family = binomial)
predict1 <- predict(fit1, test1)
postResample(pred = predict1, obs = test1$over20)


#Part 2: Given project is at least 20% funded, predict the project will fail
#Naive model is that project will fail given it is at least 20% funded

fit2 <- glm(formula = train2$state.failed ~ 1, data = train2, family = binomial)
predict2 <- predict(fit2, test2)
postResample(pred = predict2, obs = test2$state.failed)


