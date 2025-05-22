-- How has the revenue changed over the years

SELECT 
    strftime('%Y', InvoiceDate) AS yr,  -- function extracts year from the date
    COUNT(InvoiceId) AS TotalInvoices, 
    ROUND(SUM(Total), 2) AS TotalRevenue
FROM 
    Invoice i 
GROUP BY 
    yr;


-- Is there a seasonality component in the revenue

SELECT 
    strftime('%m', InvoiceDate) AS mth,  -- function extracts month from the date
    COUNT(InvoiceId) AS TotalInvoices, 
    ROUND(SUM(Total), 2) AS TotalRevenue
FROM 
    Invoice i 
GROUP BY 
    mth;


-- Which countries has the highest amount of invoices(countries with at least 25 invoices)

SELECT 
    c.Country, 
    ROUND(SUM(i.Total)) AS TotalSales, 
    COUNT(DISTINCT InvoiceId) AS TotalInvoices
FROM 
    Customer c,
    Invoice i 
WHERE 
    c.CustomerId = i.CustomerId 
GROUP BY 
    c.Country
HAVING 
    TotalInvoices > 25
ORDER BY 
    TotalInvoices DESC;


-- Avg revenue per invoice by region (get countries only where the avg invoice amount is greater than the avg invoice amount of all countries combined)

SELECT 
    BillingCountry, 
    ROUND(AVG(Total), 2) AS AvgInvoiceAmt
FROM 
    Invoice i
GROUP BY 
    BillingCountry 
HAVING 
    AvgInvoiceAmt > (
        SELECT 
            AVG(Total) 
        FROM 
            Invoice i
    )
ORDER BY 
    AvgInvoiceAmt DESC;


-- Do cheaper tracks sell more? (Calculate % of tracks sold in each unit price)

-- First CTE shows total number of tracks per unit price
WITH TotalTrks AS (
    SELECT 
        DISTINCT UnitPrice, 
        COUNT(TrackId) AS TotalTracks
    FROM 
        Track
    GROUP BY 
        UnitPrice 
),
-- Second CTE shows number of tracks sold per unit price
SoldTrks AS (
    SELECT 
        UnitPrice, 
        COUNT(TrackId) AS SoldTracks
    FROM (
        SELECT 
            DISTINCT t.TrackId, 
            t.UnitPrice
        FROM 
            Track t 
            INNER JOIN InvoiceLine il ON t.TrackId = il.TrackId
    )
    GROUP BY 
        UnitPrice
)
-- Final output: percentage of tracks sold by unit price
SELECT 
    st.UnitPrice, 
    ROUND((CAST(st.SoldTracks AS FLOAT) / tt.TotalTracks) * 100, 2) AS PctOfTotalTracksSold
FROM 
    TotalTrks tt 
    JOIN SoldTrks st ON tt.UnitPrice = st.UnitPrice;
