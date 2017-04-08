## Author: Ashwin Venkatesh Prabhu
## email: avenka11@uncc.edu
## Analysis of Digit recognition data using Neural Networks

#require(neuralnet)
#require(nnet)

## get Data from working directory
DigitRecog_data = read.csv(file="optdigits_raining.csv",header = FALSE)

## Split training data in order to create a dummy test dataset
set.seed(5)
train = sample(1:nrow(DigitRecog_data), 0.8*nrow(DigitRecog_data))
training_data = DigitRecog_data[train, ]
crossvalidation_data = DigitRecog_data[-train, ]

## For neural networks, we need to split the class variable column in dataset into columns for each class
## In this cass, class variable can have values from 0 to 9. So the column will be split intp 10 different columns,
## Output_0 to Output_9
trainset  <- cbind(training_data[, 1:64], class.ind(training_data$V65))

## Set the names of the split columns
colnames(trainset)[65:74] <- c("Output_0","Output_1","Output_2","Output_3","Output_4","Output_5","Output_6","Output_7","Output_8","Output_9")

## Create formula for training
n <- names(trainset)
f <- as.formula(paste("Output_0+Output_1+Output_2+Output_3+Output_4+Output_5+Output_6+Output_7+Output_8+Output_9 ~", paste(n[!n %in% c("Output_0","Output_1","Output_2","Output_3","Output_4","Output_5","Output_6","Output_7","Output_8","Output_9")], collapse = " + ")))

## Using neuralnet method to train the data
nn_model <- neuralnet(f, data = trainset, hidden=10, threshold = 0.01, linear.output = F)

## Plot the neural network diagram
plot(nn_model)

## Split the class variable column in cross validation dataset into columns for each class
crossvalidationset <- cbind(crossvalidation_data[, 1:64], class.ind(crossvalidation_data$V65))
colnames(crossvalidationset)[65:74] <- c("Output_0","Output_1","Output_2","Output_3","Output_4","Output_5","Output_6","Output_7","Output_8","Output_9")

## Compute method will compute the output of all neurons in crossvalidation dataset using trained neural network
out = compute(nn_model, crossvalidationset[,1:64])

## Get the test data
testdata <- read.csv(file="optdigits_test.csv",header = FALSE)
testset  <- cbind(testdata[, 1:64], class.ind(testdata$V65))
colnames(testset)[65:74] <- c("output0","output1","output2","output3","output4","output5","output6","output7","output8","output9")
n <- names(testset)

## Compute method will compute the output of all neurons in test dataset using trained neural network
outtest = compute(nn_model, testset[,1:64])

## This code is used to find the error % in the predicted test data
#maxidx <- function(arr) {
#  return(  which(arr == max(arr)) )
#}
#idx <- apply(outtest$net.result, c(1), maxidx)
#prediction <- c("Output_0","Output_1","Output_2","Output_3","Output_4","Output_5","Output_6","Output_7","Output_8","Output_9")[idx]
#table(prediction, testdata$V65)
#mean(idx - 1 == testdata$V65)