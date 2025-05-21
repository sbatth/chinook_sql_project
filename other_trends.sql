--Get all the tracks where Jimmy Page is a composer

select Name
from Track t 
where Composer like '%Jimmy Page%';


--Top 5 artists that has the most units of songs sold and the amount sold for

select at.ArtistId, at.Name, sum(UnitsSold) UnitsSold, round(sum(AmtSold), 2) Revenue
from (
	select TrackId, count(distinct InvoiceLineId) as UnitsSold, sum(UnitPrice) as AmtSold
	from InvoiceLine il 
	group by TrackId
	) us, Album a, Track t, Artist at
where us.TrackId = t.TrackId and t.AlbumId = a.AlbumId
and a.ArtistId = at.ArtistId
group by at.Name
order by sum(UnitsSold) desc
limit 5;

--Do they sell the most beacuse they have the most songs?

select at.ArtistId ,at.Name, count(TrackId) TotalTracks
from Track t, Album a, Artist at 
where t.AlbumId = a.AlbumId
and a.ArtistId = at.ArtistId
group by at.ArtistId 
order by TotalTracks desc
limit 5;

--Which genre has the most tracks and sold the most tracks

with tmp as ( 
			select g.Name, count(t.TrackId) as NumTracks
			from Track t left join Genre g 
			on g.GenreId = t.GenreId
			group by g.Name
			),
tmp2 as (
		select g.name, count(t.TrackId) as SoldTracks
		from InvoiceLine il, Track t, Genre g 
		where il.TrackId = t.TrackId and g.GenreId = t.GenreId
		group by g.Name
		)
select tmp.name, NumTracks, SoldTracks  
from tmp, tmp2
where tmp.Name = tmp2.Name
order by SoldTracks desc
limit 1;

--which albums are selling the most

select a.Title, round(sum(il.UnitPrice), 2) Revenue, mt.Name as Mediatype
from InvoiceLine il, Track t , Album a, MediaType mt  
where t.TrackId = il.TrackId and a.AlbumId = t.AlbumId
and mt.MediaTypeId = t.MediaTypeId
group by t.AlbumId 
order by Revenue desc;