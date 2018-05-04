#Preprocessing script

#Re-name datasets
ks <- ks.projects.201801 

#Add percent funded column to dataset
ks$percent.funded <- NA
for(i in 1:length(ks$deadline)) {
  ks$percent.funded[i] <- round(ks$usd_pledged_real[i]/ks$usd_goal_real[i], digits = 2)
  print(i)
}

#Add percent funded category column to dataset
ks$percent.funded.cat <- NA
for(k in 1:length(ks$deadline)) {
  if(ks$percent.funded[k] >= 0.81 & ks$percent.funded[k] < 1.00) {
    ks$percent.funded.cat[k] <- "yes"
    print(k)
  }
  else {
    ks$percent.funded.cat[k] <- "no"
    print(k)
  }
}

