library('rpart')
library('rattle')

#Part 1: Classification Tree to predict over20
class.tree.result1 <- rpart(over20 ~ main_category + usd_goal_real + backers + country + state.failed, data = train1, method = "class")
png(file = 'C:/Users/hashemin/csx415-project/KickstarterProject/graphs/train1_classtree.png')
fancyRpartPlot(class.tree.result1, cex = 0.5)
dev.off()
printcp(class.tree.result1)

#Part 2: Classification Tree
class.tree.result2 <- rpart(state.failed ~ main_category + usd_goal_real + backers + country, data = train2, method = "class")
png(file = 'C:/Users/hashemin/csx415-project/KickstarterProject/graphs/train2_classtree.png')
fancyRpartPlot(class.tree.result2, cex = 0.5)
dev.off()
printcp(class.tree.result2)
