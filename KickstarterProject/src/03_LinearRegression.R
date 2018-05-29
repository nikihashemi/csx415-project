#Linear regression model 
lm.form <- ks_train$percent.funded ~ main_category + backers + country + over20 + state.failed
lm.fit <- lm(formula = lm.form, data = ks_train)
lm.predict <- predict(lm.fit, ks_test)
postResample(pred = lm.predict, obs = ks_test$percent.funded)

