# Visualizing-my-spotify-data-2024-2025

## Table of Contents
* [About the project](#About-the-project)
* [Executive summary of insights](#Executive-summary-of-insights)
* [Technical Details and detailed insights](#Technical-Details-and-detailed-insights)
  *   [About the dataset](#About-the-dataset)
  *   [Tools and libraries](#Tools-and-libraries)
  *   [Data cleaning, transaformations and troubleshooting](#Data-cleaning-transformations-and-troubleshooting)
  *   [Data analysis and visualization](#Detailed-insights-and-visualizations)
   

## About the project 
For this project, I wanted to create my own version of Spotify wrapped, with additional insights. 

I was interested in the following questions:
1) In addition to my top songs of the year, I was also interested in learning 
how often I listened to my top songs over the course of the year- for example, which songs have I been 
listening to consistenly over the year versus favored only at some points during the year? 
2) How much time did I spend listening to music this year? What are my peak listening hours?
3) Which genres do I tend to listen to the most? 

The detailed notebook of the project is [here].

## Executive-summary-of-insights
1. Surprisingly I listened to my top song "Chaleya" **every single month** this part year (March 1,2024- February 28,2024)! I listened to it heavily early last year then cooled 
off slightly for a few months then got into it again.
2. I listen to music the most on average between 1 and 2 pm. I listend to almost 12 hours of music in Jan 2025, which was the highest month of listening time over the year. 
3. My top genres span across dance pop, bollywood, bhangra, Chrismas music, flamenco, jazz and soul. I know that I listened to a lot of different generes so the genre variability was not surprising. 


## Technical-Details-and-detailed-insights

## About-the-dataset
I requested my data from Spotify and asked for the extended streaming history. When I received the data,
I saw that Spotify had broken it down into year ranges somewhat randomly. I wanted to analyze my data from the past year (I am writing this in Mid April 2025).

To extract the data from the past year I grabbed two files containing data from 2019-2024 and then from 2024-2025 and uploaded in to a Jupyter notebook. 
I changed 'ts' which contained datetime information to pandas datetime format. The data contained 23 columns (insert screenshot)
![image](https://github.com/user-attachments/assets/6c69492e-a0c6-4fc0-9fe2-2e322ce6d71d)

## Tools-and-libraries

The data cleaning and transformation part of this project was done in Python using Jupyter notebooks. 

The libraries used were Pandas and Spotipy.

The visualization part of this project was done using Tableau public.


## Data-cleaning-transformations-and-troubleshooting

Data cleaning and transformation
- I noticed 7 columns that had no data so I dropped those.
- Since I had grabbed data from multiple years, I filtered the data to retain columns from March 1, 2024 to February 28, 2025.
- I also added 3 new columns. I created seconds listened from milliseconds listened for each row. I also extracted month and year from the date time 
column,  thinking it might help with visualization across the year later on.
- I noticed that the spotify data didn't contain any genre information. I used spotipy which a Python library for Spotify API to grab genre information 
for my spotify data. I got my client ID and Client secret from the spotify developer account. Then I used the documentation available for spotipy to 
loop through the track_uri in my dataset to extract artist and then genre information. 

Troubleshooting: 
- When trying to run through the uri list to extract genre, I got an error message saying that there was a null value within track uri list. I realized that
I had missed a row with mostly null values across several columns. I dropped that row because I didn't think it added / took anything away from the data overall.
- Initally I grabbed all the track uri's from the data and tried to grab genre for each of them. But the code kept breaking and gave
authorization related errors. Separately I also ran into a rate/request limit error. I suspected that looping through all 2502 rows of track uris might 
be exceeding some limit. So I grabbed only the unique track uris to generate genre, reducing the list to 670. This approach worked and I was able to extract the genre
for my songs. 

I had two files at this point- one with my original spotify data and another with genre information for my songs. 
I loaded both files into Tableau so I could visualize the data. 

## Detailed-insights-and-visualizations

1. Top songs by month
I listened to my first top song every month in the last year, while the second song managed to be in the top list even though I discovered in Jan 2025!
In the middle of the list I have a couple of songs that I listened to early last year and then stopped for a few months then picked up back again.
The last three songs I know are old favorites that I rediscovered in the last few months. It was cool to see when I had found new songs and rediscovere old favorites over the last year.

    ![image](https://github.com/user-attachments/assets/76b7551a-de32-4e93-99f8-b61b157b7c5a)


2. Listening time by day and minutes listened by month.
I didn't realize that I have a peak listening hour between 1 and 2pm. I wonder if this is because I eat lunch during this time and take a bit of a listening break.
Also surprised to see that I listen to music quite late at night. It didn't even register. 
I steadily listened to music for longer in the later half of last year and going into 2025, with January of this year being the most listening time accrued over the year. 
    ![image](https://github.com/user-attachments/assets/c161f54d-3e30-4dce-aa73-b5e49f16bd5a)


3. I listen to a lot of different genres which I was happy to see. I listen to a fair amount of different types of Indian music, along with an mix of flamenco, jazz and pop.
I am skeptical of Spotify's classification of a few genres. I don't agree with spotify's classification of the songs under "Tamil pop". I would think they are Bollywood songs.
I also had to look up "doo-wop". For exmaple, I don't think Mr. Sandman by the Chordettes is doo- wop. I did grab the first genre in the list of 
genres that spotipy gave me so I wonder if some of the other genres would be a better fit. 
    ![image](https://github.com/user-attachments/assets/c5f4a561-008b-4ebc-9034-7dc301a2ecd0)


Other fun visusalizations
1. I traveled to Spain, Portugal and India last year so it was cool to see that depicted in my spotify data.
    ![image](https://github.com/user-attachments/assets/0fa1e65d-89a9-4a24-9edf-fc4d706e811c)

2. My top song is also my most skipped song. I guess after listening to it every month in the last year I also get bored of it some days. 

   ![image](https://github.com/user-attachments/assets/4cece294-4417-4ff0-9763-e9eb68c7c742)

