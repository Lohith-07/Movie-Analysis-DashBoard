create database movies;
use movies; 

CREATE TABLE movies (
    ID INT,
    Movie VARCHAR(255),
    Year INT,
    Certificate VARCHAR(50),
    Genre TEXT,
    Overview TEXT,
    Runtime INT,
    Rating DECIMAL(3,1),
    Num_Ratings INT,
    Decade INT,
    Movie_Age INT,
    Popularity_Score DECIMAL(10,4),
    Primary_Genre VARCHAR(100)
);

-- Preview data
SELECT * FROM movies LIMIT 5;
-- Unique Certificates
SELECT DISTINCT Certificate from movies ;
-- Unique Genres
select distinct Primary_Genre from movies;
-- Range Of Years of Movies
SELECT MIN(Year) AS oldest_year, MAX(Year) AS latest_year FROM movies;


-- Top 10 Most Popular Movies
SELECT Movie, Year, Popularity_Score
FROM movies
ORDER BY Popularity_Score DESC
LIMIT 10;

-- Top 10 Highest Rated Movies
SELECT Movie, Year, Rating
FROM movies
ORDER BY Rating DESC
LIMIT 10;

-- Movies with Rating more than Average
SELECT Movie, Rating
FROM movies
WHERE Rating > (SELECT AVG(Rating) FROM movies)
ORDER BY Rating DESC;

-- Top 10 Most Rated Movies
SELECT Movie, Year, Num_Ratings
FROM movies
ORDER BY Num_Ratings DESC
LIMIT 10;

-- No Of Movies By Genre
SELECT Primary_Genre, COUNT(*) as Total_Movies from movies
GROUP BY Primary_Genre
ORDER BY Total_Movies DESC;

-- Average Rating By Genre
SELECT Primary_Genre, AVG(Rating) as avg_rating from movies
GROUP BY Primary_Genre
ORDER BY avg_rating;

-- Popular Genre
SELECT Primary_Genre,MAX(Popularity_Score) as Popularity from movies
GROUP BY Primary_Genre
ORDER BY Popularity DESC;

-- Avg Rating by Certficate wise
SELECT Certificate, AVG(Rating) as avg_rating from movies
GROUP BY Certificate
ORDER BY avg_rating DESC;

-- Audience Engagement Certificate Wise
SELECT Certificate, SUM(Num_Ratings) AS total_ratings
FROM movies
GROUP BY Certificate
ORDER BY total_ratings DESC;

-- Most Engaging Movie Among Highly Rated Ones
SELECT Movie, Rating, Num_Ratings FROM movies
WHERE Rating >= 8.0
ORDER BY Num_Ratings DESC
LIMIT 10;

-- Movies Longer than Average Runtime
SELECT Movie, Runtime, Rating FROM movies
WHERE Runtime > (SELECT AVG(Runtime) FROM movies)
ORDER BY Runtime DESC;

-- Best Movies in each decade
SELECT Decade, Movie, Rating FROM movies m1
WHERE Rating = (
    SELECT MAX(Rating)
    FROM movies m2
    WHERE m1.Decade = m2.Decade
)
ORDER BY Decade;

-- Top 5 Oldest Highly Rated Movies
SELECT Movie, Year, Rating FROM movies
ORDER BY Year ASC, Rating DESC
LIMIT 5;

-- Most Successful Genres By popularity
SELECT Primary_Genre, ROUND(AVG(Popularity_Score), 2) AS avg_popularity FROM movies
GROUP BY Primary_Genre
ORDER BY avg_popularity DESC;

-- Years With Total No Of Movies
SELECT Year, COUNT(*) AS total_movies FROM movies
GROUP BY Year
ORDER BY total_movies DESC;

-- Trend Of Avg rating over years
SELECT Year, ROUND(AVG(Rating), 2) AS avg_rating
FROM movies
GROUP BY Year
ORDER BY Year;

-- Trend Of Avg rating over decades
SELECT Decade, ROUND(AVG(Rating), 2) AS avg_rating
FROM movies
GROUP BY Decade
ORDER BY Decade DESC;