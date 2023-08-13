SELECT name, 2022 - born AS age
FROM people
WHERE died IS NULL and born >= 1900
ORDER BY age DESC, name
LIMIT 20;
