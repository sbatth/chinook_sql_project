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

![img](https://github.com/sbatth/images/blob/main/sql/ERD.png)

### Tools

- SQL, for querying and analyzing data.
- DBeaver, for the ER diagram

### Analysis

The project analyzes the top-spending customers first and identifies other interesting customer behaviors.


- Finding the top 10 customers by Total Sales Amount.

[SQL Query](https://github.com/sbatth/chinook_sql_project/blob/main/customer_analysis.sql#L2-L17)


Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20150425.png)

*Even the customer generating the most amount of revenue only had 7 total invoices and $49.62 in lifetime spend*. This indicates that the CLV (Customer Lifetime Value) for the business is low.


- Finding the frequency of customer purchases

[SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/customer_analysis.sql#L44-L74)

Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20152340.png)

*Even the most frequent customers had an average gap of 207 days between their orders*. This can indicate that the business is failing to engage the customers frequently.


- Finding repeat customers

[SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/customer_analysis.sql#L78-L103)

Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20152703.png)

*100% of the customers of the store were repeat customers*. This indicates that the customer retention is high and there is low risk of churn. On the other hand, the acquisition of new customers is slow.


After the customer analysis, the data was analyzed for revenue trends.


- Identifying seasonal and yearly revenue trends

[SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/revenue_trends.sql#L1-L22) 

Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20153817.png)

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20153833.png)

*There were no significant trends seen in the monthly and yearly revenue analysis*. This is indicative of lack of capitalization on seasonal demands.


- Finding which countries are responsible for the most sales

[SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/revenue_trends.sql#L25-L41) to pull countries with more than 25 orders 

Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20154617.png)

*The top 5 countries by total revenue were USA, Canada, France, Brazil, and Germany.*


- Finding the average order value (AOV) by country

[SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/revenue_trends.sql#L44-L61) to pull the AOV for each country and filtering countries with above average AOVs

Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20161620.png)

*Despite not being in the Top 5 by total revenue, Chile, Ireland, and Hungary had the highest AOV.*


- Analyzing if cheaper tracks sell more

[SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/revenue_trends.sql#L64-L98) 

Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20155159.png)

*Of all the tracks at $0.99, 57% had at least one sale whereas of all the tracks priced at $1.99, only 48% had at least one sale*. Out of the two price categories, the tracks that were cheaper sold more. There is a price sensitivity component to sales.


- Which genres have the most tracks?

[SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/other_trends.sql#L58-L93) 

Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20162325.png)

*The genre Rock has the most number of total tracks and the most number of sold tracks.*


- Which albums have the highest revenue?

[SQL query](https://github.com/sbatth/chinook_sql_project/blob/main/other_trends.sql#L96-L113)

Result:

![img](https://github.com/sbatth/images/blob/main/sql/Screenshot%202025-05-22%20162608.png)

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
