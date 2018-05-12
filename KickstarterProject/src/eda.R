#Part 1: look at the first few entries of the train1 dataset
head(train1)
summary(train1)

#First look at categorical variables in training dataset
#Create bar graph for frequency in main_category column limited to the top 15 categories
category.fq1 <- train1 %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
category.fq1 <- category.fq1[1:15,1:2]
ggplot(category.fq1, aes(reorder(main_category, -count), count)) + geom_bar(stat="identity") + xlab("Project Category") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5))
ggsave('train1_categories.png', path = "C:/Users/hashemin/csx415-project/KickstarterProject/graphs")

#Create bar graph for frequency in state column
state.fq1 <- train1 %>% group_by(state.failed) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(state.fq1, aes(reorder(state.failed, -count), count)) + geom_bar(stat = "identity") + xlab("State") + ylab("Frequency") + theme(axis.text.x = element_text(hjust = 0.5, vjust=0.5))
ggsave('train1_state.png', path = "C:/Users/hashemin/csx415-project/KickstarterProject/graphs")

#Look into Film & Video group and break into subcategories
fvsubcat.fq1 <- train1 %>% filter(main_category =="Film & Video") %>% group_by(category) %>% summarize(count = n()) %>% arrange(desc(count))
fvsubcat.fq1 <- fvsubcat.fq1[1:5,1:2]
ggplot(fvsubcat.fq1, aes(reorder(category, -count), count)) + geom_bar(stat = "identity") + xlab("Film & Video Subcategories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
ggsave('train1_filmvideo.png', path = "C:/Users/hashemin/csx415-project/KickstarterProject/graphs")

#Look into Music group and break into subcategories
msubcat.fq1 <- train1 %>% filter(main_category =="Music") %>% group_by(category) %>% summarize(count = n()) %>% arrange(desc(count))
msubcat.fq1 <- msubcat.fq1[1:5,1:2]
ggplot(msubcat.fq1, aes(reorder(category, -count), count)) + geom_bar(stat = "identity") + xlab("Music Subcategories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
ggsave('train1_music.png', path = "C:/Users/hashemin/csx415-project/KickstarterProject/graphs")

#Look into failed state group and break into subcategories
failed.fq1 <- train1 %>% filter(state.failed == 1) %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(failed.fq1, aes(reorder(main_category, -count), count)) + geom_bar(stat = "identity") + xlab("Failed Project Categories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
ggsave('train1_failed.png', path = "C:/Users/hashemin/csx415-project/KickstarterProject/graphs")

#Look into successful state group and break into subcategories
success.fq1 <- train1 %>% filter(state.failed == 0) %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(success.fq1, aes(reorder(main_category, -count), count)) + geom_bar(stat = "identity") + xlab("Successful Project Categories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
ggsave('train1_success.png', path = "C:/Users/hashemin/csx415-project/KickstarterProject/graphs")

#Histogram of percent funded column
hist(train2$percent.funded)

#Histogram of log transformed of percent funded column in training dataset
png(file = 'C:/Users/hashemin/csx415-project/KickstarterProject/graphs/train1_percentfunded.png')
hist(log(train2$percent.funded))
dev.off()


#Look into over20 percent funded category
over20.fq1 <- train1 %>% group_by(over20) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(over20.fq1, aes(reorder(over20, -count), count)) + geom_bar(stat = "identity") + xlab("Projects Over 20% Funded") + ylab("Frequency")
ggsave('train1_over20.png', path = "C:/Users/hashemin/csx415-project/KickstarterProject/graphs")

#Part 2: look at the first few entries of the train2 dataset
head(train2)
summary(train2)

#Confirm that only projects that were over 20 percent funded are included
over20.fq2 <- train2 %>% group_by(over20) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(over20.fq2, aes(reorder(over20, -count), count)) + geom_bar(stat = "identity") + xlab("Projects Over 20% Funded") + ylab("Frequency")

#Look at distribution of state failed column
state.fq2 <- train2 %>% group_by(state.failed) %>% summarize(count = n()) %>% arrange(desc(count))
ggplot(state.fq2, aes(reorder(state.failed, -count), count)) + geom_bar(stat = "identity") + xlab("State") + ylab("Frequency") + theme(axis.text.x = element_text(hjust = 0.5, vjust=0.5))
ggsave('train2_failed.png', path = "C:/Users/hashemin/csx415-project/KickstarterProject/graphs")
