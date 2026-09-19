/*
 Question: What are the most in-demand skills for Data Analysts?
 -- Identify the top 5 in-demand skills for Data Analyst.
 -- Focus on all job postings.
 -- Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
 */
Select skills,
    count(skills_job_dim.job_id) as demand_count
From job_postings_fact
    Inner JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    Inner JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
Where job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
Group by skills
Order by demand_count DESC
limit 5