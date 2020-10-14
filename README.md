# Stress Detection Using Neural Networks 
## Problem Statement:
The project aims at building an automated system that monitors the social media activities of each student and calculates the stress levels based on the data obtained. 
The mentors will be provided analysis of their mentee’s stress levels and consultation will be provided accordingly.
Our Aim is to introduce a system that:
*	Assist students in identifying their different levels of stress.
*	Assist mentors in providing consultation based on the stress levels detected.

The solution being proposed includes employing real time twitter data by investigating the correlations between students' stress and their tweeting content, social engagement and behavioral patterns using 1D Convolutional Neural Networks.


## Proposed Solution :
The proposed solution aims at building an automated system that monitors the social media activities from twitter of each student and calculates the stress levels based on the data obtained.
<p align="center">
  <img alt="Proposed System" src="https://github.com/fascel/cnn/proposed_system.png?raw=true">
</p>
* Training Dataset: The dataset chosen for training is [Sentiment140](https://www.kaggle.com/kazanova/sentiment140), which originated from Stanford University.We prepocessed the data from this dataset which included cleaning and splitting the data into Training/Development/Testing Sets followed by generating WordEmbeddings(Word2Vec) and later Tokenization and Zero Padding.
* 1-D CNN model: This model is defined ,built and trained using the above mentioned preprocessed dataset and tested using the real time Twitter dataset.
* Twitter data is used to detect user's Psychological stress levels.
* In order to get the stress results, the real time extracted tweets are pre-processed using the same cleaning function used while training the model. These pre-processed tweets are then tokenised and zero padded and fed into the trained CNN model for predictions.
* The probability of negativity in each extracted tweet is predicted and the final stress percentage is calculated by counting the number of negative tweets (the tweets having a probability value less than 0.5) and deciding the result by the total number of tweets extracted.


