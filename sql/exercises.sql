#                              __
# .--------.--.--.-----.-----.|  |
# |        |  |  |__ --|  _  ||  |
# |__|__|__|___  |_____|__   ||__|
#          |_____|        |__|
#
#        e x e r c i s e s

# Important: Remember to add a semi-colon at the end of each query.

# ---------------------------------------------------------#


## 1. SELECT statements

# 1a. SELECT all columns FROM the actor table.
SELECT * FROM actor;

# 1b. SELECT only the last_name column FROM the actor table.
SELECT last_name FROM actor;

# 1c. SELECT only the following columns FROM the film table.
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# rental_duration       Exists in film table.
# rental_rate           Exists in film table.
# total_rental_cost     rental_duration * rental_rate
SELECT
    title, 
    description, 
    rental_duration, 
    rental_rate, 
    rental_duration * rental_rate AS total_rental_cost
FROM film;


# ---------------------------------------------------------#


## 2. DISTINCT operator

# 2a. SELECT all distinct (different) last names FROM the actor table.
SELECT DISTINCT last_name FROM actor;

# 2b. SELECT all distinct (different) postal codes FROM the address table.
SELECT DISTINCT postal_code FROM address;

# 2c. SELECT all distinct (different) ratings FROM the film table.
SELECT DISTINCT rating FROM film;


# ---------------------------------------------------------#


## 3. WHERE clause

# 3a. SELECT the title, description, rating, movie length columns FROM the films table that last 3 hours or longer.
SELECT
    title,
    description,
    rating,
    length
FROM film
WHERE length >= 180;

# 3b. SELECT the payment id, amount, and payment date columns FROM the payments table for payments made on or after 05/27/2005.
SELECT
    payment_id,
    amount,
    payment_date
FROM payment
WHERE date(payment_date) >='2005-05-27';

# 3c. SELECT the primary key, amount, and payment date columns FROM the payment table for payments made on 05/27/2005.
SELECT
    payment_id,
    amount,
    payment_date
FROM payment
WHERE date(payment_date) ='2005-05-27';

# 3d. SELECT all columns FROM the customer table for rows that have a last name beginning with "S" and a first name ending with "N".
SELECT *
FROM customer
WHERE last_name LIKE 'S%' AND first_name LIKE '%N';

# 3e. SELECT all columns FROM the customer table for rows where the customer is inactive or has a last name ending with "M".
SELECT *
FROM customer
WHERE last_name LIKE '%M' OR active = 0;

# 3f. SELECT all columns FROM the category table for rows where the primary key is greater than 4 and the name field begins with either "C", "S" or "T".
SELECT *
FROM category
WHERE category_id > 4 AND (name LIKE 'S%' OR name LIKE 'C%' OR name LIKE 'T%');

# 3g. SELECT all columns minus the password column FROM the staff table for rows that contain a password.
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, last_update, username
FROM staff
WHERE password IS NOT NULL;

# 3h. SELECT all columns minus the password column FROM the staff table for rows that do not contain a password.
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, last_update, username
FROM staff
WHERE password IS NULL;

# ---------------------------------------------------------#


## 4. IN operator

# 4a. SELECT the phone and district columns FROM the address table for addresses in California, England, Taipei, or West Java.
SELECT phone, district
FROM address
WHERE district IN ('California', 'England', 'Taipei', 'West Java');

# 4b. SELECT the payment id, amount, and payment date columns FROM the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005.
# (Use the IN operator and the DATE function, instead of the AND operator AS in previous exercises.)
SELECT payment_id, amount, payment_date
FROM payment
WHERE DATE(payment_date) IN ('2005-05-25', '2005-05-27',  '2005-05-29');

# 4c. SELECT all columns FROM the film table for films rated G, PG-13 or NC-17.
SELECT *
FROM film
WHERE rating IN ('G', 'PG-13', 'NC-17');

# ---------------------------------------------------------#


## 5. BETWEEN operator

# 5a. SELECT all columns FROM the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
SELECT *
FROM payment
WHERE payment_date BETWEEN '2005-5-25' AND '2005-5-26';

# 5b. SELECT the following columns FROM the film table for films where the length of the description is between 100 and 120.
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# release_year          Exists in film table.
# total_rental_cost     rental_duration * rental_rate
SELECT
	title,
    description,
    release_year,
    rental_duration * rental_rate AS total_rental_cost
FROM film
WHERE length(description) BETWEEN 100 AND 120;

# ---------------------------------------------------------#


## 6. LIKE operator

# 6a. SELECT the following columns FROM the film table for rows where the description begins with "A Thoughtful".
# Title, Description, Release Year
SELECT
	title,
    description,
    release_year
FROM film
WHERE description LIKE 'A thoughtful%';

