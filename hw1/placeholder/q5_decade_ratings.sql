WITH tmp AS (
SELECT ((titles.premiered / 10) || '0s') AS DECADE,
	ROUND(AVG(rating), 2) AS AVG_RATING, MAX(rating) AS TOP_RATING,
	MIN(rating) AS MIN_RATING, COUNT(*) AS NUM_RELEASES
FROM ratings, titles
WHERE ratings.title_id = titles.title_id and premiered IS NOT NULL
GROUP BY titles.premiered / 10
)
SELECT * 
FROM tmp
ORDER BY AVG_RATING DESC, DECADE;
