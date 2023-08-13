SELECT primary_title, votes
FROM crew JOIN titles ON titles.title_id = crew.title_id
JOIN ratings ON ratings.title_id = titles.title_id
WHERE person_id = (
	SELECT person_id FROM people
	WHERE name LIKE '%Cruise%' and born = 1962
)
GROUP BY titles.title_id
ORDER BY votes DESC
LIMIT 10;
