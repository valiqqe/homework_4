-- this SQL query will return the client with the largest number of projects
SELECT w.*, project_count
FROM worker w
JOIN (
    SELECT pw.WORKER_ID, COUNT(*) AS project_count
    FROM project_worker pw
    GROUP BY pw.WORKER_ID
    HAVING COUNT(*) = (
        SELECT MAX(project_count)
        FROM (
            SELECT COUNT(*) AS project_count
            FROM project_worker
            GROUP BY WORKER_ID
        ) AS max_projects
    )
) AS max_projects_count ON w.ID = max_projects_count.WORKER_ID;