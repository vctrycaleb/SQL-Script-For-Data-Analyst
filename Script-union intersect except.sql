-- artist mengandung nama john
-- tracknya mangandung hop

SELECT Name, "Artist" as entity 
FROM Artist a
WHERE Name LIKE "%john%"
UNION 
SELECT Name, "Track" as entity 
FROM Track t 
WHERE Name LIKE "%hop%"

--menggunakan union/intersect/except = nama kolom harus sama

--tampilkan nama depan customer yang bukan nama depan employee
--hint : gunakan except

SELECT FirstName 
FROM Customer c
EXCEPT
SELECT FirstName 
FROM Employee e 

--tampilkan namadepan customer yg sama dengan nama depan employee
--hint : gunakan intersect
SELECT FirstName 
FROM Customer c
INTERSECT
SELECT FirstName 
FROM Employee e 
