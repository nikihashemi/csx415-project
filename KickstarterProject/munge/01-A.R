#Preprocessing script

#Add rows to 2018 dataset
ks.projects.201801["profit"] <- NA
ks.projects.201801$profit <- ks.projects.201801$usd_pledged_real - ks.projects.201801$usd_goal_real

ks.projects.201801["profit_success"] <- NA
ks.projects.201801$profit_success <- ifelse(ks.projects.201801$profit > 0,1,0)

ks.projects.201801["amount.per.backer"] <- NA
ks.projects.201801$amount.per.backer <- ks.projects.201801$usd_pledged_real/ks.projects.201801$backers

ks.projects.201801["campaign.length"] <- NA
ks.projects.201801$deadline <- as.Date(strptime(ks.projects.201801$deadline, "%m/%d/%Y"))
ks.projects.201801$launched <- as.Date(strptime(ks.projects.201801$launched, "%m/%d/%Y"))
ks.projects.201801$campaign.length <- ks.projects.201801$deadline - ks.projects.201801$launched

ks.projects.201801["succ"] <- NA
ks.projects.201801$succ <- ifelse(ks.projects.201801$state == "successful",1,0)


#Add rows to 2016 dataset
ks.projects.201612["profit"] <- NA
ks.projects.201612$profit <- ks.projects.201612$pledged - ks.projects.201612$goal

ks.projects.201612["profit_success"] <- NA
ks.projects.201612$profit_success <- ifelse(ks.projects.201612$profit > 0,1,0)

ks.projects.201612["amount.per.backer"] <- NA
ks.projects.201612$amount.per.backer <- ks.projects.201612$pledged/ks.projects.201612$backers

ks.projects.201612["campaign.length"] <- NA
ks.projects.201612$deadline <- as.Date(strptime(ks.projects.201612$deadline, "%m/%d/%Y"))
ks.projects.201612$launched <- as.Date(strptime(ks.projects.201612$launched, "%m/%d/%Y"))
ks.projects.201612$campaign.length <- ks.projects.201612$deadline - ks.projects.201612$launched

ks.projects.201612["succ"] <- NA
ks.projects.201612$succ <- ifelse(ks.projects.201612$state == "successful",1,0)
