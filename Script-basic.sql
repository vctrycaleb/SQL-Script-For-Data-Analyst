--1 basic selection
SELECT email, phone
FROM customer c

--2 menggunakan filter
SELECT FirstName , LastName , Email 
FROM Customer c 
WHERE Country = 'Brazil'
		--mengambil semua selain brazil != 'Brazil'

--3 mengurutkan data
SELECT FirstName , BirthDate 
FROM Employee e 
ORDER BY FirstName DESC --Dari besar ke kecil

--4 limit
SELECT * --semua kolom yg ada di tabel employee
FROM Employee e 
LIMIT 2 -- 2 kolom teratas

--5 menggunakan alias
SELECT FirstName as NamaDepan
FROM Employee e 

--6 challenge
-- buat query untuk mengambil nama depan, nama belakang customer
SELECT FirstName , LastName 
FROM Customer c 

-- buat query mengambil seluruh informasi karyawan yg titlenya IT Staff
SELECT *
FROM Employee e
WHERE Title = 'IT Staff' 