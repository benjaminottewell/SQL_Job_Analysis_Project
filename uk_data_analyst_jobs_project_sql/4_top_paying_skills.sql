SELECT
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_postings_fact.job_title_short = 'Data Analyst' OR job_postings_fact.job_title_short = 'Business Analyst') AND
    (job_postings_fact.job_location LIKE '%, UK%' OR job_postings_fact.job_location LIKE '%, United Kingdom%') AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.skill_id) >= 5
ORDER BY
    avg_salary DESC;
