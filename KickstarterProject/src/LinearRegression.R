# Linear Regression Models
train$pledged[train$pledged == 0] <- 1
train$backers[train$backers == 0] <- 1
lin.reg <- lm(log(pledged) ~ log(backers) + goal + main_category + year, data = train) 
summary(lin.reg)

dist.predict <- predict(lin.reg, test)
actuals_preds <- data.frame(cbind(actuals = log(train$pledged), predicteds = dist.predict))
correlation_accuracy <- cor(actuals_preds)
min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))


