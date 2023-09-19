-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT *
FROM actor
WHERE last_name = 'Wahlberg';

-- output: 2


-- 2. How many payments were made between $3.99 and $5.99?

SELECT amount, COUNT(payment)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99
GROUP BY amount;

-- output: 5,607


-- 3. What film does the store have the most of? (search in inventory)
--SELECT film_id, COUNT(film_id)
--FROM inventory
--GROUP BY film_id
--ORDER BY count DESC;

SELECT title
FROM film
WHERE film_id IN (
    SELECT film_id, COUNT(film_id)
    FROM inventory
    GROUP BY film_id
    HAVING COUNT > 7);

-- output: film id: 193



-- 4. How many customers have the last name ‘William’?
SELECT *
FROM customer
WHERE last_name = 'William';

-- output: 0 



-- 5. What store employee (get the id) sold the most rentals?
SELECT count(staff_id), staff_id
FROM rental
GROUP BY staff_id;

-- output: Mike Hillyer (id: 1)


-- 6. How many different district names are there?
SELECT DISTINCT district
FROM store, address;

-- output:378



-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY count DESC;
--output:film_id 508



 --8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, last_name
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1

-- output: 13



-- 9. How many payment amounts had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(payment_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY payment_id > 250
-- output: 1257



-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT COUNT(rating), rating
FROM film
GROUP BY rating

-- output: 5, PG-13
