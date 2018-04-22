# Linear Regression Models
train$pledged[train$pledged == 0] <- 1
train$backers[train$backers == 0] <- 1
lin.reg <- lm(log(train$pledged) ~ log(train$backers) + goal + main_category + year, data = train) 
summary(lin.reg)

