#Naive Model: project will not be funded

naive.form <- ks_train$percent.funded ~ 0
naive.fit <- lm(naive.form , data = ks_train)
naive.predict <- predict(naive.fit, ks_test)
postResample(pred = naive.predict, obs = ks_test$percent.funded)




