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


csv = 'extracted_tweets.csv'
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

display(clean_df.head(10))
clean_df.info()
clean_df.to_csv('clean_tweet.csv',encoding='utf-8')

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
display(df.head(10))

rows=len(df)
ncount=0.0
for i in range (rows) :
    value=df['output'].iloc[i]
    if value>0.5 :
        ncount += 1


negtweetcount= (ncount/rows)*100

print(negtweetcount)
