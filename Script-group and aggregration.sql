-- function
SELECT MAX(UnitPrice)
FROM Track t 

-- Aggregation
-- Berapa rata2 harga track yg dijual perkomposer
SELECT Composer , AVG(UnitPrice) as HargaRataan
FROM Track t 
GROUP BY Composer 
ORDER BY HargaRataan

--case when
SELECT CustomerId , Country , 
	CASE Country 
	WHEN 'USA' THEN 'Domestic'
		ELSE 'Foreign'
	END as CustomerGroup
FROM Customer c

--buat query menunjukan banyaknya invoice berdasarkan BillingCountry
SELECT BillingCountry , COUNT(InvoiceId) 
FROM Invoice i 
GROUP BY BillingCountry 