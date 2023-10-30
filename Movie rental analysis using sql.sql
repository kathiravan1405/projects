USE sakila;
-- task1
select concat(first_name,' ',last_name) as fullname from actor;



-- task2.1
select first_name,count(first_name) as counts from actor group by first_name;



-- task2.2
select distinct(first_name,count(first_name)) from actor group by first_name;
-
select  count(first_name)as countofnames from (select distinct first_name from actor) as counts;





select distinct first_name from actor 





-- task3.1
select last_name,count(last_name) as counts from actor group by last_name





-- task3.2
select distinct last_name from actor

-- task4.1
select * from film where rating='r'

-- task4.2
select * from film where rating!='r'




-- task4.3
select * from film where rating ='pg-13'




-- task5.1
select * from film where replacement_cost<11





-- task5.2
select * from film where replacement_cost between 11 and 20;




-- task5.3
select * from film order by replacement_cost desc;



SET @@sql_mode = SYS.LIST_DROP(@@sql_mode, 'ONLY_FULL_GROUP_BY');
SELECT @@sql_mode;
select * from film_actor
-- task6
select title ,first_name,count(first_name) as counts from film_actor fa 
join  film f on f.film_id=fa.film_id join actor a on a.actor_id=fa.actor_id
group by fa.film_id order by count(first_name) desc limit 3




-- task7
select title from film where title like 'q%' or title like 'k%'


-- task8
select first_name,last_name from actor a join film_actor fa on a.actor_id=fa.actor_id 
join film f on f.film_id=fa.film_id where f.title='agent truman';



select * from category
-- task9
select title from film f join film_category fc on f.film_id=fc.film_id join category c 
on c.category_id=fc.category_id where c.name='family'




-- task10.1
select rating,max(rental_rate) as maximum,min(rental_rate) as minimum ,avg(rental_rate) as average from film 
group by rating order by average desc;
select f.title,i.film_id from film f join inventory i on f.film_id=i.film_id
group by i.film_id order by i.film_id desc;
select * from rental 
select * from inventory

-- task10.2
select rental_duration,title from film group by rental_duration
order by rental_duration desc;

select * from film_category
-- task11
select c.name,count(fc.category_id) as counts from film_category fc join film f on f.film_id=fc.film_id join category c on fc.category_id=c.category_id
 group by fc.category_id having avg((f.replacement_cost)-(f.rental_rate))>15
 
 
 
 
 
 -- task12
 select c.name from film_category fc join film f on f.film_id=fc.film_id join category c on fc.category_id=c.category_id
 group by c.name having count(title)>70


select count(
