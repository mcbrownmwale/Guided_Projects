/* Practice Questions for practice */

-- 1. Display the first name, last name, and email of all customers
SELECT first_name, last_name, email
  FROM customer
 LIMIT 20;

-- 2. List all tracks by the artist "Queen". Include track name and album title.
SELECT t.name AS track_name, al.title AS album_title
  FROM track AS t
  JOIN album AS al
    ON t.album_id = al.album_id
  JOIN artist AS ar
    ON al.artist_id = ar.artist_id
 WHERE ar.name LIKE 'Queen';

-- 3. Show the number of tracks in each genre. Display genre name and count, sorted by highest count first.
SELECT g.name AS genre_name, COUNT(*) AS number_of_tracks
  FROM track AS t
  JOIN genre AS g
    ON t.genre_id = g.genre_id
 GROUP BY g.name 
 ORDER BY number_of_tracks DESC;

-- 4. List customers from Canada (Country = 'Canada'). Include their full name (concatenated), phone, and city.
SELECT first_name || ' ' || last_name AS customer_name, phone, city
  FROM customer
 WHERE country = 'Canada';

-- 5. Show the total amount spent by each customer (display customer name and total spent, sorted highest first).
SELECT c.first_name || ' ' || c.last_name AS customer_name, SUM(i.total) AS total_spent
  FROM customer AS c
  JOIN invoice AS i
    ON c.customer_id = i.customer_id
 GROUP BY customer_name
 ORDER BY total_spent DESC;

-- 6.  List the top 5 most purchased tracks (include track name and purchase count).
SELECT t.name AS track_name, SUM(il.quantity) AS purchase_count
  FROM track AS t
  JOIN invoice_line AS il
    ON t.track_id = il.track_id
 GROUP BY t.name 
 ORDER BY purchase_count DESC
 LIMIT 5;



