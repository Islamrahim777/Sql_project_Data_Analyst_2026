/*
Problem 1
Identify companies with the most diverse (unique) job titles. 
Use a CTE to count the number of unique job titles per company, then select companies with the highest diversity in job titles.
*/


WITH tile_diversity AS
(
SELECT
    job_postings_fact.company_id,
    count(DISTINCT job_title) as unique_job_count
FROM    job_postings_fact
GROUP BY
    job_postings_fact.company_id
) 
SELECT
    company_dim.name,
    tile_diversity.unique_job_count
FROM
    tile_diversity
JOIN company_dim ON tile_diversity.company_id = company_dim.company_id
ORDER BY
    tile_diversity.unique_job_count DESC
LIMIT 10;   

/*

*/


WITH tile_diversity AS
(
SELECT
    job_postings_fact.company_id,
    count(DISTINCT job_title) as unique_job_count
FROM    job_postings_fact
GROUP BY
    job_postings_fact.company_id
) 
SELECT
    company_dim.name,
    tile_diversity.unique_job_count
FROM
    tile_diversity
JOIN company_dim ON tile_diversity.company_id = company_dim.company_id
ORDER BY
    tile_diversity.unique_job_count DESC
LIMIT 10;  



/*
Problem 2
Explore job postings by listing job id, job titles, company names, and their average salary rates, while categorizing these salaries relative to the average in their respective countries. 
Include the month of the job posted date. 
Use CTEs, conditional logic, and date functions, to compare individual salaries with national averages.

*/

    -- gets average job salary for each country
WITH avg_salaries AS (
    SELECT 
        job_country, 
        AVG(salary_year_avg) AS avg_salary
    FROM job_postings_fact
    GROUP BY job_country
)
SELECT
    -- Gets basic job info
    job_postings.job_id,
    job_postings.job_title,
    companies.name AS company_name,
    job_postings.salary_year_avg AS salary_rate,
    -- categorizes the salary as above or below average the average salary for the country
    CASE
        WHEN job_postings.salary_year_avg > avg_salaries.avg_salary
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_category,
    -- gets the month and year of the job posting date
    EXTRACT(MONTH FROM job_postings.job_posted_date) AS posting_month
FROM
    job_postings_fact as job_postings
INNER JOIN
    company_dim as companies ON job_postings.company_id = companies.company_id
INNER JOIN
    avg_salaries ON job_postings.job_country = avg_salaries.job_country
ORDER BY
    -- Sorts it by the most recent job postings
    posting_month desc, job_postings.job_posted_date desc


/*
Problem 3
Your goal is to calculate two metrics for each company:

The number of unique skills required for their job postings.

The highest average annual salary among job postings that require at least one skill.

Your final query should return the company name, the count of unique skills, and the highest salary. 
For companies with no skill-related job postings, the skill count should be 0 and the salary should be null.
*/

WITH required_skills AS (
    SELECT
        company_dim.company_id,
        count(distinct skills_job_dim.skill_id) as unique_skills_required
    FROM
    company_dim
    LEFT JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    GROUP BY
    company_dim.company_id
),
--Gets the highest average yearly salary from the jobs that require at least one skills
max_salary as (
    SELECT
    job_postings_fact.company_id,
    max(job_postings_fact.salary_year_avg) as highest_average_salary
    FROM
    job_postings_fact
   WHERE job_postings_fact.job_id IN (SELECT job_id FROM skills_job_dim)
   GROUP BY 
        job_postings_fact.company_id
     )
 --Join 2 CTEs with table to get the query
 SELECT
    companies.name,
    required_skills.unique_skills_required as unique_skills_required, --handle companies w/o any skills required
    max_salary.highest_average_salary
FROM
    company_dim AS companies
LEFT JOIN required_skills ON companies.company_id = required_skills.company_id
LEFT JOIN max_salary ON companies.company_id = max_salary.company_id
)
-- Joins 2 CTEs with table to get the query
SELECT
    companies.name,
    required_skills.unique_skills_required as unique_skills_required, --handle companies w/o any skills required
    max_salary.highest_average_salary
FROM
    company_dim AS companies
LEFT JOIN required_skills ON companies.company_id = required_skills.company_id
LEFT JOIN max_salary ON companies.company_id = max_salary.company_id
ORDER BY
    co