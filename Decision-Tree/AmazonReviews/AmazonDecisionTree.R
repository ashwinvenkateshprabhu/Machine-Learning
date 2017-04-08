## Author: Ashwin Venkatesh Prabhu
## email: avenka11@uncc.edu
## Analysis of Amazon using Decision trees

## install.packages("rpart")
## install.packages("plyr")
## install.packages("stringr")

## library(rpart)
## library(plyr)
## library(stringr)

require(rpart)

## Calculates the sentiment scores of all the reviews in the dataset
## Argument passed are sentences (holding all reviews), pos.words (with all the positive words),
## neg.words (with all the negative words), .progress (dispkays the progress of the operation)
score.sentiment <- function(sentences, pos.words, neg.words, .progress = 'text')
{
        require(plyr)
        require(stringr)
        scores <- laply(sentences, function(sentence, pos.words, neg.words){
                sentence <- gsub('[[:punct:]]', "", sentence)
                sentence <- gsub('[[:cntrl:]]', "", sentence)
                sentence <- gsub('\\d+', "", sentence)
                sentence <- tolower(sentence)
                word.list <- str_split(sentence, '\\s+')
                words <- unlist(word.list)
                pos.matches <- match(words, pos.words)
                neg.matches <- match(words, neg.words)
                pos.matches <- !is.na(pos.matches)
                neg.matches <- !is.na(neg.matches)
                score <- sum(pos.matches) - sum(neg.matches)
                return(c(score, sum(pos.matches), sum(neg.matches)))
        }, pos.words, neg.words, .progress = .progress)
        scores.df <- data.frame(score = scores[,1], text = sentences, pos_count = scores[,2], neg_count = scores[,3])
        return(scores.df)
}

## Fetching the positive and negative words from the test
positive_words <- scan('positive-words.txt', what='character', comment.char=';')
negative_words <- scan('negative-words.txt', what='character', comment.char=';')

## Load train dataset
amazon_train_dataset <- read.csv('amazon_baby_train.csv', header = TRUE)
amazon_train_dataset$review <- as.factor(amazon_train_dataset$review)

## Calculate sentiment scores for the reviews
scores <- score.sentiment(amazon_train_dataset$review, positive_words, negative_words, .progress='text')
amazon_train_dataset$score <- scores[,1]
amazon_train_dataset$pos_count <- scores[,3]
amazon_train_dataset$neg_count <- scores[,4]

## Divide train data into 70% train data and 30% cross validation test data
train <- sample(1:nrow(amazon_train_dataset), 0.7*nrow(amazon_train_dataset))
input_trainData <- amazon_train_dataset[train, ]
input_testData <- amazon_train_dataset[-train, ]

## model tree created
rpartMod <- rpart(rating ~ score + pos_count + neg_count, data = input_trainData, method = "class",parms = list(split = 'information'), minsplit = 2, minbucket = 1)

## Tree has been pruned
treePruned_inputtrain <- prune(rpartMod,cp = rpartMod$cptable[which.min(rpartMod$cptable[,"xerror"]), "CP"])

## Predict the class attribute for the 30% test data for cross validation
out <- predict(treePruned_inputtrain, newdata = input_testData, type="class")
input_testData$Output <- out

## Write the predicted output of cross validated test data to a csv file
## Can be used for verifying the predicted output
write.csv(input_testData, file = "amazon_traintestdata_result.csv")

## Testing with new test data
## Load the test data
amazon_test_data <- read.csv("amazon_baby_test.csv", header = TRUE)
amazon_test_data$review <- as.factor(amazon_test_data$review)

## Calculate sentiment scores for the reviews
test_scores <- score.sentiment(amazon_test_data$review, positive_words, negative_words, .progress='text')
amazon_test_data$score <- test_scores[,1]
amazon_test_data$pos_count <- test_scores[,3]
amazon_test_data$neg_count <- test_scores[,4]

## Predict the class attribute for the new test data
outtest <- predict(treePruned_inputtrain, newdata = amazon_test_data, type="class")
amazon_test_data$Output <- outtest

## Can be used for verifying the predicted output
write.csv(amazon_test_data, file = "amazon_testdata_result.csv")