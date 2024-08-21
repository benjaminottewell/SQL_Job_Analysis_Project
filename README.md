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

![alt text](Location_Top_Paying_Job-1.png)
Bar graph visualing the average salary for the top paying data analyst positions in the UK by city
Bar graph illustrating the average salary for the highest-paying data analyst positions in the UK, broken down by city;
**Graph was created using Tableau**


# WHAT I LEARNED

# CONCLUSIONS
