/*
Problem 1
Find the average salary both yearly (salary_year_avg) and hourly (salary_hour_avg) for job postings using the job_postings_fact table that were posted after June 1, 2023. 
Group the results by job schedule type. Order by the job_schedule_type in ascending order.

Hint
Calculate average salaries by using the AVG function on both salary_year_avg and salary_hour_avg.
Filter postings with WHERE for dates after June 1, 2023,
Group the results with job_schedule_type.
Use job_schedule_type for ORDER BY.
*/

SELECT
    job_schedule_type,
    avg(salary_year_avg) AS avg_yearly_salary,
    avg(salary_hour_avg) AS avg_hourly_salary
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01'
    job_schedule_type
ORDER BY
    job_schedule_type ASC;


/*Problem 2
Count the number of job postings for each month, adjusting the job_posted_date to be in 'America/New_York' time zone before extracting the month. 
Assume the job_posted_date is stored in UTC. Group by and order by the month.

Hint
Use the EXTRACT(MONTH FROM ...) function to get the month from job_posted_date and wihtin this EXTRACT convert it to the 'America/New_York' time zone using AT TIME ZONE (don’t forget to assume default is in ‘UTC’).
COUNT the number of job postings
GROUP BY the extracted month
ORDER BY the month.
*/

select
    EXTRACT(month from job_postings_fact.job_posted_date at time zone 'UTC' at time zone 'America/New_York') AS month,
    COUNT(job_id) as num_job_postings
FROM
    job_postings_fact
GROUP BY
    month
ORDER BY
    month ASC;



/*
Problem 3
Find companies (include company name) that have posted jobs offering health insurance, where these postings were made in the second quarter of 2023. Use date extraction to filter by quarter. And order by the job postings count from highest to lowest.

Hint
Join job_postings_fact and company_dim on company_id to match jobs to companies.
Use the WHERE clause to filter for jobs with job_health_insurance column.
Use EXTRACT(QUARTER FROM job_posted_date) to filter for postings in the second quarter.
Group results by company_name.
Count the number of job postings per company with COUNT(job_id).
Use HAVING to include only companies with at least one job posting.
ORDER BY the job postings count in descending order to get highest → lowest.
*/

select
    company_dim.name,
    COUNT(job_postings_fact.job_id) AS num_job_postings
FROM
    job_postings_fact
JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.job_health_insurance = True
    AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2
    AND EXTRACT(YEAR FROM job_postings_fact.job_posted_date) = 2023
GROUP BY
    company_dim.name
HAVING
    COUNT(job_postings_fact.job_id) > 0
ORDER BY
    num_job_postings DESC;



    CREATE TABLE january_jobs AS
    SELECT
     job_id,
     job_title_short,
     job_location,
     job_via,
     salary_year_avg,
     job_posted_date
      FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
        AND EXTRACT(YEAR FROM job_posted_date) = 2023;


    CREATE TABLE february_jobs AS
    SELECT
     job_id,
     job_title_short,
     job_location,
     job_via,
     salary_year_avg,
     job_posted_date
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 2
        AND EXTRACT(YEAR FROM job_posted_date) = 2023;


        CREATE TABLE march_jobs AS
    SELECT
     job_id,
     job_title_short,
     job_location,
     job_via,
     salary_year_avg,
     job_posted_date
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 3
        AND EXTRACT(YEAR FROM job_posted_date) = 2023;


        