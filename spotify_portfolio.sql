SELECT * FROM spotify_data
LIMIT 5;

-- top 10 songs and artist by listening time 
SELECT
	 master_metadata_track_name AS track_name,
     master_metadata_album_artist_name AS artist,
     SUM(ms_played)/60000 AS total_min_played
FROM spotify_data
GROUP BY track_name, artist
ORDER BY total_min_played DESC
LIMIT 10;

-- sorting listening time by year
SELECT 
	year,
	SUM(ms_played)/60000 AS total_min_played
FROM spotify_data
GROUP BY year
ORDER BY total_min_played DESC;

-- top 5 songs and artists in 2020 and listening time of those songs
SELECT
	 master_metadata_track_name AS track_name,
     master_metadata_album_artist_name AS artist,
     SUM(ms_played)/60000 AS total_min_played
FROM spotify_data
WHERE year= 2020
GROUP BY track_name, artist
ORDER BY total_min_played DESC
LIMIT 5;

-- variability across month over the years
SELECT
	MONTH(date) AS month,
    year,
	SUM(ms_played)/60000 AS total_min_played
FROM spotify_data
GROUP BY month, year;

-- TOP song each year
SELECT
    year,
    track_name,
    artist,
    total_ms_played
FROM (
    SELECT
        year,
		master_metadata_track_name AS track_name,
        master_metadata_album_artist_name AS artist,
        SUM(ms_played)/60000 AS total_ms_played,
        
        ROW_NUMBER() OVER(PARTITION BY year ORDER BY SUM(ms_played)/60000 DESC) AS rn
    FROM
        spotify_data 
    GROUP BY
        year,
        track_name,
        artist
) AS ranked_songs
WHERE
    rn = 1; 
    
    
    
