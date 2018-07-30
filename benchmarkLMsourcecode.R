#Data Science Challenge 2014 Linear Model Benchmark

#Read Data
train <- read.csv("C:/Users/wljt/Desktop/AIO3stuff/all sets/final/base_training.csv", header = TRUE)
test <- read.csv("C:/Users/wljt/Desktop/AIO3stuff/all sets/final/base_test.csv", header = TRUE)

#Fit Linear Model
fit <- lm(EUR_o..Mstb. ~. , data = train)
y_pred <- predict(fit, newdata = test)

#Convert predicted response vector as dataframe
y_pred <- as.data.frame(y_pred)
colnames(y_pred) <- "EUR_o..Mstb."

#Replacing NA with average EUR from training set (NA not allowed for submission)
y_pred[is.na(y_pred)] <- mean(train$EUR_o..Mstb.)

#write to file for submission
solution <- cbind(test["WellID"], y_pred)
write.table(solution, "C:/Users/wljt/Desktop/AIO3stuff/all sets/final/benchmarkLM.csv", sep=",", row.names=FALSE, quote = FALSE)

