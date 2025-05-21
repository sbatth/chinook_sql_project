--Find the top 10 customers that have spent the most money on purchases and the number of invoices (transactions)

select c.FirstName || " " ||c.LastName as Name , c.Country ,count(distinct InvoiceId) as TotalInvoices, 
round(sum(Total),2) as TotalSales
from Invoice i LEFT JOIN Customer c
on i.CustomerId = c.CustomerId
group by i.CustomerId
order by sum(Total) desc
limit 10;

--Get the earliest date of a customer's purchase to identify most loyal customers

select c.FirstName || " " || c.LastName as Name, InvoiceDate 
from
	(
	select CustomerId, InvoiceDate, 	
	--gets the earliest order date
	row_number() over(partition by CustomerId order by InvoiceDate) as rn 
	from Invoice i
	) e, Customer c 
where rn=1 and e.CustomerId = c.CustomerId
order by InvoiceDate asc;

--Get the avg lag days between orders of each cutomer and find the customers that buys most frequently 
select a.CustomerId, FirstName || ' ' || LastName as Name,round(avg(DaysDiff), 2) as AvgDaysDiff
from (
		--julianday function is used in SQLite to get difference between two dates
		--this subquery will get days between two orders for each customer
		select CustomerId, julianday(InvoiceDate) - julianday(PrevDate) as DaysDiff
		from 
			(
			select CustomerId , InvoiceDate ,
			--window function attaches the previous order date to each record
			lag(InvoiceDate) over (partition by CustomerId order by InvoiceDate asc) as PrevDate
			from Invoice i
			)
		where DaysDiff is not null
		) a, Customer c 
where a.CustomerId = c.CustomerId
group by a.CustomerId 
order by AvgDaysDiff asc;

--Differentiate the repeat vs one-time customers

with tmp as (
    select case when TotalInvoices = 1 then "One-time" else "Repeat" end as CustType, CustomerId
    from (
        select CustomerId , count(InvoiceId) as TotalInvoices
        from Invoice i
        group by i.CustomerId
        )
    )
select CustType, count(CustType) as NumCust
from tmp
order by CustType asc;