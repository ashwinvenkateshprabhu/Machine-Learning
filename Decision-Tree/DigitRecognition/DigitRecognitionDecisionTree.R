## Author: Ashwin Venkatesh Prabhu
## email: avenka11@uncc.edu
## Analysis of Optical recognition of handwritten digits using Decision trees

## install.packages("rpart")

## library(rpart)

require(rpart)

## Load train dataset
train_data <- read.csv("optdigits_raining.csv", header = FALSE)
train_data <- train_data[, c(65, 1:64)]

## Create formula to create decision tree
xnam <- paste(colnames(train_data[2:65]), sep="", collapse = "+")
fmla <- as.formula(paste(paste(colnames(train_data[1]), " ~ ", sep = ""), xnam))

## Divide train data into 70% train data and 30% cross validation test data
train <- sample(1:nrow(train_data), 0.7*nrow(train_data))
input_trainData <- train_data[train, ]
input_testData <- train_data[-train, ]

## model tree created
rpartMod <- rpart(fmla, data = input_trainData, method = "class",parms = list(split = 'information'), 
                  minsplit = 4, minbucket = 1)

## Used to plot decision tree of the model
#plot(rpartMod)
#text(rpartMod, pretty = 10000)

## Tree has been pruned
treePruned_inputtrain <- prune(rpartMod,cp = rpartMod$cptable[which.min(rpartMod$cptable[,"xerror"]), "CP"])

## Predict the class attribute for the 30% test data for cross validation
out <- predict(treePruned_inputtrain, newdata = input_testData, type="class")
input_testData$Output <- out
input_testData <- input_testData[, c(66, 1:65)]

## Used to plot decision tree of the pruned tree
#plot(treePruned_inputtrain)
#text(treePruned_inputtrain, pretty = 400)

## Write the predicted output of cross validated test data to a csv file
## Can be used for verifying the predicted output
write.csv(input_testData, file = "input_test_result.csv")

## Testing with new test data
## Load the test data
test_data <- read.csv("optdigits_test.csv", header = FALSE)
test_data <- test_data[, c(65, 1:64)]

## Predict the class attribute for the new test data
outtest <- predict(treePruned_inputtrain, newdata = test_data, type="class")
test_data$Output <- outtest
test_data <- test_data[, c(66, 1:65)]

## Can be used for verifying the predicted output
write.csv(test_data, file = "test_result.csv")