## Amazon Baby Product reviews

Set working directory - setwd(“~/AmazonReviews/“)

AmazonReviews/AmazonNeuralNetwork.R - implements the neural network algorithm. All the code is available in this file. Use the command source(AmazonNeuralNetwork.R) to run this file in RStudio.

AmazonReviews/negative-words.txt - consists of list of negative words that can occur in a review.

AmazonReviews/positive-words.txt - consists of list of positive words that can occur in a review.

AmazonReviews/amazon_baby_train.csv - training dataset for amazon baby products review

AmazonReviews/amazon_baby_test.csv - test dataset for amazon baby product review

Expected wait time for AmazonNeuralNetwork.R is 15 minutes approx.

Libraries and Packages:
----------------------------
plyr
stringr
neuralnet
nnet
tm 

Special setup:
----------------------
Running source(AmazonReviews/AmazonNeuralNetwork.R) will load the all the required libraries if they are already installed. If they are not installed, then remove the comments for install.packages() and require() commands at the beginning of the AmazonNeuralNetworks.R file. Now, the source file will first install the packages and then run the rest of the code.

amazon_baby_train.csv, amazon_baby_test.csv, negative-words.txt, positive-words.txt, should be present in the working directory. In the source code, the path is relative and the code will look for these files in the working directory. It is better to have all the files in this folder in the working directory.


## OPTICAL RECOGNITION HANDWRITTEN DIGITS

setwd(~/DigitRecognition/)

DigitRecognition/DigitRecognitionNeuralNetwork.R - implements the neural networks algorithm. All the code is available in this file. Use the command source(DigitRecognitionNeuralNetwork.R) to run this file in RStudio.

DigitRecognition/optdigits_raining.csv - training dataset for optical recognition for handwritten digits

DigitRecognition/optdigits_test.csv - test dataset for optical recognition for handwritten digits

Libraries and Packages:
----------------------------
neuralnet
nnet 

Special setup:
----------------------
Running source(DigitRecognitionNeuralNetwork.R) will load the all the required libraries if they are already installed. If they are not installed, then remove the comments for install.packages() and require() commands at the beginning of the DigitRecognition.R file. Now, the source file will first install the packages and then run the rest of the code.

amazon_baby_train.csv, amazon_baby_test.csv, negative-words.txt, positive-words.txt, should be present in the working directory. In the source code, the path is relative and the code will look for these files in the working directory. It is better to have all the files in this folder in the working directory.
