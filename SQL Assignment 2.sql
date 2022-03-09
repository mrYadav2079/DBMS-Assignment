//question 1

SELECT count(film.film_id) as No_of_Movie_with_dlt_secen 
FROM film 
INNER JOIN film_category ON film.film_id=film_category.film_id
INNER JOIN category ON category.category_id=film_category.category_id
WHERE category.name='Documentary' AND film.special_features='deleted scenes';

//question 2

SELECT count(film_category.film_id)as No_Stf_Movie 
FROM film_category
INNER JOIN category ON film_category.category_id=category.category_id
INNER JOIN inventory ON film_category.film_id=inventory.film_id
INNER JOIN store ON store.store_id=inventory.store_id
INNER JOIN staff ON staff.staff_id=store.manager_staff_id
WHERE category.name='sci-fi' AND staff.first_name='jon' AND staff.last_name='Stephens';

//question 3

SELECT total_sales 
FROM sales_by_film_category
WHERE category='Animation';

question 4

SELECT category.name, count(customer.customer_id) AS NO_OF_CUSTOMER 
FROM customer
INNER JOIN rental ON customer.customer_id=rental.customer_id
INNER JOIN inventory ON inventory.inventory_id=rental.inventory_id
INNER JOIN film_category ON film_category.film_id=inventory.film_id
INNER JOIN category ON category.category_id=film_category.category_id
WHERE customer.first_name='PATRICIA' AND customer.last_name='JOHNSON'
GROUP BY category.name 
ORDER BY count(customer.customer_id) DESC LIMIT 3;

question 5

SELECT count(film.rating) AS NO_OF_R_RATED_MOVIES 
FROM film
INNER JOIN inventory ON film.film_id=inventory.film_id
INNER JOIN rental ON rental.inventory_id=inventory.inventory_id
INNER JOIN customer ON customer.customer_id=rental.customer_id
WHERE customer.first_name='SUSAN' AND customer.last_name='WILSON' AND film.rating='R';
