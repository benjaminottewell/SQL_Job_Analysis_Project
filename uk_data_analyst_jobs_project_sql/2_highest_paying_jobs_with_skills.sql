WITH top_paying_jobs_uk AS (
    SELECT
        job_id,
        job_title,
        job_title_short,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
        (job_location LIKE '%, UK%' OR job_location LIKE '%, United Kingdom%') AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 
        10
)
SELECT 
    top_paying_jobs_uk.*,
    skills
FROM top_paying_jobs_uk
INNER JOIN skills_job_dim ON top_paying_jobs_uk.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;