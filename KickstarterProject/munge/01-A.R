#Preprocessing script and addition of columns

#Re-name dataset
ks <- ks.projects.201801 

#Add percent funded column to dataset
ks$percent.funded <- NA
for(i in 1:length(ks$ID)) {
  ks$percent.funded[i] <- round(ks$usd_pledged_real[i]/ks$usd_goal_real[i], digits = 2)
  print(i)
}

#Add funded over 20 percent column to dataset
ks$over20 <- NA
for(k in 1:length(ks$ID)) {
  if(ks$percent.funded[k] > 0.20 & ks$percent.funded[k] < 1.00) {
    ks$over20[k] = 1
    print(k)
  }
  else {
    ks$over20[k] = 0
    print(k)
  }
}



#Save dataframe as ks.final so you do not have to re-load when you open R
write.csv(ks, file = "C:/Users/hashemin/csx415-project/KickstarterProject/data/ks.final.csv")
ks_final <- read_csv("data/ks.final.csv")

ks_final$state[ks_final$state != "successful"] <- "failed"






