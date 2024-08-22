# INTRODUCTION 
📊 Jump into the UK data job market! With a focus on data analyst roles within the United Kingdom, this project investigates the top paying jobs 💰, in demand skills 📈, and where high salary meets high demand in data analytics. 

SQL queries used -> [uk_data_analyst_jobs_project_sql](/uk_data_analyst_jobs_project_sql/)
# BACKGROUND
This project originated from my curiosity about the data analyst job market in countries outside of the United States. As a dual citizen of both the United States and the United Kingdom, I was particularly interested in exploring the UK market.

Data comes from [LINK TO CSV FILES](https://drive.google.com/drive/folders/1moeWYoUtUklJO6NJdWo9OV8zWjRn0rjN). The data comprises of around 1 million data related 2023 job postings from around the world, and were collected from various job posting sites (Glassdoor, LinkedIn, etc.)

### **Questions I aimed to explore:**
- What are the highest-paying data analyst jobs?
- Which skills are essential for these top-paying roles?
- What skills are most in demand for data analysts?
- Which skills correlate with higher salaries?
- What are the most optimal skills to learn?
# TOOLS I USED
For my exploration of my datasets, I taught myself and harnessed the power of several important tools:

- **SQL**: Served as the foundation of my analysis, enabling me to query the database and uncover key insights.
- **PostgreSQL**: The selected database management system, well-suited for managing the job posting data.
- **Visual Studio Code**: The tool I used for database management and executing SQL queries.
- **Git & GitHub**: Crucial for version control and sharing SQL scripts and analysis, enabling collaboration and project tracking.
# THE ANALYSIS
Each query for this project was designed to explore each of the questions in the background section.
Heres how I handled each question:

### 1. Highest Paying Data Analyst Jobs
In order to identify the top paying jobs, I filtered data and business analyst positions by average yearly salary and location. I designed the query to only look at job postings where the location ended in "UK" or "United Kingdom".

This query highlights the highest paying jobs in the UK data analyst job market:
```SQL
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
    20;

```
Breakdown of highest earning data analyst positions in 2023:

- Larger cities like London and Manchester, where tech companies are more prevalent, offer a significant majority of the higher-paying jobs.
- The top 20 job listings show salaries ranging from $100,500 to $177,283, which is actually a narrower range than I would have expected.
- A significant majority of the higher-paying positions are in the AI and cybersecurity sectors, with companies like DeepMind and Darktrace leading the list. However, other less tech-focused companies, such as Ocorian, a capital markets firm, and Experian, are also offering top dollar for their data-related roles.

![Average Salary by City](1_Location_Top_Paying_Job.png)
Bar graph visualing the average salary for the top paying data analyst positions in the UK by city
Bar graph illustrating the average salary for the highest-paying data analyst positions in the UK, broken down by city;
**Graph was created using Tableau**
### 2. Skills Required for Highst Paying Jobs
I combined the job postings data with the skills data, which provided insights into the skills that employers prioritize for high-paying positions.
```SQL
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
```
Breakdown of Most In-Demand Skills for the Top 10 Highest-Paying Jobs:
- **SQL** tops the list, with a count of 6
- **Python** follows closely with a count of 5
- **Excel** ranks third with a count of 3
![Top_Paying_Jobs_With_Skills](<Query 2 Visual.png>)
Bar graph visualing the count of skills for the top paying data analyst positions;
**Graph was created using Tableau**
### 3. In Demand Skills for Data Analysts 
This query highlighted the skills most commonly sought in UK job postings, guiding attention to high-demand areas.
```SQL
SELECT 
skills,
COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
        (job_location LIKE '%, UK%' OR job_location LIKE '%, United Kingdom%')
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
Breakdown of most in demand skills:
- **Excel** and **SQL** lead the list, underscoring their essential role in the data analytics field.
- **Tableau** and **Power BI** rank among the top 5 most demanded skills, highlighting the growing importance of data storytelling.

| Skills   | Demand |
|----------|--------------|
| sql      | 3389         |
| excel    | 3318         |
| power bi | 2221         |
| python   | 1523         |
| tableau  | 1168         |

# WHAT I LEARNED

# CONCLUSIONS
