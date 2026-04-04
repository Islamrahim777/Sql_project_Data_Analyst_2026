/*
Problem 1
Create a table named data_science_jobs that will hold information about job postings. 
Include the following columns: job_id (integer and primary key), job_title (text), company_name (text), and post_date (date).
*/

CREATE TABLE data_science_jobs(
    job_id INTEGER PRIMARY KEY,
    job_title TEXT,
    company_name TEXT,
    post_date DATE
);

/*
Problem 2
Insert three job postings into the data_science_jobs table. 
Make sure each job posting has a unique job_id, a job_title, a company_name, and a post_date.
*/
INSERT INTO data_science_jobs(
    job_id,
    job_title,
    company_name,
    post_date
)
VAlUES(
    1,
    'Data Sciencet',
    'Tech Innovations',
    '2023-01-01'
),
(
    2,
    'Machine Learning Engineer',
    'Data Driven Co',
    '2023-01-15'
),
(
    3,
    'AI Specialist',
    'Future Tech',
    '2023-02-01'
);

/*
Problem 3
Alter the data_science_jobs table to add a new boolean column (uses True or False values) named remote.
*/
ALTER TABLE data_science_jobs
add column remote boolean;

/*
Problem 4
Rename the post_date column to posted_on from the data_science_job table.
*/
ALTER TABLE data_science_jobs
Rename column post_date to posted_on;

/*
problem 5
Modify the remote column so that it defaults to FALSE in the data_science_job table.
*/
ALTER TABLE data_science_jobs
ALTER COLUMN remote SET DEFAULT FALSE;

/*
Problem 6
Drop the company_name column from the data_science_jobs table.
*/
ALTER TABLE data_science_jobs
Drop column company_name;

/*
Problem 7
Update the job posting with the job_id = 2 . 
Update the remote column for this job posting to TRUE in data_science_jobs.
*/
UPDATE data_science_jobs
SET remote = True
WHERE job_id = 2;

/*
Problem 8
Drop the data_science_jobs table.
*/
DROP TABLE data_science_jobs;
