/*
Problem 1
We’re going to check that all skills that do not have a category assigned to it. 
Get all skills from the skills_dim table that don’t have a type (aka this type column is null). 
Return the skill_id and skills.
*/

SELECT
    skill_id,
    skills
FROM
    skills_dim
WHERE
    type is NULL

/*
Problem 2
Identify all job postings that have neither an annual average salary (salary_year_avg) nor an average hourly wage (salary_hour_avg) in the job_postings_fact table. 
Return the job_id, job_title, salary_year_avg, salary_hour_avg. 
This can be useful to look at postings where there’s no compensation. 
Order by job_id in ascending order.
*/

SELECT
    job_id,
    job_title,
    salary_year_avg,
    salary_hour_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg is NULL 
    and salary_hour_avg is NULL