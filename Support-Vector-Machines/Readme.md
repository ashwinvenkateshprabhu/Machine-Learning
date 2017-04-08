## Amazon Baby Product reviews

setwd(“~/AmazonReviews/“)

AmazonReviews/AmazonSVM.R - implements the SVM algorithm. All the code is available in this file. Use the command ‘source(“AmazonSVM.R”)’ to run this file in RStudio.

AmazonReviews/sentiment_train.csv - training dataset for amazon baby products review which is the output of running vader sentiment on amazon_baby_train.csv

AmazonReviews/sentiment_test.csv - test dataset for amazon baby products review which is the output of running vader sentiment on amazon_baby_test.csv

AmazonReviews/SentimentAnalysis.py - Python code to generate the sentiment score for train and test dataset. The input is “amazon_baby_train.csv” and “amazon_baby_test.csv”. The out for train and test datasets are stored in two separate csv files

Expected wait time for AmazonSVM.R is 1-3 minutes.

Libraries and Packages:
----------------------------
e1071, ggplot2

Special setup:
----------------------
* Running the .R file will load the all the required libraries if they are already installed. If they are not installed, then use “install.packages(“”)” and “library(“”)” commands to manually load all libraries.

* Use SentimentAnalysis.py with input as amazon_baby_train.csv, amazon_baby_test.csv to generate sentiment_train.csv and sentiment_test.csv. These file should be present in the working directory. In the source code, the path is relative and the code will look for these files in the working directory. It is better to have all the files in this folder in the working directory.


## OPTICAL RECOGNITION HANDWRITTEN DIGITS

setwd(“~/DigitRecognition/“)

DigitRecognition/DigitRecognitionSVM.R - implements the SVM algorithm. All the code is available in this file. Use the command ‘source(“DigitRecognitionSVM.R”)’ to run this file in RStudio.

DigitRecognition/optdigits_raining.csv - training dataset for optical recognition for handwritten digits

DigitRecognition/optdigits_test.csv - test dataset for optical recognition for handwritten digits


Libraries and Packages:
----------------------------
e1071, ggplot2 

Special setup:
----------------------
Running .R file will load the all the required libraries if they are already installed. If they are not installed, then use “install.packages(“”)” and “library(“”)” commands to manually load all the libraries.

optdigits_raining.csv, optdigits_test.csv should be present in the working directory. In the source code, the path is relative and the code will look for these files in the working directory. It is better to have all the files in this folder in the working directory.
