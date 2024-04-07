-- ambil semua track dengan genre rock
SELECT * FROM Track t WHERE GenreId IN 
(SELECT GenreId 
FROM Genre g 
WHERE Name = 'Rock' 
)

--cari agent yg pernah melayani top 5 customer
--dengan total spending paling banyak

--pendekatan 1 sub query
SELECT SupportRepId, topspender.CustomerId 
FROM Customer c RIGHT JOIN
	(SELECT i.CustomerId , SUM(Total) as totalspending 
	FROM Invoice i 
	GROUP BY i.CustomerId 
	ORDER BY totalspending DESC 
	LIMIT 5) as topspender
ON 	c.CustomerId = topspender.CustomerId	

--pendekatan 2 CTE
WITH topspender as (SELECT i.CustomerId , SUM(Total) as totalspending 
	FROM Invoice i 
	GROUP BY i.CustomerId 
	ORDER BY totalspending DESC 
	LIMIT 5) , --gunakan koma untuk memisahakan CTE
-- CTE setelah yg pertama tidak pakai WITH
lowestspender as (SELECT i.CustomerId , SUM(Total) as totalspending 
	FROM Invoice i 
	GROUP BY i.CustomerId 
	ORDER BY totalspending
	LIMIT 5
) 
SELECT SupportRepId, topspender.CustomerId 
FROM Customer c RIGHT JOIN topspender 
ON 	c.CustomerId = topspender.CustomerId	