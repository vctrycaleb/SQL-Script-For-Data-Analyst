-- tampilkan firstname & lastname dari tabel actor
SELECT first_name , last_name 
FROM actor a 
--tampilkan gabungan firstname & lastname dengan huruf kecil
--dan nama kolom actor_name
--hint: gunakan || untuk menggambukan 2 kolom

SELECT LOWER(first_name||" "||last_name) as actor_name 
FROM actor a  
--kamu mengingat aktor dgn nama depan 'JOE'
--tampilkan actor_id, firstname dan lastname orang tersebut

SELECT actor_id ,first_name ,last_name 
FROM actor a 
WHERE first_name= 'JOE'
--masih sama seperti soal sebelumnya, cari orang yang nama belakangnya menandung kata "LI" 
--coba urutkan berdasarkan nama belakang
--jika ada orang dng nama belakang sama urutkan dengan nama depan

SELECT actor_id , first_name , last_name 
FROM actor a 
WHERE last_name LIKE '%LI%'
ORDER BY last_name , first_name
--dengan fungsi IN di SQL, tampilkan ID negara afghanistan, bangladesh, cina

SELECT country_id , country 
FROM country c 
WHERE country IN ('Afghanistan','Bangladesh','China')
--tampilkan semua nama belakang aktor dan hitung ada berapa aktor dengan nama belakang tsb

SELECT last_name , COUNT(last_name) 
FROM actor a 
GROUP BY last_name 
--sama seperti sebelumnya, skrng buang nama belakang aktor yg hanya dimiliki 1 orang

SELECT last_name , COUNT(last_name) as jmlactor 
FROM actor a 
GROUP BY last_name
HAVING jmlactor>1
--cari nama depan, nama belakang, & alamat dari setiap staff member
--gunakan tabel staff dan address

SELECT first_name ,  last_name , address
FROM staff s left join address a 
ON s.address_id = a.address_id 
--cari berapa banyak penjualan(amount) yg berhasil dibuat setiap staff member
--pada bulan agustus 2005. gunakan tabel staff dan payment

SELECT s.staff_id , SUM(amount) 
FROM staff s left join payment p
ON s.staff_id = p.staff_id 
WHERE payment_date >='2005-08-01' AND payment_date < '2005-09-01'
GROUP BY  s.staff_id 
--tampilkan judul film dan berapa banyak aktor yg ada setiap film

SELECT title , COUNT(actor_id) 
FROM film f inner join film_actor fa 
ON f.film_id = fa.film_id 
GROUP BY title 
--cari informasi customer & brp byk biaya yg dikeluarkan oleh setiap customer.
--urutkan hasil pencarian customer berdasarkan nama belakang secara abjad

SELECT c.customer_id ,last_name ,SUM(amount) 
FROM customer c left join payment p 
ON c.customer_id = p.customer_id 
GROUP BY c.customer_id 
ORDER BY last_name 
--perusahaan ingin membuat marketing campaign melalui email di kanada.
--cari semua email customer yg berasal dari kanada. gunakan CTE jika bisa

WITH lokasi as(
	SELECT address_id, a.city_id, c.country_id, city, country	
	FROM address a inner join city c 
	ON a.address_id = c.city_id
	INNER JOIN country c2 ON c.city_id = c2.country_id	
)
SELECT email
FROM customer c 
WHERE address_id IN (select address_id from lokasi where country='Canada')
--tampilkan nama film yg sering disewa/dirental dan urutkan dari yg paling populer.

SELECT f.title, COUNT(rental_id) 
FROM rental r inner join inventory i 
ON r.inventory_id = i.inventory_id 
INNER JOIN film f ON f.film_id = i.film_id 
GROUP BY f.film_id 
ORDER BY COUNT(rental_id) DESC  
--buat query yg menunjukan berapa banyak revenue(amount) yg diperoleh masing2 toko.

SELECT s.store_id , SUM(amount) as totalrevanue
FROM payment p inner join rental r 
ON p.rental_id = r.rental_id 
INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
INNER JOIN store s ON s.store_id = i.store_id 
GROUP BY s.store_id 
--cari 5 genre film dengan gross revenue tertinggi. diurutkan dari yg paling laku terlebih dahulu
--hint: genre terdapat di tabel film_category

SELECT c.name as genre, SUM(amount) as grossrevenue	 
FROM payment p left join rental r 
ON p.rental_id = r.rental_id
LEFT JOIN inventory i ON i.inventory_id = r.inventory_id 
LEFT JOIN film f ON f.film_id = i.inventory_id 
LEFT JOIN film_category fc ON fc.film_id = i.film_id 
LEFT JOIN category c ON c.category_id = fc.category_id 
GROUP BY genre
ORDER BY grossrevenue DESC 
LIMIT 5