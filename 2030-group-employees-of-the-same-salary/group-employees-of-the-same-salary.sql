WITH salary_counts AS (
    SELECT employee_id, name, salary,
           COUNT(*) OVER (PARTITION BY salary) AS cnt
    FROM employees
)
SELECT employee_id, name, salary,
       DENSE_RANK() OVER (ORDER BY salary) AS team_id
FROM salary_counts
WHERE cnt > 1
ORDER BY salary, employee_id;



    
