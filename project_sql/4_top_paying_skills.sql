/*
 Answer: What are top skills based on salary?
 -- Look at the average salary associated with each skill for Data Analyst positions.
 -- Focuses on roles with specified salaries, regardless of location
 -- Why? It reveals how different skills impact salary potential levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.
 */
Select skills,
    round(avg(salary_year_avg), 0) as average_salary
From job_postings_fact
    Inner JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    Inner JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
Where job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
Group by skills
Order by average_salary DESC
limit 10
    /*
     Here's a breakdown of the results for top paying skills for Data Analysts:
     - High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
     - Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
     - Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.
     */