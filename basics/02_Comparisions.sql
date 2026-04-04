/*
Problem 1 
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Only return rows where the job location is in ‘Tampa, FL’.
Order by job_id in ascending order. 
*/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_location = 'Tampa, FL'
ORDER BY
    job_id ASC;

/*
Problem 2 
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, salary_year_avg, and job_schedule_type columns. 
Only return ‘Full-time’ jobs.
Order by job_id in ascending order. 
*/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_schedule_type
FROM
    job_postings_fact
WHERE
    job_schedule_type  = 'Full-time'
ORDER BY
    job_id ASC;

/*
Problem 3
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via,  job_schedule_type, and salary_year_avg columns. 
Only look at jobs that are not ‘Part-time’ jobs.
Order by job_id in ascending order. 
*/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    job_schedule_type,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_schedule_type != 'Part-time'
ORDER BY
    job_id ASC;

/*
Problem 4
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Only look at jobs that are not posted ‘via LinkedIn’.
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_via != 'LinkedIn'
ORDER BY
    job_id ASC;

/*
Problem 5
In the job_postings_fact table only get jobs that have an average yearly salary of $65,000 or greater. 
Also get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg >= 65000
ORDER BY
    job_id ASC;

/*
Problem 6
In the job_postings_fact table only get jobs that have an average yearly salary greater than $55,000. 
Also get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Order by job_id in ascending order.
*/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg > 50000
ORDER BY
    job_id ASC;

/*
Problem 7
In the job_postings_fact table only get jobs that have an average yearly salary less than $110,000. 
Also return the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg < 110000
ORDER BY
    job_id ASC;

/*
Problem 8
In the job_postings_fact table only get jobs that have an average yearly salary less than or equal to $150,000. 
Also return the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg <= 150000
ORDER BY
    job_id ASC;

/*
Problem 9
Return only Data Engineer’ jobs located within the ‘United States’ from the job_postings_fact table. 
Also, get the job_id, job_title_short, job_country, job_via and salary_year_avg columns. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_country,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Engineer' AND job_country = 'United States'
ORDER BY
    job_id ASC;

/*
Problem 10
In the job_postings_fact table let’s look at jobs that are either ‘Full-Time’ or ‘Contractor’ jobs. 
And return the job_id, job_title_short, job_location, job_via, salary_year_avg, and job_schedule_type columns. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_schedule_type
FROM
    job_postings_fact
WHERE
    job_schedule_type = 'Full-time' or job_schedule_type = 'Contractor'
ORDER BY
    job_id ASC;

/*
Problem 11
Only return jobs with a salary between (inclusive) $50,000 and $70,000 from the job_postings_fact table. 
And get the job_id, job_title_short, job_location, job_via and salary_year_avg columns. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via, 
    salary_year_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg >- 50000 AND 
    salary_year_avg <= 70000
ORDER BY
    job_id ASC;
    
/*
Problem 12
Only return jobs with a salary between (using the BETWEEN operator.) $50,000 and $70,000 from the job_postings_fact table. 
And get the job_id, job_title_short, job_location, job_via and salary_year_avg columns. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via, 
    salary_year_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg BETWEEN 50000 AND 70000
ORDER BY
    job_id ASC;

/*
Problem 13
Return job_title_short that are ‘Data Scientist’ or ‘Business Analyst’ roles from the job_postings_facttable. 
Also, return the job_id, job_title_short, job_location, job_via and salary_year_avg columns. 
Order by job_id in ascending order.
*/ 
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Scientest' OR
    job_title_short = 'Business Analyst'
ORDER BY
    job_id ASC;

/*
Problem 14
Return job_title_short that are ‘Data Analyst’, ‘Data Scientist’ or ‘Business Analyst’ roles from the job_postings_fact table using the IN operator. 
Also, return the job_id, job_title_short, job_location, job_via and salary_year_avg columns. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short IN ('Data Analyst', 'Data Scientest', 'Business Analyst')
ORDER BY
    job_id ASC;

/*
Problem 15
In the job_postings_fact table look at Data Analyst jobs whose average yearly salary range is between $50,000 and $75,000. 
Return the job_id, job_title_short, job_location and salary_year_avg. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg BETWEEN 50000 AND 75000
ORDER BY
    job_id ASC;

 /*
    Problem 16
In the job_postings_fact table, look at Data Analyst and Business Analyst jobs whose average yearly salary range is greater than $75,000. 
Return the job_id, job_title_short, job_location, salary_year_avg, and job_schedule_type. 
Order by job_id in ascending order.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    salary_year_avg,
    job_schedule_type
FROM
    job_postings_fact
WHERE
    job_title_short IN ('Data Analyst', 'Business Analyst') AND salary_year_avg > 75000
ORDER BY
    job_id ASC;

