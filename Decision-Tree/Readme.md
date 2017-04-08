AMAZON REVIEWS:
——————————————————
setwd(“~/AmazonReviews/“)
Files in this project:
-------------------------
AmazonReviews/AmazonDecisionTree.R - implements the decision tree algorithm. All the code is available in this file. Use the command ‘source(“AmazonDecisionTree.R”)’ to run this file in RStudio.

AmazonReviews/negative-words.txt - consists of list of negative words that can occur in a review.

AmazonReviews/positive-words.txt - consists of list of positive words that can occur in a review.

AmazonReviews/amazon_baby_train.csv - training dataset for amazon baby products review

AmazonReviews/amazon_baby_test.csv - test dataset for amazon baby product review

AmazonReviews/amazon_traintestdata_result.csv - this file is generated after the decision tree program is run. This consists of 30% cross validation test data set aside to train the pruned decision tree. This will have an extra column called Output, which will hold the predicted value for class attribute. We can use this file to check the accuracy of the algorithm.

AmazonReviews/amazon_testdata_result.csv - this file is generated after the decision tree program is run. This consists of original test data. This will have an extra column called Output, which will hold the predicted value for class attribute. We can use this file to check the accuracy of the algorithm for the test data.

AmazonReviews/CreateWordcloud.R - Used “wordcloud” library to create a word cloud to illustrate the most number of words used in the reviews. The script to create the word cloud is available in AmazonReviews folder – AmazonReviews/create_wordcloud.R. Load the reviews data (test or training) into a variable named “data” and run this file using source(“CreateWordcloud.R”). Expect a wait time of 10 minutes or more for the wordcloud to appear.

Expected wait time for AmazonDecisionTree.R is 5-10 minutes.

Libraries and Packages:
----------------------------
plyr
stringr
rpart 

Special setup:
----------------------
Running source(“AmazonReviews/AmazonDecisionTree.R”) will load the all the required libraries if they are already installed. If they are not installed, then remove the comments for “install.packages(“”)” and “library(“”)” commands at the beginning of the AmazonReviewSentiment.R file. Now, the source file will first install the packages and then run the rest of the code.

amazon_baby_train.csv, amazon_baby_test.csv, negative-words.txt, positive-words.txt, should be present in the working directory. In the source code, the path is relative and the code will look for these files in the working directory. It is better to have all the files in this folder in the working directory.


OPTICAL RECOGNITION HANDWRITTEN DIGITS:
———————————————————————————————————————————
setwd(“~/DigitRecognition/“)
Files in this project:
-------------------------
DigitRecognition/DigitRecognition.R - implements the decision tree algorithm. All the code is available in this file. Use the command ‘source(“DigitRecognitionDecisionTree.R”)’ to run this file in RStudio.

DigitRecognition/optdigits_raining.csv - training dataset for optical recognition for handwritten digits

DigitRecognition/optdigits_test.csv - test dataset for optical recognition for handwritten digits

DigitRecognition/input_test_result.csv - this file is generated after the decision tree program is run. This consists of 30% cross validation test data set aside to train the pruned decision tree. This will have an extra column called Output, which will hold the predicted value for class attribute. We can use this file to check the accuracy of the algorithm.

DigitRecognition/test_result.csv - this file is generated after the decision tree program is run. This consists of original test data. This will have an extra column called Output, which will hold the predicted value for class attribute. We can use this file to check the accuracy of the algorithm for the test data.

Libraries and Packages:
----------------------------
rpart 

Special setup:
----------------------
Running source(“DigitRecognitionDecisionTree.R”) will load the all the required libraries if they are already installed. If they are not installed, then remove the comments for “install.packages(“”)” and “library(“”)” commands at the beginning of the DigitRecognition.R file. Now, the source file will first install the packages and then run the rest of the code.

amazon_baby_train.csv, amazon_baby_test.csv, negative-words.txt, positive-words.txt, should be present in the working directory. In the source code, the path is relative and the code will look for these files in the working directory. It is better to have all the files in this folder in the working directory.
