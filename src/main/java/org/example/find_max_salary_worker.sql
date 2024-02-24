-- this SQL query will return the workers with the highest salary
SELECT *
FROM worker
WHERE SALARY = (SELECT MAX(SALARY) FROM worker);
