#First look at training dataset
head(train)
summary(train)


#First look at categorical variables in training dataset
#Create bar graph for frequency in main_category column limited to the top 15 categories
category.fq <- train %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
category.fq <- category.fq[1:15,1:2]
ggplot(category.fq, aes(reorder(main_category, -count), count)) + geom_bar(stat="identity") + xlab("Project Category") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5))


#Create bar graph for frequency in state column
state.fq <- train %>% group_by(state) %>% summarize(count = n()) %>% arrange(desc(count))
state.fq <- state.fq[1:6,1:2]
ggplot(state.fq, aes(reorder(state, -count), count)) + geom_bar(stat = "identity") + xlab("State") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5))

#Look into Film & Video group and break into subcategories
fvsubcat.fq <- train %>% filter(main_category =="Film & Video") %>% group_by(category) %>% summarize(count = n()) %>% arrange(desc(count))
fvsubcat.fq <- fvsubcat.fq[1:5,1:2]
ggplot(fvsubcat.fq, aes(reorder(category, -count), count)) + geom_bar(stat = "identity") + xlab("Film & Video Subcategories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))


#Look into Music group and break into subcategories
msubcat.fq <- train %>% filter(main_category =="Music") %>% group_by(category) %>% summarize(count = n()) %>% arrange(desc(count))
msubcat.fq <- msubcat.fq[1:5,1:2]
ggplot(msubcat.fq, aes(reorder(category, -count), count)) + geom_bar(stat = "identity") + xlab("Music Subcategories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))


#Look into failed state group and break into subcategories
failed.fq <- train %>% filter(state == "failed") %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(failed.fq, aes(reorder(main_category, -count), count)) + geom_bar(stat = "identity") + xlab("Failed Project Categories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))


#Look into successful state group and break into subcategories
success.fq <- train %>% filter(state == "successful") %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(success.fq, aes(reorder(main_category, -count), count)) + geom_bar(stat = "identity") + xlab("Successful Project Categories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))

#Look into distribution of year for training dataset
year.fq <- train %>% group_by(year) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(year.fq, aes(year,count)) + geom_bar(stat = "identity")

#Histogram of pledged column in training dataset
hist(train$pledged)

#Histogram of log transformed of pledged column in training dataset
hist(log(train$pledged))

#Histogram of backers column in training dataset
hist(train$backers)

#Histogram of log transformed backers in training dataset
hist(log(train$backers))

#Scatter plot log transformed pledged column vs. transformed backers
train$pledged[train$pledged == 0] <- 1
train$backers[train$backers == 0] <- 1
plot(log(train$backers), log(train$pledged))
abline(lm(log(train$pledged) ~ log(train$backers)), col = 'red')


#First linear model: Naive Model
train$pledged[train$pledged == 0] <- 1
train$backers[train$backers == 0] <- 1
lm.result <- lm(log(train$pledged) ~ log(train$backers), data = train) 
summary(lm.result)
#First model: log(pledged amount) = 1.92 + 1.526*log(backers)

#Testing naive model on test dataset
dist.predict <- predict(lm.result, test)
actuals_preds <- data.frame(cbind(actuals = log(train$pledged), predicteds=dist.predict))
correlation_accuracy <- cor(actuals_preds)
min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))