# 6b. SELECT the following columns FROM the film table for rows where the description ends with the word "Boat".
# Title, Description, Rental Duration
SELECT
	title,
    description,
    rental_duration
FROM film
WHERE description LIKE '%Boat';

# 6c. SELECT the following columns FROM the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
# Title, Length, Description, Rental Rate
SELECT
	title,
    length,
    description,
    rental_rate
FROM film
WHERE length > 180 AND description LIKE '%Database%';

# ---------------------------------------------------------#


## 7. LIMIT Operator

# 7a. SELECT all columns FROM the payment table and only include the first 20 rows.
SELECT *
FROM payment
limit 20;

# 7b. SELECT the payment id, payment date and amount columns FROM the payment table for rows where the payment amount is greater than 5 and only SELECT rows whose zero-based index in the result set is between 51-100.
SELECT
	payment_id,
    payment_date,
    amount
FROM payment
WHERE amount > 5
LIMIT 50 OFFSET 50;


# 7c. SELECT all columns FROM the customer table, limiting results to those where the zero-based index is between 101-200.
SELECT *
FROM customer
LIMIT 100 OFFSET 100;

# ---------------------------------------------------------#


## 8. ORDER BY statement

# 8a. SELECT all columns FROM the film table and order rows by the length field in ascending order.
SELECT *
FROM film
ORDER BY length ASC;

# 8b. SELECT all distinct ratings FROM the film table ordered by rating in descending order.
SELECT DISTINCT rating
FROM film
ORDER BY rating DESC;

# 8c. SELECT the payment date and amount columns FROM the payment table for the first 20 payments ordered by payment amount in descending order.
SELECT
	payment_date,
	amount
FROM payment
ORDER BY amount DESC
LIMIT 20;

# 8d. SELECT the title, description, special features, length, and rental duration columns FROM the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
SELECT
	title,
	description,
    special_features,
    length,
    rental_duration
FROM film
WHERE special_features LIKE '%Behind the Scenes%' AND length < 120 AND rental_duration BETWEEN 5 AND 7
ORDER BY length DESC
LIMIT 10;

# ---------------------------------------------------------#


## 9. JOINS
# (Take some time to compare results of the next three exercises)

# 9a. SELECT customer first_name/last_name and actor first_name/last_name columns FROM performing a left JOIN between the customer and actor column on the last_name column in each table. (i.e. `customer.last_name = actor.last_name`)
# Label customer first_name/last_name columns AS customer_first_name/customer_last_name
# Label actor first_name/last_name columns in a similar fashion.
SELECT 
	customer.first_name AS customer_first_name,
    customer.last_name AS customer_last_name,
    actor.first_name AS actor_first_name,
    actor.last_name AS actor_last_name
FROM customer
LEFT JOIN actor
ON customer.last_name = actor.last_name;

# 9b. SELECT the customer first_name/last_name and actor first_name/last_name columns FROM performing a right JOIN between the customer and actor column on the last_name column in each table. (i.e. `customer.last_name = actor.last_name`)
SELECT 
	customer.first_name AS customer_first_name,
    customer.last_name AS customer_last_name,
    actor.first_name AS actor_first_name,
    actor.last_name AS actor_last_name
FROM customer
RIGHT JOIN actor
ON customer.last_name = actor.last_name;

# 9c. SELECT the customer first_name/last_name and actor first_name/last_name columns FROM performing an inner JOIN between the customer and actor column on the last_name column in each table. (i.e. `customer.last_name = actor.last_name`)
SELECT 
	customer.first_name AS customer_first_name,
    customer.last_name AS customer_last_name,
    actor.first_name AS actor_first_name,
    actor.last_name AS actor_last_name
FROM customer
INNER JOIN actor
ON customer.last_name = actor.last_name;

# 9d. SELECT the city name and country name columns FROM the city table, performing a left JOIN with the country table to get the country name column.
SELECT 
	city,
    country.country
FROM city
LEFT JOIN country
ON city.country_id = country.country_id;

# 9e. SELECT the title, description, release year, and language name columns FROM the film table, performing a left JOIN with the language table to get the "language" column.
# Label the language.name column AS "language" (e.g. `SELECT language.name AS language`)
SELECT 
	title,
    description,
    release_year,
    language.name AS language
FROM film
LEFT JOIN language
ON film.language_id = language.language_id;

# 9f. SELECT the first_name, last_name, address, address2, city name, district, and postal code columns FROM the staff table, performing 2 left JOINs with the address table then the city table to get the address and city related columns.
SELECT 
	first_name,
    last_name,
    address.address,
    address.address2,
    city.city,
    district,
    address.postal_code
FROM staff
LEFT JOIN address
ON staff.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id;
