SELECT DISTINCT(author_id) as id
FROM Views1
WHERE author_id = viewer_id
ORDER BY id ASC;