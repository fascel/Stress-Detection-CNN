from flask import Flask, render_template, request, redirect,url_for
import pypyodbc 
from flaskapi import *

app = Flask(__name__)

# creating connection Object which will contain SQL Server Connection

connection = pypyodbc.connect('Driver={SQL Server};Server=.\FASCELSQLSERVER;Database=demo;uid=sa;pwd=*****')# Creating C
cursor = connection.cursor()
#pursor = connection.cursor()

#s = "<table style='border:1px solid red'>"  
#for row in cursor:  
    #s = s + "<tr>"  
    #for x in row:  
         #s = s + "<td>" + str(x) + "</td>"  
#s = s + "</tr>" 

@app.route('/')
def home():
    return redirect(url_for('login'))

@app.route('/last', methods=['POST'])
def last():
    if request.method == 'POST':
        extractor = twitter_setup()
        # We create a tweet list as follows:
        tweets = extractor.user_timeline(screen_name="ChaudhariSanika", count=20)
        print("Number of tweets extracted: {}.\n".format(len(tweets)))
        # We print the most recent 5 tweets:
        for tweet in tweets[:1]:
            print(tweet.text)
            print()
            # We create a pandas dataframe as follows:
            data = pd.DataFrame(data=[tweet.text for tweet in tweets], columns=['Tweets'])
            data.to_csv(' extracted_tweets.csv',encoding='utf-8')
            # We display the first 10 elements of the dataframe:
            display(data.head(10))

        csv = ' extracted_tweets.csv'
        data = pd.read_csv(csv,index_col=0)
        csvs = ' XTrainArrays.csv'

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
        clean_df.to_csv('clean_tweet.csv')
        x = clean_df.text
        dfs = pd.read_csv(csvs,header=None)
        dfs.columns=['TrainTweet']
        y = dfs.TrainTweet
        tokenizer = Tokenizer(num_words=100000)
        tokenizer.fit_on_texts(y)
        sequences_test = tokenizer.texts_to_sequences(x)
        x_test_seq = pad_sequences(sequences_test, maxlen=45)

        for y in x_test_seq[:10]: 

            print(y)

        json_file = open('model.json','r')
        loaded_model_json = json_file.read()
        json_file.close
        loaded_model = model_from_json(loaded_model_json)
        loaded_model.load_weights('model_weights.h5')

        prediction = loaded_model.predict(x_test_seq)   

        df = pd.DataFrame(prediction, columns = ['output'])
        rows=len(df)
        display(df.head(rows))

        ncount=0.0
        for i in range (0,rows) :
            value=df['output'].iloc[i]
            if value<0.5 :
                ncount += 1
        negtweetcount= (ncount/rows)*100
        print(negtweetcount) 
        negativity=int(negtweetcount)
        K.clear_session()
    return render_template('output.jsp',negativity=negativity)    

@app.route('/first',methods=['GET', 'POST'])
def first():
    if request.method == 'POST':
         cursor.execute("SELECT * FROM dbo.Student " ) 
         data = cursor.fetchall()
         return render_template('studentslist.html',data=data) 

    return render_template('first.jsp')     

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
         cursor.execute("SELECT * FROM dbo.Admin " ) 
         for row in cursor: 
            email = row[0]
            print(email)
            password = row[1]
            print(password)
            if request.form['email'] == email and request.form['password'] == password :
                return redirect(url_for('first'))
    else:
        error = 'Invalid Credentials. Please try again.'
    return render_template('login.html',error=error)         
    

if __name__ == '__main__':
    app.run(debug=True,use_reloader= True)

