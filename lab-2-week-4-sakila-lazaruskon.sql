-- Instructions
use sakila;

    --  Select all the actors with the first name ‘Scarlett’.
    
select * from sakila.actor; -- checking out the actor table
select * from actor where first_name = "Scarlett"; 
    
    --  Select all the actors with the last name ‘Johansson’.

select * from actor where last_name = "Johansson";
    
    --  How many films (movies) are available for rent?
    
select * from sakila.film; -- checking out the film table
select count(distinct title) from film;

-- There are 1000 movies available to rent.

    --  How many films have been rented?
select * from sakila.rental; -- Next I'll use count on rental_id to see how many films hav been rented out based on the number of IDs.
select count(distinct rental_id) from rental; 
select count(rental_id) from rental;-- I also tried this and got the same number.
select count(customer_id) from rental; -- sanity check to see if number of rentals is the same as the same as number of the correspoinding customers

-- The total amount of films rented is 16044 (at least I think so, not sure if it's correct).

    --  What is the shortest and longest rental period?
select * from rental;

select max(TIMEDIFF(return_date, rental_date)) from rental;
-- The longest rental period is 221:59:00 hours.

select min(TIMEDIFF(return_date, rental_date)) from rental; 
-- The shortet rental period is 18:00:00 hours.

    -- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
    
select * from film;
select max(length) from film; -- the longest movie duration is 185 minutes.
select min(length) from film; -- the shortest movie duration is 46 minutes.
    
    -- What's the average movie duration?

select * from film;
select floor(avg(length)) from film; 

-- The average duration of a movie is about 115 minutes.
    
    -- What's the average movie duration expressed in format (hours, minutes)?

select * from film;
select floor(avg(length)) from film;
select convert(floor(avg(length)), time) as length_timeformat from film;

-- The average duration of a movie is about 1 hour and 15 minutes.
    
    -- How many movies longer than 3 hours?

select * from film;
select count(length) from film where length > 180; -- from the above questions we know how it works now with the column length
 
-- There are 39 movies longer than 3 hours. 
    
    -- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
    
 select * from customer;
 select concat(first_name, " ", last_name, " - ", email) as contact_details_formatted from customer; 
 
 -- Note: I could have potentially used also lower() to get that exact format of the question but I wasn't sure it's needed.
 
    -- What's the length of the longest film title?
    
Select *
from film
where length(title) = (
	select max(length(title))
	from film);

-- the longest film title is'ARACHNOPHOBIA ROLLERCOASTER'...

Select length(title)
from film
where LENGTH(title) = (
	select MAX(LENGTH(title))
	from film);

-- ... with a length of 27 characters.