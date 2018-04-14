#R script for Data Visualizations

#Load Project
setwd("C:/Users/hashemin/csx415-project/KickstarterProject")
library('ProjectTemplate')
load.project()

#Load tidyverse Package
library('tidyverse')

#First Look at dataset
head(ks.projects.201612)
summary(ks.projects.201612)

#Create bar graph for frequency in main_category column limited to the top 15 categories
cat.freq <- ks.projects.201612 %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
sm.cat.freq <- cat.freq[1:15,1:2]
sm.cat.freq.plot <- ggplot(sm.cat.freq, aes(reorder(main_category, -count), count, fill=count)) + geom_bar(stat="identity") + xlab("Project Category") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5))
sm.cat.freq.plot

#Create bar graph for frequency in state column
state.freq <- ks.projects.201612 %>% group_by(state) %>% summarize(count = n()) %>% arrange(desc(count))
sm.state.freq <- state.freq[1:6,1:2]
sm.state.freq.plot <- ggplot(sm.state.freq, aes(reorder(state, -count), count, fill=count)) + geom_bar(stat = "identity") + xlab("State") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5))
sm.state.freq.plot

#Look into Film & Video group and break into subcategories
subcat.freq <- ks.projects.201612 %>% filter(main_category =="Film & Video") %>% group_by(category) %>% summarize(count = n()) %>% arrange(desc(count))
sm.subcat.freq <- subcat.freq[1:5,1:2]
sm.subcat.freq.plot <- ggplot(sm.subcat.freq, aes(reorder(category, -count), count, fill = count)) + geom_bar(stat = "identity") + xlab("Film & Video Subcategories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
sm.subcat.freq.plot

#Look into failed state group and break into subcategories
failed.freq <- ks.projects.201612 %>% filter(state == "failed") %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
failed.freq.plot <- ggplot(failed.freq, aes(reorder(main_category, -count), count, fill = count)) + geom_bar(stat = "identity") + xlab("Failed Project Categories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
failed.freq.plot

#Look into successful state group and break into subcategories
success.freq <- ks.projects.201612 %>% filter(state == "successful") %>% group_by(main_category) %>% summarize(count = n()) %>% arrange(desc(count))
success.freq.plot <- ggplot(success.freq, aes(reorder(main_category, -count), count, fill = count)) + geom_bar(stat = "identity") + xlab("Successful Project Categories") + ylab("Frequency") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
success.freq.plot