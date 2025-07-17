with seniorcandidates as (
    select *,
        sum(salary) over (order by salary) as cumsum
        from candidates
        where experience = "Senior"

),
JuniorCandidates as (
    select *,
        sum(salary) over (order by salary) as cumsum
    from candidates
    where experience = "Junior"
), 
hiredseniors as (
    select count(*) as count
    from seniorcandidates
    where cumsum <= 70000

),
remainingbudget as (
    select
        70000 - coalesce(
            (select
                cumsum
            from seniorcandidates
            where 
                cumsum <= 70000
            order by 
                cumsum desc
            limit 1), 0
        ) as budget
), hiredjuniors as (
    select count(*) as count
    from JuniorCandidates, remainingbudget
    where JuniorCandidates.cumsum <= remainingbudget.budget
)
SELECT 
  'Senior' AS experience, 
  (
    SELECT 
      count 
    FROM 
      HiredSeniors
  ) AS accepted_candidates 
UNION 
SELECT 
  'Junior' AS experience, 
  (
    SELECT 
      count 
    FROM 
      HiredJuniors
  ) AS accepted_candidates;