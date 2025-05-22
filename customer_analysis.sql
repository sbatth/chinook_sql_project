
-- Top 10 customers that have spent the most money on purchases and the number of invoices (transactions)
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS Name,
    c.Country,
    COUNT(DISTINCT i.InvoiceId) AS TotalInvoices,
    ROUND(SUM(i.Total), 2) AS TotalAmount
FROM 
    Invoice i
LEFT JOIN 
    Customer c ON i.CustomerId = c.CustomerId
GROUP BY 
    i.CustomerId
ORDER BY 
    TotalAmount DESC
LIMIT 10;


-- Get the earliest date of a customer's purchase to identify most loyal customers

SELECT 
	c.CustomerId,
    c.FirstName || ' ' || c.LastName AS Name,
    InvoiceDate 
FROM (
    SELECT 
        CustomerId, 
        InvoiceDate,
        -- gets the earliest order date
        ROW_NUMBER() OVER (PARTITION BY CustomerId ORDER BY InvoiceDate) AS rn 
    FROM 
        Invoice i
) e,
Customer c 
WHERE 
    rn = 1 
    AND e.CustomerId = c.CustomerId
ORDER BY 
    InvoiceDate ASC;



-- Get the avg days between orders of each customer and find the customers that buy most frequently 

SELECT 
    a.CustomerId,
    FirstName || ' ' || LastName AS Name,
    CAST(AVG(DaysDiff) AS INT) AS AvgDaysDiff
FROM (
    -- this subquery will get days between two orders for each customer
    SELECT 
        CustomerId, 
            -- julianday function is used in SQLite to get difference between two dates
        JULIANDAY(InvoiceDate) - JULIANDAY(PrevDate) AS DaysDiff
    FROM (
        SELECT 
            CustomerId,
            InvoiceDate,
            -- window function attaches the previous order date to each record
            LAG(InvoiceDate) OVER (PARTITION BY CustomerId ORDER BY InvoiceDate ASC) AS PrevDate
        FROM 
            Invoice i
    )
    WHERE 
        DaysDiff IS NOT NULL
) a,
Customer c 
WHERE 
    a.CustomerId = c.CustomerId
GROUP BY 
    a.CustomerId 
ORDER BY 
    AvgDaysDiff ASC;



-- Differentiate the repeat vs one-time customers

WITH tmp AS (
    SELECT 
        CASE 
            WHEN TotalInvoices = 1 THEN 'One-time'
            ELSE 'Repeat'
        END AS CustType,
        CustomerId
    FROM (
        SELECT 
            CustomerId,
            COUNT(InvoiceId) AS TotalInvoices
        FROM 
            Invoice i
        GROUP BY 
            i.CustomerId
    )
)
SELECT 
    CustType, 
    COUNT(CustType) AS NumCust
FROM 
    tmp
ORDER BY 
    CustType ASC;
