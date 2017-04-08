## Author: Ashwin Venkatesh Prabhu
## Implement k-NN algorithm for amazon dataset

require(class)
## Getting the train and test data
train_data = read.csv(file="sentiment_train.csv",header = TRUE)
test_data = read.csv(file="sentiment_test.csv",header = TRUE)

sample_data = sample(1:nrow(train_data), 0.35*nrow(train_data))

## Getting training features and training target separated
training_features <- train_data[sample_data, 3:6]
training_target <- train_data[sample_data, 2]

## Getting testing features and testing target separated
testing_features <- test_data[, 3:6] 
testing_target <- test_data[, 2]

accuracy <- numeric()
for (k_value in 1:3)
{
        ## Generating the model and output for the testing data
        predict <- knn(train = training_features, test = testing_features, cl = training_target[], k = k_value)
        value <- (sum(testing_target == predict) / 36707) * 100
        ## Accuracy for each k value is stored in this list
        accuracy <- c(accuracy, mean(predict == testing_target))
}

## Accuracy graph plotted
plot(accuracy,type="l",ylab="Accuracy",
     xlab="K",main="Accuracy for Amazon data With Varying K")

## Error rate graph plotted
plot(1-accuracy,type="l",ylab="Error Rate",
     xlab="K",main="Error Rate for Amazon data With Varying K")