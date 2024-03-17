use sakila;

-- 1.
select COUNT(*) as num_copies
from film as f
join inventory as i on f.film_id = i.film_id
where f.title = 'Hunchback Impossible';

-- 2. 
select
    title,
    length
from film
where length > (select avg(length) from film);

-- 3.
select 
    first_name,
    last_name
from actor
where actor_id in (select actor_id from film_actor where film_id = (select film_id from film where title = 'Alone Trip'));


-- 4.
select 
	title 
from film
where film_id in (select film_id from film_category where category_id in (select category_id from category where name = 'Family'));


-- 5.
select 
    first_name,
    last_name,
    email
from customer
where address_id in (select address_id from address where city_id in (select city_id from city where country_id in (select country_id from country where country = 'Canada')));
  

select 
    c.first_name,
    c.last_name,
    c.email
from customer as c
join address as a on c.address_id = a.address_id
join city as ci on a.city_id = ci.city_id
join country as co on ci.country_id = co.country_id
where co.country = 'Canada';


