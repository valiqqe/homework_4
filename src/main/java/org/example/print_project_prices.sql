-- this query will output the price of the project depending on the salary of the workers
SELECT
    p.ID,
    SUM(w.SALARY * TIMESTAMPDIFF(MONTH, p.START_DATE, p.END_DATE)) AS PRICE
FROM
    project p
JOIN
    project_worker pw ON p.ID = pw.PROJECT_ID
JOIN
    worker w ON pw.WORKER_ID = w.ID
GROUP BY
    p.ID
ORDER BY
    PRICE DESC;