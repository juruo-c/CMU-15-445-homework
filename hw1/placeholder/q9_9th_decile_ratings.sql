WITH 
    tmp AS (
	SELECT name, AVG(rating) AS avg_rating
	FROM people JOIN crew ON crew.person_id = people.person_id
		JOIN ratings ON ratings.title_id = crew.title_id
		JOIN titles on crew.title_id = titles.title_id
	WHERE born = 1955 and type = 'movie'
	GROUP BY people.person_id
),
    ntile_tmp AS (
	SELECT name, ROUND(avg_rating, 2) AS avg_rating,
		NTILE(10) OVER(ORDER BY avg_rating) AS ntile_rating
	FROM tmp
)
SELECT name, avg_rating 
FROM ntile_tmp
WHERE ntile_rating = 9
ORDER BY avg_rating DESC, name;
