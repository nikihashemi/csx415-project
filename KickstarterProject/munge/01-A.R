#Preprocessing script

#Re-name datasets
train <- ks.projects.201612
test <- ks.projects.201801 

#Turn deadline column into date column
mydate <- mdy_hm(as.character(train$deadline))
train$year <- year(mydate)

mydate2 <- mdy(as.character(test$deadline))
test$year <- year(mydate2)

#update train and test datasets based on year
train <- train[ which(train$year <= '2016'), ]
test <- test[which(test$year == '2017'), ]
