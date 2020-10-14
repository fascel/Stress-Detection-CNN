#!/usr/bin/python
import sys
print ('Number of Arguments:', len(sys.argv), 'arguments.')
print ('Argument List:', str(sys.argv))
print('This is Python Code')
print('Executing Python')
print('From Java')
# General:
import tweepy           # To consume Twitter's API
import pandas as pd     # To handle data
import numpy as np      # For number computing


# For plotting and visualization:
from IPython.display import display
#from matplotlib import pyplot as plt
#plt.ion()
#import seaborn as sns
# We import our access keys:
from credentials import *    # This will allow us to use the keys as variables

# API's setup:
def twitter_setup():
    """
    Utility function to setup the Twitter's API
    with our access keys provided.
    """
    # Authentication and access using keys:
    auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
    auth.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)

    # Return API with authentication:
    api = tweepy.API(auth)
    return api
# We create an extractor object:
extractor = twitter_setup()

# We create a tweet list as follows:
tweets = extractor.user_timeline(screen_name="FactsOfSchool", count=10)
print("Number of tweets extracted: {}.\n".format(len(tweets)))

# We print the most recent 5 tweets:

for tweet in tweets[:1]:
    print(tweet.text)
    print()
    # We create a pandas dataframe as follows:
    data = pd.DataFrame(data=[tweet.text for tweet in tweets], columns=['Tweets'])

    # We display the first 10 elements of the dataframe:
    display(data.head(10))

    data.to_csv('extracted_tweets.csv',encoding='utf-8')



