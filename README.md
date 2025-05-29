# Analyzing Chinook Database- SQL Project

**How can a digital media store grow its revenue from existing and potential customers?**

This project analyzes the sales data of a digital media/music store Chinook.

## Overview

The objective of the project is to uncover insightful trends that can be used by the business to make future decisions. The questions aimed to answer were

- Who are the top spending customers and what are the customer spending behaviors (frequency, repeat orders)?
- What are the monthly or yearly revenue trends?
- Are cheaper tracks selling more? (Price sensitivity)
- How is the revenue different across various countries?
- Which artists/albums/genres sold the most media?

## Key Insights

- The top-spending customers had only *7 orders*, totaling *$49.62*.
- The most frequent purchasing customer had an average gap of a whopping *207 days* between their orders.
- *USA* was the top country in terms of total sales, followed by Canada, France, Brazil, and Germany.
- Cheaper tracks sold more, 57% of the total tracks priced at $0.99 had at least one sale.
- The album *Battlestar Galactica (Classic), Season 1* containing video files generated the most amount of revenue. 

## Process

### Data

The data for the Chinook store can be found at the official [GitHub page](https://github.com/lerocha/chinook-database/blob/master/ChinookDatabase/DataSources/Chinook_Sqlite.sql) of the Chinook database. The script to replicate the data in this project can be found [here](./create_Chinook_db.sql). 

The database includes several tables with information on *Invoices, Customers, and Tracks*.

![img](https://private-user-images.githubusercontent.com/147944185/448598127-61f09142-66eb-4283-a37e-18422d6a4f54.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0ODg2MjgsIm5iZiI6MTc0ODQ4ODMyOCwicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NTk4MTI3LTYxZjA5MTQyLTY2ZWItNDI4My1hMzdlLTE4NDIyZDZhNGY1NC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI5JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOVQwMzEyMDhaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT05MTgyNTQ5OGI1MmJjNWU3ZmNhZmY2NjI3NTYzNzAzOTkxZGZjMzEzZGQ1MmQ4ZjQzZTQzOTcxYjgyM2E2OTViJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.gABUYC5ypnAEKMrsMCH7pw91eaZ8gEfVg2IyNhpaJ6w)

### Tools

- SQL, for querying and analyzing data.
- DBeaver, for the ER diagram

### Analysis

The project analyzes the top-spending customers first and identifies other interesting customer behaviors.


- Finding the top 10 customers by Total Sales Amount.

[SQL Query](https://github.com/sbatth/chinook_sql_project/blob/main/customer_analysis.sql#L2-L17) to pull the Top 10 spending customers and the number of invoices (transactions).

![img](https://private-user-images.githubusercontent.com/147944185/448600853-b57b455d-03c3-4175-8288-09f46c513e98.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0NjkwOTksIm5iZiI6MTc0ODQ2ODc5OSwicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODUzLWI1N2I0NTVkLTAzYzMtNDE3NS04Mjg4LTA5ZjQ2YzUxM2U5OC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTQ2MzlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT04MTQ5MWQ1NTVkN2RiOTBkOGM0YWUxMjU2OTQ3MzI2OTAxM2M4MWVkNjg3YmEwZGJhYmQ1ZDk0MjNjMWRiZWIyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.KvJmN1bQrZW7ThilHvSds3VuuKT-FS5toajDiDuHA_E)

*Even the customer generating the most amount of revenue only had 7 total invoices and $49.62 in lifetime spend*. This indicates that the CLV (Customer Lifetime Value) for the business is low.


- Finding the frequency of customer purchases

The output of the [SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/customer_analysis.sql#L44-L74)

![img](https://private-user-images.githubusercontent.com/147944185/448600860-40a7a203-0f4f-49bf-9cea-86c1129468ca.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0NjkwOTksIm5iZiI6MTc0ODQ2ODc5OSwicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODYwLTQwYTdhMjAzLTBmNGYtNDliZi05Y2VhLTg2YzExMjk0NjhjYS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTQ2MzlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0xNjAzNTA5MWMzYTEwMDlkYjE1NWNkYWQyYjI4NWE2YzRmMjYxMGNkZDRiM2IzNmIxZmZiZDgyODhjNWYwYzNlJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.5AzMb1WdTCEO4qmlUUHvQX5kASAok8kfIviH5t4BuEw)

*Even the most frequent customers had an average gap of 207 days between their orders*. This can indicate that the business is failing to engage the customers frequently.


- Finding repeat customers

The output of the [SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/customer_analysis.sql#L78-L103)

![img](https://private-user-images.githubusercontent.com/147944185/448600859-a6b0b1b1-45b6-484c-aa2c-d0ba207ae163.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0NjkwOTksIm5iZiI6MTc0ODQ2ODc5OSwicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODU5LWE2YjBiMWIxLTQ1YjYtNDg0Yy1hYTJjLWQwYmEyMDdhZTE2My5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTQ2MzlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT03MmNjYzgwMmEyOTlhMzFhNWNhNjI3YmFhMzJlNGMwZDUwOTU3YmYyOTI0NmU3MDZhYWE2OGNmMTRlNzFlOGJkJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.Iy_khj0Jrv0CuAOn6cVGCuj41DxEYNtnne3FB-QlJbs)

*100% of the customers of the store were repeat customers*. This indicates that the customer retention is high and there is low risk of churn. On the other hand, the acquisition of new customers is slow.


After the customer analysis, the data was analyzed for revenue trends.


- Identifying seasonal and yearly revenue trends

The output of the [SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/revenue_trends.sql#L1-L22)

![img](https://private-user-images.githubusercontent.com/147944185/448600861-b7c790c4-f5fb-413e-a676-4e62f8e80a28.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0Njk0NDYsIm5iZiI6MTc0ODQ2OTE0NiwicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODYxLWI3Yzc5MGM0LWY1ZmItNDEzZS1hNjc2LTRlNjJmOGU4MGEyOC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTUyMjZaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT04NDk0YWI5NDNjZjQzODE2YmE4MTkzNDY4YTViZjc1NTYwZDBmNTMyMjNmOTQ1ODA3YzYzYmNmMThiOGU1YzEyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.AiOeHxwmw4ygWDofuNJFJc0124Jw_swNpDcQB4Kw3bA)

![img](https://private-user-images.githubusercontent.com/147944185/448600852-678c86d1-73c3-4b5f-bf81-7718f0c9fd9e.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0Njk0NDYsIm5iZiI6MTc0ODQ2OTE0NiwicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODUyLTY3OGM4NmQxLTczYzMtNGI1Zi1iZjgxLTc3MThmMGM5ZmQ5ZS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTUyMjZaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1lYWIyYzYzZDA0ZmZjNWVjMGU0NThjODZlZGI4ODZmYTg4ZGM1ZDRmM2NiZDczNzhiOGNlMDk3NGM0YWFjYWUyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.uyYGFnSQ39vFdI9VjXR45FPO9wJFJXEa1qdClkm3rvg)

*There were no significant trends seen in the monthly and yearly revenue analysis*. This is indicative of lack of capitalization on seasonal demands.


- Finding which countries are responsible for the most sales

The output of the [SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/revenue_trends.sql#L25-L41) to find countries with more than 25 invoices

![img](https://private-user-images.githubusercontent.com/147944185/448600855-178441d6-27aa-4fb2-a5fc-5fca22a5459b.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0Njk0NDYsIm5iZiI6MTc0ODQ2OTE0NiwicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODU1LTE3ODQ0MWQ2LTI3YWEtNGZiMi1hNWZjLTVmY2EyMmE1NDU5Yi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTUyMjZaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jZGY3NjJkMGMxOTNhOWQ3ZGU1YmU2NmQ5ZDZjMzk0ZmY3Njg5Yzg5YTU2ZmYxODU4YjM5Yjg3OGY0Y2VkODFhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.YoZ1m-1atWr2KG3te3FjOCwFfI75NRELoxJxdikcRYY)

*The top 5 countries by total revenue were USA, Canada, France, Brazil, and Germany.*


- Finding the average order value (AOV) by country

The output of the [SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/revenue_trends.sql#L44-L61) to pull the AOV for each country and filtering countries with above average AOVs

![img](https://private-user-images.githubusercontent.com/147944185/448600854-36081a0e-a897-484b-9685-88acf7ada4b6.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0Njk0NDYsIm5iZiI6MTc0ODQ2OTE0NiwicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODU0LTM2MDgxYTBlLWE4OTctNDg0Yi05Njg1LTg4YWNmN2FkYTRiNi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTUyMjZaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT00Zjc3MGYwOTY2ZmYzMTMwN2M2YmIxY2U0OWM1ODA4ZGY0YWUzNjcxMmU2ZGEzYTUyMDAyZTQ2ZjIyMGM0MzhlJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.Jjxof8KIe3MAuh9xaWYmAdNijgO-PoHXTwnYrHWgmMc)

*Despite not being in the Top 5 by total revenue, Chile, Ireland, and Hungary had the highest AOV.*


- Analyzing if cheaper tracks sell more

The output of the [SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/revenue_trends.sql#L64-L98)

![img](https://private-user-images.githubusercontent.com/147944185/448600856-add4bb95-5161-4c73-8801-42f99d330ff6.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0Njk4MTMsIm5iZiI6MTc0ODQ2OTUxMywicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODU2LWFkZDRiYjk1LTUxNjEtNGM3My04ODAxLTQyZjk5ZDMzMGZmNi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTU4MzNaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0yZTQzYmYwYTQ2NjE0N2IwZGRiZmVkNjk4ZGQ2OGM5MmI3OTFjNDcyNGVkMWFhMDBiYjBhYzk4MDk0Y2JhMGFiJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.VnXO3kmvkQ8Av4gAScHn3HTrOT4Hv2N2vzGnhqIF4Io)

*Of all the tracks at $0.99, 57% had at least one sale whereas of all the tracks priced at $1.99, only 48% had at least one sale*. Out of the two price categories, the tracks that were cheaper sold more. There is a price sensitivity component to sales.


- Which genres have the most tracks?

The output of the [SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/other_trends.sql#L58-L93)

![img](https://private-user-images.githubusercontent.com/147944185/448600862-0fa83e73-8da6-4f24-9b0b-4ed5fbe8b282.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0Njk4MTMsIm5iZiI6MTc0ODQ2OTUxMywicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODYyLTBmYTgzZTczLThkYTYtNGYyNC05YjBiLTRlZDVmYmU4YjI4Mi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTU4MzNaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01YzkzOTFkNmRhNDgxZTBlMWU4YTM0ZGQ2ZGZmNTEzNDg0YzNiMjI0MWQ5NzRlODEwYzFiZTQ2MzRjNWQzYzBjJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.b1TXGbwGdnnqi1YEY6twTGuqHIrnCgsLLoE225bGV3s)

*The genre Rock has the most number of total tracks and the most number of sold tracks.*


- Which albums have the highest revenue?

The output of the [SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/other_trends.sql#L96-L113)

![img](https://private-user-images.githubusercontent.com/147944185/448600858-ceb328b7-73fd-4b5d-9801-a62a748473e8.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg0Njk4MTMsIm5iZiI6MTc0ODQ2OTUxMywicGF0aCI6Ii8xNDc5NDQxODUvNDQ4NjAwODU4LWNlYjMyOGI3LTczZmQtNGI1ZC05ODAxLWE2MmE3NDg0NzNlOC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNTI4JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDUyOFQyMTU4MzNaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT03ODIyYmEwZDI0Zjg4YTE2NzcxZjMzODBjMTE5MTI5Mjg5NjIwNWI3ZDNiNjhjYzYwZDUzNzFkMTIyODUzZTNlJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.gNXGwO4HWdf0LLWPSPnisS4zHDrDFNye3fTdH9r9Hqo)

*Battlestar Galactica (Classic), Season 1 generated the most revenue and included video files instead of the more prevalent audio files in the store.*


## Recommendations

Based on the insights discovered during the analysis, there are several recommendations that can be beneficial for the Chinook store

- **Monthly Updates**: As the average gap between two orders is very high even for the frequent customers, the store can *send monthly updates on new releases and trending tracks*. This will engage the customers more and result in frequent sales. This will also increase the revenue and number of orders per customer.
- **Targeted Ads**: All the customers of the store are repeat customers, the store can *launch targeted ads* based on similar demographics to acquire new customers.
- **Seasonal Sales**: The store will also benefit from introducing *seasonal sales such as New Year's, Summer, Black Friday*. This will ensure that the store capitalizes on the better months of the retail business.
- **Geographic Expansion**: The business can *expand in countries like Chile, Ireland, and Hungary* as these countries have higher average order values.
- **Bundle Discounts**: As cheaper tracks sell more, the business can offer *discounts on more expensive tracks when bought in higher quantity*.
- **Inventory Optimization**: As 4 out of the top 5 revenue generating albums are actually video files, the business can *include more video files in its inventory* to boost sales.


## Conclusion

The insights discovered in the analysis can help the business identify its pain points. Chinook store can benefit from implementing the above recommendations to overcome these challenges and improve sales, customer acquisition, and inventory. 
