#First Look at dataset
head(ks.projects.201801)
summary(ks.projects.201801)


#First look at categorical variables
#Create bar graph for frequency in main_category column limited to the top 15 categories
cat.freq <- ks.projects.201801 %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
sm.cat.freq <- cat.freq[1:15,1:2]
sm.cat.freq.plot <- ggplot(sm.cat.freq, aes(reorder(main_category, -count), count, fill=count)) + geom_bar(stat="identity") + xlab("Project Category") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5))
sm.cat.freq.plot

#Create bar graph for frequency in state column
state.freq <- ks.projects.201801 %>% group_by(state) %>% summarize(count = n()) %>% arrange(desc(count))
sm.state.freq <- state.freq[1:6,1:2]
sm.state.freq.plot <- ggplot(sm.state.freq, aes(reorder(state, -count), count, fill=count)) + geom_bar(stat = "identity") + xlab("State") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5))
sm.state.freq.plot

#Look into Film & Video group and break into subcategories
subcat.freq.fv <- ks.projects.201801 %>% filter(main_category =="Film & Video") %>% group_by(category) %>% summarize(count = n()) %>% arrange(desc(count))
sm.subcat.freq.fv <- subcat.freq.fv[1:5,1:2]
sm.subcat.freq.fv.plot <- ggplot(sm.subcat.freq.fv, aes(reorder(category, -count), count, fill = count)) + geom_bar(stat = "identity") + xlab("Film & Video Subcategories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
sm.subcat.freq.fv.plot

#Look into Music group and break into subcategories
subcat.freq.m <- ks.projects.201801 %>% filter(main_category =="Music") %>% group_by(category) %>% summarize(count = n()) %>% arrange(desc(count))
sm.subcat.freq.m <- subcat.freq.m[1:5,1:2]
sm.subcat.freq.m.plot <- ggplot(sm.subcat.freq.m, aes(reorder(category, -count), count, fill = count)) + geom_bar(stat = "identity") + xlab("Music Subcategories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
sm.subcat.freq.m.plot

#Look into failed state group and break into subcategories
failed.freq <- ks.projects.201801 %>% filter(state == "failed") %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
failed.freq.plot <- ggplot(failed.freq, aes(reorder(main_category, -count), count, fill = count)) + geom_bar(stat = "identity") + xlab("Failed Project Categories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
failed.freq.plot

#Look into successful state group and break into subcategories
success.freq <- ks.projects.201801 %>% filter(state == "successful") %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
success.freq.plot <- ggplot(success.freq, aes(reorder(main_category, -count), count, fill = count)) + geom_bar(stat = "identity") + xlab("Successful Project Categories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
success.freq.plot


#First linear model: Naive Model
lm.result <- lm(ks.projects.201801$usd_pledged_real~ks.projects.201801$backers, data = ks.projects.201801)
summary(lm.result)
#First model: total pledge amount = 1088.4658 + 75.46353*Number of Backers
#p-value < 0.01 which means that the number of backers has a significant affect on the total pledge amount. The slope is ~75 which means
#that each individual on kickstarter contributed an average of $75





