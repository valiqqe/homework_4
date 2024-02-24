-- this SQL query will return the project with the largest number of months
SELECT *
FROM project
WHERE TIMESTAMPDIFF(MONTH, START_DATE, END_DATE) IN (
    SELECT MAX(TIMESTAMPDIFF(MONTH, START_DATE, END_DATE))
    FROM project
);
