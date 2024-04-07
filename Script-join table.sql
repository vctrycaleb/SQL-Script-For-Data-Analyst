--gabung 2 tabel
SELECT *
FROM Album alb INNER JOIN Artist art
	ON alb.ArtistId = art.ArtistId 
WHERE art.Name = 'Aerosmith' 

-- gabungin 3 tabel
SELECT *
FROM Track t 
	LEFT JOIN Album as alb ON t.AlbumId = alb.AlbumId
	LEFT JOIN Artist ar ON ar.ArtistId = alb.ArtistId 
	
--buatlah query yg menunjukkan invoiceID + sales agent(employee)
--terurut berdasarkan nama agent(employee)

SELECT inv.InvoiceId , cus.FirstName , emp.FirstName
FROM Invoice as inv
	LEFT JOIN Customer as cus ON inv.CustomerId = cus.CustomerId 
	LEFT JOIN Employee as emp ON cus.SupportRepId  = emp.EmployeeId 
ORDER BY emp.FirstName  

	