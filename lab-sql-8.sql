use sakila;
select title, length, row_number() over(order by length desc) as 'rank' from film where length <> " " and length <> "" and length <> 0; -- Q1
select title, length, rating, dense_rank() over(partition by rating order by length desc) as 'rank' from film where length <> " " and length <> "" and length <> 0; -- Q2
select c.category_id, count(fc.film_id) as '#films'
from sakila.category c
join sakila.film_category fc on c.category_id = fc.category_id
group by category_id; -- Q3

select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as '#films'
from sakila.actor a
join sakila.film_actor fa on a.actor_id = fa.actor_id
group by actor_id order by count(fa.film_id) desc limit 1; -- Q4

select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as 'rentals'
from sakila.customer c
join sakila.rental r on c.customer_id = r.customer_id
group by customer_id order by count(r.rental_id) desc limit 1; -- Q5

select f.film_id, f.title, i.inventory_id, count(r.rental_id) as "rentals"
from sakila.film f
join sakila.inventory i on f.film_id = i.film_id
join sakila.rental r on i.inventory_id = r.inventory_id
group by film_id order by count(r.rental_id) desc limit 1; -- bonus



select distinct category_id from category;
select distinct category_id, film_id from film_category;
select last_update from actor;