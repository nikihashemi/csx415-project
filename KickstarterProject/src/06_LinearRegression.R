#Part 1: Basic linear regression model 
linear.fit1 <- lm(formula = train1$over20 ~ main_category + usd_goal_real + backers + country + state.failed, data = train1)
linear.predict1 <- predict(linear.fit1, test1)
postResample(pred = linear.predict1, obs = test1$over20)

#Part 2: Basic linear regression model 
linear.fit2 <- lm(formula = train2$state.failed ~ main_category + usd_goal_real + backers + country, data = train2)
linear.predict2 <- predict(linear.fit2, test2)
postResample(pred = linear.predict2, obs = test2$state.failed)


