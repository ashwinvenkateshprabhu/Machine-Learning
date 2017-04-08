## Author: Ashwin Venkatesh Prabhu
## Executed using PyCharm

import csv
import pandas as pd
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

## Get the input training set and test set
## Path needs to be changed before executing to the appropriate location of the file
## Can be used to amazon_baby_train.csv as well as amazon_baby_test.csv
input = pd.read_csv("/Users/ashwinvprabhu/Documents/UNCC_Coursework/ML/kNN-Boosting/AmazonReviews/amazon_baby_train.csv")

## This object is used to calculate he sentiment of the reviews
analyzer = SentimentIntensityAnalyzer()

## Write the output of the sentiment analysis to the below mentioned file
## Path needs to be changed before executing to the appropriate location of the file
## Output sentiment_train.csv as well as sentiment_test.csv
out = open("/Users/ashwinvprabhu/Documents/UNCC_Coursework/ML/kNN-Boosting/AmazonReviews/sentiment_train.csv",'w')
csv_out = csv.writer(out)

## Features included in the output file are review, rating, negative score of review,
csv_out.writerow(['review','rating','negative_score', 'positive_score', 'neutral_score','compound_value'])

i = 0
## Loop through all the reviews
for sentence in input.review:
    ## Calculate the polarity scores of the review using SentimentIntensityAnalyzer object
    scores = analyzer.polarity_scores(str(sentence))

    ## Write the calculated sentiment scores (positive, negative, neutral and compound values)
    csv_out.writerow([str(sentence),
                      str(input.iloc[i].rating),
                      str(scores['neg']),
                      str(scores['pos']),
                      str(scores['neu']),
                      str(scores['com'])])
    i = i + 1
