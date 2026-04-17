-- Netflix Content Analysis SQL Queries

-- 1. Movies vs TV Shows
SELECT type, COUNT(*) AS total
FROM netflix
GROUP BY type;

-- 2. Top 10 Countries
SELECT main_country, COUNT(*) AS total
FROM netflix
GROUP BY main_country
ORDER BY total DESC
LIMIT 10;

-- 3. Top Genres
SELECT main_genre, COUNT(*) AS total
FROM netflix
GROUP BY main_genre
ORDER BY total DESC
LIMIT 10;

-- 4. Content Growth Over Time
SELECT year_added, COUNT(*) AS total
FROM netflix
GROUP BY year_added
ORDER BY year_added;

-- 5. Movies vs TV Shows Trend
SELECT year_added, type, COUNT(*) AS total
FROM netflix
GROUP BY year_added, type
ORDER BY year_added;

-- 6. Average Movie Duration
SELECT AVG(duration_num) AS avg_duration
FROM netflix
WHERE type = 'Movie';

-- 7. Top 5 Years with Most Content
SELECT year_added, COUNT(*) AS total
FROM netflix
GROUP BY year_added
ORDER BY total DESC
LIMIT 5;

-- 8. Content By Rating
SELECT rating, COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC;

-- 9. Movie VS TV % Distribution
SELECT
    type,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix) AS percentage
FROM netflix
GROUP BY type;

-- 10. Longest Movies
SELECT title, duration_num
FROM netflix
WHERE type = 'Movie'
ORDER BY duration_num DESC
LIMIT 10;

-- 11. Content by Month (SEASONALITY)
SELECT month_added, COUNT(*) AS total
FROM netflix
GROUP BY month_added
ORDER BY month_added;