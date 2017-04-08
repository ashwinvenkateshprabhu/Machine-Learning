## Author: Ashwin Venkatesh Prabhu
## Implement boosting technique for amazon dataset

require(class)
require(caret)
require(caretEnsemble)
require(C50)

## Getting the train and test data
train_data <- read.csv(file = "sentiment_train.csv", header = TRUE)
train_data$rating <- as.factor(train_data$rating)
test_data <- read.csv(file = "sentiment_test.csv", header = TRUE)
test_data$rating <- as.factor(test_data$rating)

sample_data <- sample(1:nrow(train_data), 0.35 * nrow(train_data))

control <- trainControl(method="repeatedcv", number=5, repeats=3)
## Model for C5.0
model_c50 <- train(rating ~ negative_score + positive_score + neutral_score + compound_value, 
                   data = train_data, method = "C5.0", metric = "Accuracy", trControl = control)
## Model for Gradient Boosting
model_gbm <- train(rating ~ negative_score + positive_score + neutral_score + compound_value, 
                   data = train_data, method = "gbm", metric = "Accuracy", trControl = control, verbose = FALSE)
## Summarize boosting results
boosting_results <- resamples(list(c5.0 = model_c50, gbm = model_gbm))
summary(boosting_results)
dotplot(boosting_results)

## Use the C5.0 model the predict the class variables on test dataset
pr.c50 <- predict(model_c50, test_data)
mean(test_data$rating == pr.c50)
plot(pr.c50)

## Use the Gradient Boosting model the predict the class variables on test dataset
pr.gbm <- predict(model_gbm, test_data)
mean(test_data$rating == pr.gbm)
plot(pr.gbm)