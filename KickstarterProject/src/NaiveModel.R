#Script for Naive Model
#Part 1: Predict failure
#Naive model is that project will fail

ks_final$state[ks_final$state != "successful"] <- 1
ks_final$state[ks_final$state == "successful"] <- 0
ks_final$state <- as.numeric(ks_final$state)
ks_final.train$state <- as.numeric(ks_final.train$state)
ks_final.test$state <- as.numeric(ks_final.test$state)

fit <- glm(formula = ks_final.train$state ~ 1, data = ks_final.train, family = binomial)
output <- predict(fit, ks_final.test)

postResample(pred = 1, obs = output)


#Part 2: Predict project will be over 20% funded
#Naive model is that project will be over 20% funded



