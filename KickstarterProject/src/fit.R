#Gradient Boosting Model
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 5)
set.seed(825)
gbm.form <- percent.funded ~ backers + over20 + state.failed
gbm.fit <- train(gbm.form, data = ks_train, trControl = fitControl, method = "gbm")

gbm.predict <- predict(fit, ks_test)
postResample(pred = gbm.predict, obs = ks_test$percent.funded)

#Write model package
pkg <- "pkgs/model"
if( ! dir.exists(pkg) ) devtools::create(pkg)

devtools::use_data(gbm.fit, pkg = pkg, overwrite = TRUE )

