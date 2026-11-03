# 🎨 Famous Paintings & Museums — SQL Case Study

## 📌 Project Overview

This project is an SQL-based case study using the **Famous Paintings & Museums** dataset. The objective was to explore relationships between artists, paintings, museums, canvas sizes, subjects, product pricing, and museum operating hours.

Using MySQL, I explored the dataset, solved analytical questions, investigated data-quality issues, and practised writing SQL queries to extract meaningful insights.

## 🎯 Project Objectives

- Explore the structure and contents of the dataset.
- Identify paintings that are not assigned to any museum.
- Analyse painting prices and canvas sizes.
- Explore popular painting subjects, styles, artists, and museums.
- Examine museum locations and operating hours.
- Identify missing and potentially invalid data.
- Strengthen SQL problem-solving and analytical skills.

## 🛠️ Tools & Technologies

- **MySQL:** Database management and SQL queries.
- **SQL:** Data exploration, analysis, filtering, and aggregation.

## 📂 Dataset Structure

The dataset consists of eight relational tables:

| Table Name | Description |
|---|---|
| `artist` | Contains information about artists. |
| `canvas_size` | Contains canvas dimensions and size labels. |
| `image_link` | Stores painting image-link information. |
| `museum` | Contains museum details and locations. |
| `museum_hours` | Stores museum opening and closing hours. |
| `product_size` | Contains painting sizes and pricing information. |
| `subject` | Contains subjects associated with paintings. |
| `work` | Contains painting details and related artist/museum information. |

## 📊 SQL Concepts Practised

During this case study, I worked with the following SQL concepts:

- SELECT, WHERE, ORDER BY and LIMIT
- INNER JOIN and LEFT JOIN
- GROUP BY and HAVING
- Aggregate Functions (COUNT)
- Subqueries
- Filtering and Sorting
- REGEXP
- Data Cleaning and Duplicate Detection
- Date and Time Functions
- STR_TO_DATE()
- TIMEDIFF()
- TIME_TO_SEC()

## 🔍 Business Questions & Analysis

The case study contains 22 analytical questions designed to explore the dataset and practise SQL problem-solving.

### 1. Painting & Museum Analysis

1. Fetch all paintings that are not displayed in any museum.
2. Identify museums that do not have any paintings.
3. Identify museums with invalid city information.
4. Identify museums open on both Sunday and Monday.
5. Calculate how many museums are open every single day.
6. Identify the museum that remains open for the longest duration in a day.

### 2. Painting Price & Canvas Analysis

7. Calculate paintings whose asking price is higher than their regular price.
8. Identify paintings whose asking price is less than 50% of their regular price.
9. Find the canvas size associated with the highest painting price.
10. Identify the three least popular canvas sizes.

### 3. Artists, Subjects & Painting Styles

11. Find the top 10 most popular painting subjects.
12. Identify the top five most popular artists based on the number of paintings.
13. Find the museum containing the highest number of paintings belonging to the most popular painting style.
14. Identify the three most popular and three least popular painting styles.
15. Find artists whose paintings are displayed in multiple countries.
16. Identify the artist with the highest number of Portrait paintings displayed outside the USA.

### 4. Museum & Geographic Analysis

17. Identify the top five most popular museums based on the number of paintings.
18. Find the country and city with the highest number of museums.
19. Identify the artist and museum associated with the most expensive and least expensive paintings.
20. Find the country with the fifth-highest number of paintings.

### 5. Data Cleaning

21. Identify and remove duplicate records from the following tables:
    - work
    - product_size
    - subject
    - image_link

22. Identify the invalid entry in the museum_hours table and remove it.

## 📁 Repository Structure

```text
Famous-Paintings-Museum-SQL-Case-Study/
│
├── Questions.txt
├── solutions.sql
└── README.md
```

| File | Description |
|---|---|
| `Questions.txt` | Contains the analytical questions for the case study. |
| `solutions.sql` | Contains SQL queries and solutions attempted during the case study. |
| `README.md` | Project documentation. |

## 🚀 How to Run This Project

1. Install MySQL and open MySQL Workbench.
2. Download the Famous Paintings & Museums dataset.
3. Import all eight CSV files into your MySQL database.
4. Open the `solutions.sql` file.
5. Execute the database creation statements:

```sql
CREATE DATABASE case_study_questions;

USE case_study_questions;
```

6. Make sure all dataset tables are successfully imported.
7. Execute the SQL queries individually.
8. Review the outputs and analyse the results.

## 📚 Key Learning Outcomes

Through this project, I gained practical experience in:

- Working with multiple relational database tables.
- Writing complex SQL queries to solve analytical problems.
- Combining datasets using different types of joins.
- Analysing data using aggregate functions and subqueries.
- Identifying missing values, duplicates, and invalid records.
- Solving real-world business-style analytical questions.
- Improving logical thinking and SQL problem-solving abilities.

## 🏁 Conclusion

This case study provided an opportunity to apply my SQL knowledge to a real-world dataset. It helped me strengthen my understanding of relational databases, data analysis, and complex SQL queries while developing a more analytical approach to solving data-related problems.

---

**Project Type:** SQL Case Study  
**Database:** MySQL  
**Dataset:** Famous Paintings & Museums  
**Focus:** Data Exploration | SQL Analysis | Problem Solving
