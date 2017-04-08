## Author: Ashwin Venkatesh Prabhu
## Implement k-NN algorithm for Optical recognition for handwritten digits dataset

require(class)
## Getting the train and test data
train_data <- read.csv("optdigits_raining.csv", header = FALSE)
test_data <- read.csv("optdigits_test.csv", header = FALSE)

## Getting the class variable for train and test data
train_class_variable <- train_data$V65
test_class_variable <- test_data$V65

digit_accuracy <- numeric() 

for(i in seq(1, 100, 1))
{
        ## Generating the model and output for the testing data
        knnTest <- knn(train_data, test_data, train_class_variable, k = i)
        accuracy <- mean(knnTest == test_class_variable)
        ## Accuracy for each k value is stored in this list
        digit_accuracy <- c(digit_accuracy, accuracy)
        print(paste("Accuracy at k = ", i, " is: ", accuracy), quote = F)
}

## Error rate graph plotted
plot(1 - digit_accuracy, type = "l", ylab = "Error Rate", 
     xlab = "K", main = "Error Rate with K values")

## Accuracy graph plotted
plot(digit_accuracy, type = "l", ylab = "Accuracy", 
     xlab = "K", main = "Accuracy with K values")