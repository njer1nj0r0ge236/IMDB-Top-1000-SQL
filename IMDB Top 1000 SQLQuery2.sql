--- Top 10 highest-rated movies with the most votes
SELECT TOP 10 
    title, 
    averageRating, 
    numVotes
FROM imdb_top_1000
ORDER BY averageRating DESC, numVotes DESC;
-- All the movies have a rating above 9
-- The Shawshank Redemption  leads in rating and votes
-- Lesser-known films have the same top ratings

--- 1: Most Voted Movies
SELECT TOP 10 title, numVotes
FROM imdb_top_1000
ORDER BY numVotes DESC;
-- the top 10 most voted movies are: The Shawshank Redemption, The Dark Knight, Inception, Fight Club, Forrest Gump, Interstellar, Pulp Fiction, The Matrix, The Godfather, The Lord of the Rings: The Fellowship of the Ring

--- 2: Number of Movies by Decade
SELECT 
  (releaseYear / 10) * 10 AS decade,
  COUNT(*) AS movie_count
FROM imdb_top_1000
GROUP BY (releaseYear / 10) * 10
ORDER BY decade;
-- 2010 decade has the highest movie count of 240 while the 1920 decade has the least movie count of 17

--- 3: Most Popular Genres by Number of Votes
SELECT 
  LEFT(genres, CHARINDEX(',', genres + ',') - 1) AS genre,
  SUM(numVotes) AS total_votes
FROM imdb_top_1000
GROUP BY LEFT(genres, CHARINDEX(',', genres + ',') - 1)
ORDER BY total_votes DESC;
-- Action genre has the highest number of votes while Western genre has the least

--- 4:  Top 5 Movies Per Decade
WITH RankedMovies AS (
  SELECT 
    title,
    averageRating,
    releaseYear,
    (releaseYear / 10) * 10 AS decade,
    RANK() OVER (PARTITION BY (releaseYear / 10) * 10 ORDER BY averageRating DESC) AS rank_in_decade
  FROM imdb_top_1000
)
SELECT * 
FROM RankedMovies
WHERE rank_in_decade <= 5
ORDER BY decade, averageRating DESC;
-- Every decade has gems – Each decade features movies rated 8.3 and above, with some reaching 9+.
-- Most rated movie – The Shawshank Redemption (1994) leads with 9.3.
-- Strong 1990s & 2000s – These decades have many high-rated and globally loved titles.


--- 5: Movies with More Than 1 Million Votes
SELECT title, numVotes, averageRating
FROM imdb_top_1000
WHERE numVotes > 1000000
ORDER BY numVotes DESC;
--76 movies have over 1 million votes and an average voting of over 7.8

--- 6: Best Movies of Each Year (last 20 years)
WITH YearlyTop AS (
  SELECT 
    title, 
    releaseYear,
    averageRating,
    RANK() OVER (PARTITION BY releaseYear ORDER BY averageRating DESC) AS rnk
  FROM imdb_top_1000
  WHERE releaseYear >= YEAR(GETDATE()) - 20
)
SELECT *
FROM YearlyTop
WHERE rnk = 1
ORDER BY releaseYear DESC;
-- 2019 has 4 best movies; Parasite, Kumbalangi Nights, Jersey, and For Sama. All with a rating of 8.5
-- 2018 has 2 best movies; Resurrection, and Pariyerum Perumal. Both with a rating of 8.69999980926514  
-- 2016 has 2 best movies; O.J.: Made in America, and Mirror Game. Both with a rating of 8.89999961853027
-- 2015 has 2 best movies; Visaaranai, and Thani Oruvan. Both with a rating of 8.39999961853027
-- Each year's best movie has a rating of over 8.3

--- 7: Movies with the Worst Ratings (but a lot of votes)
SELECT TOP 10 title, averageRating, numVotes
FROM imdb_top_1000
WHERE numVotes > 500000
ORDER BY averageRating ASC;
-- Lowest-rated in the top 1000 still have a solid 7.8 rating.
-- All have huge vote counts (700k–1M+).
-- “Worst” here just means less loved, not actually bad.

--- 8: Find Hidden Gems: High Rating, Low Votes
SELECT title, averageRating, numVotes
FROM imdb_top_1000
WHERE numVotes < 50000 AND averageRating > 8.5
ORDER BY averageRating DESC;
-- Top-rated: The Chaos Class and Attack on Titan have 9.19999980926514 ratings with under 45K votes.
-- Underrated: Dozens rated 8.6–8.9 with <30K votes. They're loved by a small audience.


--- 9: Which Genres Dominate Certain Decades
SELECT 
  (releaseYear / 10) * 10 AS decade,
  LEFT(genres, CHARINDEX(',', genres + ',') - 1) AS genre,
  COUNT(*) AS movies_count
FROM imdb_top_1000
WHERE releaseYear IS NOT NULL
GROUP BY (releaseYear / 10) * 10, LEFT(genres, CHARINDEX(',', genres + ',') - 1)
ORDER BY decade, movies_count DESC;
--Genres evolve with time.
-- Drama was king in the early and mid-20th century.
-- Comedy took the spotlight in the 70s.
-- Action became dominant from the 2000s onwards.
-- Biographies and Documentaries are consistently gaining ground in the modern era.

--- 10: Do More Votes Always Mean Higher Ratings
SELECT 
  averageRating,
  AVG(numVotes) AS avg_votes
FROM imdb_top_1000
GROUP BY averageRating
ORDER BY averageRating DESC;
-- The highest rated movie (9.3) has over 3 million votes, indicating strong consensus from a large audience.
-- Ratings between 9.0–9.2 also attract high vote counts, but there's no consistent linear relationship between higher rating and more votes.
-- For example, 9.1 has only 16k votes, while 8.8 has over 1.1 million votes.
-- Some lower-rated movies (e.g., 7.8) have more votes (641k) than higher-rated ones (e.g., 8.1 with 223k).
--- More votes don’t always mean higher ratings. However, very high-rated movies that are also popular (e.g., Shawshank, Dark Knight) tend to have the most votes. Popularity (and exposure) can drive both votes and visibility, but not necessarily higher scores.
