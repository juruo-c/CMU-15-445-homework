WITH appearances AS (
    SELECT people.name AS NAME, COUNT(*) AS NUM_APPEARANCES
    FROM people, crew
    WHERE crew.person_id = people.person_id
    GROUP BY people.person_id
)
SELECT NAME, NUM_APPEARANCES
FROM appearances
ORDER BY NUM_APPEARANCES DESC
LIMIT 20;
