/*
Problem 1
Create a unified query categorizing job postings into two groups: those With Salary Info and those Without Salary Info.
Return job_id, job_title, and a new column named salary_info.
*/

 (
    SELECT
        job_id,
        job_title,
        'With_salary_info' as salary_info -- Custom field indicating salary info presence
    FROM
    job_postings_fact
    WHERE salary_year_avg IS NOT NULL
)

UNION ALL

 (
    SELECT
        job_id,
        job_title,
        'Without_salary_info' as Salary_info -- Custom field indicating absence of salary info
    FROM
    job_postings_fact
    WHERE salary_year_avg IS NOT NULL
)
ORDER BY
salary_info,
job_id desc


/*
Problem 2
Retrieve the job id, job title short, job location, job via, skill and skill type for each job posting from the first quarter (January to March). 
Using a subquery to combine job postings from the first quarter.
Only include postings with an average yearly salary greater than $70,000.
*/

SELECT
     job_postings_q1.job_id,
     job_postings_q1.job_title_short,
     job_postings_q1.job_location,
     job_postings_q1.job_via,
     job_postings_q1.salary_year_avg,
     skills_dim.skills,
     skills_dim.type
FROM(
    SELECT *
    FROM january_jobs_1
    UNION ALL
    SELECT *
    FROM february_jobs_2    
    UNION  ALL
    SELECT *
    FROM march_jobs_3
) as job_postings_q1
LEFT JOIN skills_job_dim    
    on job_postings_q1.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim
    on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_q1.salary_year_avg > 70000
ORDER BY job_postings_q1.salary_year_avg DESC;

/*
Problem 3
Analyze the monthly demand for skills by counting the number of job postings for each skill in the first quarter (January to March), utilizing data from separate tables for each month. 
Ensure to include skills from all job postings across these months. 
*/

WITH skills_q1 as (
    SELECT
        job_id,
        job_posted_date
    FROM january_jobs
    UNION ALL
    SELECT
        job_id,
        job_posted_date
    FROM 
        february_jobs  
    UNION  ALL
    SELECT
        job_id,
        job_posted_date
    FROM 
        march_jobs
),

month_skills_demand as (
    SELECT
    skills_dim.skills,
    EXTRACT(MONTH FROM skills_q1.job_posted_date) AS month,
    EXTRACT(YEAR FROM skills_q1.job_posted_date) AS year,
    COUNT(DISTINCT skills_job_dim.job_id) AS num_job_postings
    FROM skills_q1
    LEFT JOIN skills_job_dim
        ON skills_q1.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    GROUP BY
        skills_dim.skills,
        month,
        year
)
select
    skills,
    month,
    year,
    num_job_postings
from month_skills_demand
order by year, month, num_job_postings DESC;    