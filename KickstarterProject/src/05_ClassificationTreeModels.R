#Regression tree model 
regtree.form <- ks_train$percent.funded ~ main_category + backers + country + over20 + state.failed
regtree.fit <- rpart(formula = regtree.form, data = ks_train, method = "anova")
printcp(regtree.fit)
regtree.predict <- predict(regtree.fit, ks_test)
postResample(pred = regtree.predict, obs = ks_test$percent.funded)

