USE sakila;

# 1- How many distinct (different) actors' last names are there?

SELECT COUNT(Distinct last_name)
FROM actor;

# 2- In how many different languages where the films originally 
#produced? (Use the column language_id from the film table)

SELECT COUNT(DISTINCT language_id)
FROM film;

# 3- How many movies were released with "PG-13" rating?
SELECT COUNT(rating)
FROM film
WHERE rating = 'PG-13';

# 4- Get 10 the longest movies from 2006.
SELECT release_year, length, film_id
FROM film
WHERE release_year = '2006'
ORDER BY length DESC
LIMIT 10;

# 5- How many days has been 
#the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(last_update), MIN(rental_date))
FROM rental;

# 6-Show rental info with 
#additional columns month and weekday. Get 20.

SELECT *
FROM rental;

SELECT *, SUBSTRING(rental_date, 6, 2) AS month, SUBSTRING(rental_date, 9, 2) AS day
FROM rental
LIMIT 20;

# Add an additional column day_type with 
#values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
CASE
	WHEN DAYNAME(rental_date) = 'Saturday' OR DAYNAME(rental_date) = 'Sunday' THEN 'Weekend'
    ELSE 'Workday'
END AS 'day_type'
FROM rental;

# 8- How many rentals were in the last month of activity?

SELECT COUNT(rental_id) FROM rental
WHERE YEAR(rental_date) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
AND MONTH(rental_date) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH);

SELECT COUNT(rental_id) FROM rental
where month(rental_date)=month(now())-1;



    