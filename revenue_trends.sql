--How has the revenue changed over the years

SELECT strftime('%Y', InvoiceDate) as yr, --function extracts year from the date
count(InvoiceId) as TotalInvoices, round(sum(Total),2) as TotalPaid
from Invoice i 
group by yr;

--Is there a seasonality componenet in the revenue

SELECT strftime('%m', InvoiceDate) as mth, --function extracts month from the date
count(InvoiceId) as TotalInvoices, round(sum(Total),2) as TotalPaid
from Invoice i 
group by mth;

--What geography should this business expand in based on the number of invoices (countries with atleast 25 invoices)

select c.Country, round(sum(i.Total)) as TotalSales, count(distinct InvoiceId) as TotalInvoices
from Customer c, Invoice i 
where c.CustomerId = i.CustomerId 
group by c.Country
having TotalInvoices > 25
order by TotalInvoices desc;


--Avg revenue per invoice by region (get countries only where the avg invoice amount is greater than the avg invoice amount of all countries combined)

select BillingCountry, round(avg(Total), 2) as AvgInvoiceAmt
from Invoice i
group by BillingCountry 
having AvgInvoiceAmt > (
					select  avg(Total) 
					from Invoice i
					)
order by AvgInvoiceAmt desc;

--Do cheaper tracks sell more? (Calculate % of tracks sold in each unit price)

--first cte shows number of tracks per unit price
with TotalTrks as (
					select distinct UnitPrice, count(TrackId) as TotalTracks
					from track
					group by UnitPrice 
					),
--second cte shows number of tracks sold per unit price
SoldTrks as (
			select UnitPrice, count(TrackId) as SoldTracks
			from (
					select distinct t.TrackId, t.UnitPrice
					from track t inner join InvoiceLine il 
					on t.TrackId = il.TrackId
					)
			group by UnitPrice
			)
select st.UnitPrice, 
round((cast(st.SoldTracks as Float)/tt.TotalTracks)*100, 2) as PctOfTotalTracksSold
from TotalTrks tt join SoldTrks st on
tt.UnitPrice=st.UnitPrice;
