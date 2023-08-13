WITH tmp AS (
	SELECT DISTINCT(title) AS title
	FROM titles JOIN akas ON titles.title_id = akas.title_id
	WHERE primary_title = 'House of the Dragon'
	ORDER BY title
)
SELECT GROUP_CONCAT(title, ', ') FROM tmp;
