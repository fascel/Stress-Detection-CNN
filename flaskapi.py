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

from flask import Flask, render_template, request
app = Flask(__name__)
app.config.update(DEBUG=True)

@app.route('/')
def student():
   return render_template('graph.jsp')


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
tweets = extractor.user_timeline(screen_name="FactsOfSchool", count=20)
print("Number of tweets extracted: {}.\n".format(len(tweets)))

# We print the most recent 5 tweets:

for tweet in tweets[:1]:
    print(tweet.text)
    print()
    # We create a pandas dataframe as follows:
    data = pd.DataFrame(data=[tweet.text for tweet in tweets], columns=['Tweets'])
    data.to_csv('C:/Users/Fascel/Desktop/BEProject/templates/extracted_tweets.csv',encoding='utf-8')
    # We display the first 10 elements of the dataframe:
    display(data.head(10))



import re
import pandas as pd
import numpy as np      # For number computing



# For plotting and visualization:
from IPython.display import display
from bs4 import BeautifulSoup
from keras.models import model_from_json
from nltk.tokenize import WordPunctTokenizer
from keras.preprocessing.text import Tokenizer
from keras.preprocessing.sequence import pad_sequences


tok = WordPunctTokenizer()

pat1 = r'@[A-Za-z0-9_]+'
pat2 = r'https?://[^ ]+'
combined_pat = r'|'.join((pat1, pat2))
www_pat = r'www.[^ ]+'
negations_dic = {"isn't":"is not", "aren't":"are not", "wasn't":"was not", "weren't":"were not",
                "haven't":"have not","hasn't":"has not","hadn't":"had not","won't":"will not",
                "wouldn't":"would not", "don't":"do not", "doesn't":"does not","didn't":"did not",
                "can't":"can not","couldn't":"could not","shouldn't":"should not","mightn't":"might not",
                "mustn't":"must not"}
neg_pattern = re.compile(r'\b(' + '|'.join(negations_dic.keys()) + r')\b')

def tweet_cleaner_updated(text):
    soup = BeautifulSoup(text, 'lxml')
    souped = soup.get_text()
    try:
        bom_removed = souped.decode("utf-8-sig").replace(u"\ufffd", "?")
    except:
        bom_removed = souped
    stripped = re.sub(combined_pat, '', bom_removed)
    stripped = re.sub(www_pat, '', stripped)
    lower_case = stripped.lower()
    neg_handled = neg_pattern.sub(lambda x: negations_dic[x.group()], lower_case)
    letters_only = re.sub("[^a-zA-Z]", " ", neg_handled)
    # During the letters_only process two lines above, it has created unnecessay white spaces,
    # I will tokenize and join together to remove unneccessary white spaces
    words = [x for x  in tok.tokenize(letters_only) if len(x) > 1]
    return (" ".join(words)).strip()


csv = 'C:/Users/Fascel/Desktop/BEProject/templates/extracted_tweets.csv'
data = pd.read_csv(csv,index_col=0)


print("Cleaning the tweets...\n")
clean_tweet_texts = []
for i in range(0, len(data)):
        if ((i + 1) % 100000 == 0):
            print("Tweets %d of %d has been processed" % (i + 1, len(data)))
        clean_tweet_texts.append(tweet_cleaner_updated(data['Tweets'][i]))

clean_df = pd.DataFrame(clean_tweet_texts, columns=['text'])

clean_df[clean_df.isnull().any(axis=1)].head()

np.sum(clean_df.isnull().any(axis=1))

clean_df.isnull().any(axis=0)

clean_df.dropna(inplace=True)
clean_df.reset_index(drop=True,inplace=True)

display(clean_df.head(len(clean_df)))
clean_df.info()
clean_df.to_csv('C:/Users/Fascel/Desktop/BEProject/templates/clean_tweet.csv')

x = clean_df.text

tokenizer = Tokenizer(num_words=100000)
tokenizer.fit_on_texts(x)
sequences_test = tokenizer.texts_to_sequences(x)
x_test_seq = pad_sequences(sequences_test, maxlen=45)

for y in x_test_seq[:10]:
    print(y)


json_file = open('model.json','r')
loaded_model_json = json_file.read()
json_file.close()
loaded_model = model_from_json(loaded_model_json)
loaded_model.load_weights('model_weights.h5')



prediction = loaded_model.predict(x_test_seq)
#proba=loaded_model.predict_classes(x_test_seq)

df = pd.DataFrame(prediction, columns = ['output'])


rows=len(df)

display(df.head(rows))

ncount=0.0
for i in range (0,rows) :
    value=df['output'].iloc[i]
    if value>0.5 :
        ncount += 1


negtweetcount= (ncount/rows)*100

print(negtweetcount)


@app.route('/last', methods=['POST'])
def last():
   if request.method == 'POST':
      negativity=int(negtweetcount)
      return render_template('output.jsp',negativity=negativity)
   
if __name__ == '__main__':
   app.run(debug = True,use_reloader= True)