-- Get all the tracks where Jimmy Page is a composer
SELECT 
    Name,
    Composer
FROM 
    Track t 
WHERE 
    Composer LIKE '%Jimmy Page%';


-- Top 5 artists that have the most units of songs sold and the amount sold for
SELECT 
    at.ArtistId,
    at.Name,
    SUM(us.UnitsSold) AS UnitsSold,
    ROUND(SUM(us.AmtSold), 2) AS Revenue
FROM (
    SELECT 
        TrackId,
        COUNT(DISTINCT InvoiceLineId) AS UnitsSold,
        SUM(UnitPrice) AS AmtSold
    FROM 
        InvoiceLine il 
    GROUP BY 
        TrackId
) us
JOIN 
    Track t ON us.TrackId = t.TrackId
JOIN 
    Album a ON t.AlbumId = a.AlbumId
JOIN 
    Artist at ON a.ArtistId = at.ArtistId
GROUP BY 
    at.Name
ORDER BY 
    UnitsSold DESC
LIMIT 5;


-- Do they sell the most because they have the most songs?
SELECT 
    at.ArtistId,
    at.Name,
    COUNT(t.TrackId) AS TotalTracks
FROM 
    Track t
JOIN 
    Album a ON t.AlbumId = a.AlbumId
JOIN 
    Artist at ON a.ArtistId = at.ArtistId
GROUP BY 
    at.ArtistId
ORDER BY 
    TotalTracks DESC
LIMIT 5;


-- Which genre has the most tracks and sold the most tracks
WITH tmp AS (
    SELECT 
        g.Name, 
        COUNT(t.TrackId) AS NumTracks
    FROM 
        Track t 
    LEFT JOIN 
        Genre g ON g.GenreId = t.GenreId
    GROUP BY 
        g.Name
),
tmp2 AS (
    SELECT 
        g.Name, 
        COUNT(t.TrackId) AS SoldTracks
    FROM 
        InvoiceLine il
    JOIN 
        Track t ON il.TrackId = t.TrackId
    JOIN 
        Genre g ON g.GenreId = t.GenreId
    GROUP BY 
        g.Name
)
SELECT 
    tmp.Name, 
    NumTracks, 
    SoldTracks  
FROM 
    tmp 
JOIN 
    tmp2 ON tmp.Name = tmp2.Name
ORDER BY 
    SoldTracks DESC
LIMIT 1;


-- Which albums are selling the most
SELECT 
    a.Title,
    ROUND(SUM(il.UnitPrice), 2) AS Revenue,
    mt.Name AS MediaType
FROM 
    InvoiceLine il
JOIN 
    Track t ON il.TrackId = t.TrackId
JOIN 
    Album a ON t.AlbumId = a.AlbumId
JOIN 
    MediaType mt ON t.MediaTypeId = mt.MediaTypeId
GROUP BY 
    t.AlbumId 
ORDER BY 
    Revenue DESC
LIMIT 5;
