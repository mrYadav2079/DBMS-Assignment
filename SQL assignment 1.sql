//question 1 

SELECT film.film_id,film.title,film.rating 
FROM film INNER JOIN film_category ON film.film_id=film_category.film_id 
INNER JOIN category ON film_category.category_id=category.category_id 
WHERE category.name='comedy' AND film.rating='PG-13';

//question 2

SELECT film.title ,count(customer.customer_id) AS customer_count
 FROM customer 
INNER JOIN rental ON customer.customer_id= rental.customer_id 
INNER JOIN inventory ON rental.inventory_id=inventory.inventory_id 
INNER JOIN film ON inventory.film_id=film.film_id 
INNER JOIN film_category ON film.film_id=film_category.film_id 
INNER JOIN category ON category.category_id=film_category.category_id 
WHERE category.name="horror"
 GROUP BY film.film_id
 ORDER BY customer_count DESC
 LIMIT 3;

//questio 3

 SELECT Distinct customer.customer_id,customer.first_name, customer.last_name, category.name, country.country 
FROM customer 
INNER JOIN address ON customer.address_id=address.address_id 
INNER JOIN  city ON address.city_id=city.city_id 
INNER JOIN country ON city.country_id=country.country_id 
INNER JOIN rental ON rental.customer_id=customer.customer_id 
INNER JOIN inventory ON inventory.inventory_id=rental.inventory_id 
INNER JOIN film_category ON film_category.film_id=inventory.film_id 
INNER JOIN category ON category.category_id=film_category.category_id 
WHERE country.country='india' and category.name='sports'
order by customer.customer_id ASC;

//question 4

SELECT Distinct customer.customer_id,customer.first_name, customer.last_name, country.country
 FROM customer 
INNER JOIN address ON customer.address_id=address.address_id 
INNER JOIN  city ON address.city_id=city.city_id 
INNER JOIN country ON city.country_id=country.country_id 
INNER JOIN rental ON rental.customer_id=customer.customer_id 
INNER JOIN inventory ON inventory.inventory_id=rental.inventory_id 
INNER JOIN film_category ON film_category.film_id=inventory.film_id 
INNER JOIN film_actor ON film_actor.film_id=inventory.film_id 
INNER JOIN actor ON actor.actor_id=film_actor.actor_id 
WHERE country.country='canada' AND actor.first_name='NICK' AND actor.last_name='WAHLBERG' 
order by customer.customer_id ASC;

//question 5

SELECT count(actor.actor_id) 
FROM film 
INNER JOIN film_actor ON film.film_id=film_actor.film_id 
INNER JOIN actor ON actor.actor_id=film_actor.actor_id 
WHERE actor.first_name='SEAN' AND actor.last_name='WILLIAMS';
