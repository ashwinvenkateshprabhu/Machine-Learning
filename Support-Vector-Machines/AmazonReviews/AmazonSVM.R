## Author: Ashwin Venkatesh Prabhu
## Implement SVM algorithm for amazon baby product review dataset

require(e1071)
require(ggplot2)
## Getting the train and test data
train_data = read.csv(file="sentiment_train.csv",header = TRUE)
test_data = read.csv(file="sentiment_test.csv",header = TRUE)

sample_data = sample(1:nrow(train_data), 0.15*nrow(train_data))

training_data <- train_data[sample_data, ]

svm.model <- svm(rating~negative_score+positive_score+neutral_score+compound_value, 
                 data = training_data, kernel = "linear", type = "C-classification", 
                 cross = 10, cost = 0.01, gamma = 100)
svm.model$tot.accuracy

svm.pred_test <- predict(svm.model, test_data)
mean(svm.pred_test == test_data$rating)

plot(svm.model, train_data, negative_score ~ compound_value, main = "Amazon dataset classification")
qplot(negative_score, compound_value, colour = rating, data = test_data, shape = svm.pred_test)
qplot(positive_score, compound_value, colour = rating, data = test_data, shape = svm.pred_test)