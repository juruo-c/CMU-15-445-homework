SELECT name 
FROM people 
WHERE person_id IN (
	SELECT person_id
	FROM crew
	WHERE title_id IN (
		SELECT title_id
		FROM crew
		WHERE person_id = (
			SELECT person_id 
			FROM people
			WHERE name = 'Nicole Kidman' and
			born = 1967
		)
	) and (category = 'actor' or category = 'actress')
)
ORDER BY name;
