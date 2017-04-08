## Author: Ashwin Venkatesh Prabhu
## Implement SVM algorithm for Optical recognition for handwritten digits dataset

require(e1071)
require(ggplot2)

train_data <- read.csv("optdigits_raining.csv", header = FALSE)
test_data <- read.csv("optdigits_test.csv", header = FALSE)

svm.model <- svm(V65~., data = train_data, kernel = "linear", type = "C-classification", 
                 cross = 10, cost = 0.0001, gamma = 1000)
svm.model$tot.accuracy

svm.pred_test <- predict(svm.model, test_data)
mean(svm.pred_test == test_data$V65)

plot(svm.model, train_data, V53 ~ V6)