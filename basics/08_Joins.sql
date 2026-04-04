/*
Problem 1
Retrieve a list of job titles (job_title from the job_posting_fact table) with their corresponding company names (name from the company_dim table). 
Also, get the job_id, job_location, and job_posted_date. 
Only return job postings that have the ‘Data Scientist' as the job title (job_title_short). 
Order by the job posted date in descending order.
*/

SELECT
    job_id,
    job_title,
    company_dim.name,
    job_location,
    job_posted_date
FROM
    job_postings_fact
INNER JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Scientist' 
ORDER BY
    job_posted_date DESC;

/*
Problem 2
Fetch all job postings, including their job_id, job_title, job_locaiton and the names of the skills required (skills); even if no skills are listed for a job.
Ensure that the job has a location that includes the words 'New York' and also offers health insurance.
Use the job_postings_fact, skills_job_dim, and skills_dim tables.
Order by job_id in descending order.
*/

SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.job_location,
    skills_dim.skills
   
FROM
    job_postings_fact
    LEFT JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_location LIKE '%New York%'
    AND job_postings_fact.job_health_insurance = TRUE
ORDER BY
    job_postings_fact.job_id DESC;

/*
problem 3
Identify the most in-demand skills for jobs that offer remote work and have an average yearly salary above $100,000. 
Focus on counting how many job postings mention each skill, so you can determine which skills are most valuable in the high-paying remote job market. 
Return the skill name (skills) and the number of job postings that mention each skill, ordered by the number of job postings in descending order.

Hint
Use INNER JOIN to connect job_postings_fact with skills_job_dim and skills_dim to relate job postings to skills.
In the WHERE clause use the job_work_from_home and salary_year_avg columns to filter for these two conditions (”offer remote work and have an average yearly salary above $100,000”).
Group results by skill name using GROUP BY.
Sort the results by the count of job postings in descending order with ORDER BY.
*/

SELECT
    skills_dim.skills,
    count(job_postings_fact.job_id) AS job_count
FROM
    job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_work_from_home =TRUE 
    AND job_postings_fact.salary_year_avg > 100000
GROUP BY
    skills_dim.skills
ORDER BY
    job_count DESC;