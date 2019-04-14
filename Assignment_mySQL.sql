

#---------------------------------------------------------------------------------------------------------------
#Question-1

select first_name , last_name from sakila.actor;

ALTER table sakila.actor
add column Actor_Name varchar(100);

UPDATE sakila.actor
SET Actor_Name=upper(CONCAT(first_name," ", last_name));


#------------------------------------------------------------------------------------------------------------------
#Question-2


select actor_id, first_name , last_name from sakila.actor where first_name='joe';

select actor_id, first_name , last_name from sakila.actor  where last_name like '%GEN%';

select *  from sakila.actor  where last_name like '%LI%' ORDER BY last_name , first_name ;

# desc sakila.country;

select country_id , country  from sakila.country where country IN ('Afghanistan', 'Bangladesh', 'China');

#-----------------------------------------------------------------------------------------------------------------------
#Question-3 


ALTER table sakila.actor
add column description BLOB;


ALTER table sakila.actor
DROP column description ;


# ------------------------------------------------------------------------------------------------------------------------
#Question-4

select last_name , count(last_name) from sakila.actor GROUP BY last_name;

select last_name , count(last_name) from sakila.actor   GROUP BY last_name HAVING count(last_name)>=2;

UPDATE sakila.actor
SET Actor_Name="HARPO WILLIAMS" ,last_name='WILLIAMS',first_name='HARPO'
where Actor_Name="GROUCHO WILLIAMS";

UPDATE sakila.actor
SET first_name='GROUCHO'
where Actor_Name="HARPO WILLIAMS";


#----------------------------------------------------------------------------------------------------------------------
#Question-5 

desc  sakila.address;

#-------------------------------------------------------------------------------------------------------------------------
#Question - 6 



select s.first_name , s.last_name, a.address FROM
sakila.staff s 
JOIN  sakila.address a  ON 
a.address_id = s.address_id;



select s.first_name,s.staff_id,p.payment_date, sum(p.amount) as "Total_Amount" FROM 
sakila.staff s JOIN  sakila.payment p  ON 
p.staff_id = s.staff_id GROUP BY s.staff_id  HAVING 
p.payment_date >= '20050801 00:00:00' AND 
       p.payment_date <= '20050831 23:59:59' ;
       

select f.film_id , f.title , count(fa.actor_id)  as "Actor_Count" From 
sakila.film f  INNER JOIN   Sakila.film_actor fa  ON 
f.film_id =fa.film_id GROUP BY f.film_id;

select f.film_id , f.title , count(i.inventory_id)  as "film_copies_count" From 
sakila.film f  INNER JOIN   Sakila.inventory i  ON 
f.film_id =i.film_id  where f.title='Hunchback Impossible';

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as "Amount_Paid" From 
sakila.customer c JOIN sakila.payment p ON 
c.customer_id = p.customer_id GROUP BY c.customer_id   
ORDER BY c.last_name ;

#--------------------------------------------------------------------------------------------------------------------------
#Question - 7 


select f.film_id ,f.title from sakila.film f 
where (upper(f.title) LIKE 'K%'  OR upper(f.title) LIKE 'Q%')  
 AND 
f.language_id  IN (
select l.language_id from sakila.language l
where l.name='English'
);


select a.Actor_Name  from sakila.actor a 
where a.actor_id  IN 
(select fa.actor_id from sakila.film_actor  fa where  
fa.film_id IN 
(select f.film_id  from sakila.film f  where 
f.title = 'Alone Trip'));


select c.first_name , c.last_name , c.email from sakila.customer c 
JOIN sakila.address a ON 
c.address_id = a.address_id 
JOIN sakila.city ci ON 
a.city_id = ci.city_id 
JOIN sakila.country co ON 
ci.country_id = co.country_id 
where co.country='Canada';




select f.film_id,f.title from sakila.film f 
JOIN sakila.film_category fc ON 
f.film_id = fc.film_id  
JOIN sakila.category c ON 
fc.category_id = c.category_id
where c.name='Family';


select f.film_id,f.title, r.rental_date from sakila.film f
JOIN sakila.inventory i ON 
f.film_id = i.film_id 
JOIN sakila.rental r ON 
r.inventory_id = i.inventory_id 
Order By r.rental_date desc;


select s.store_id , sum(p.amount) as "Total_Amount_Store"  from sakila.store s
JOIN sakila.staff st ON 
s.store_id = st.store_id 
JOIN sakila.payment p  ON 
p.staff_id = st.staff_id 
GROUP BY s.store_id;



select s.store_id, c.city,co.country from sakila.store s 
JOIN  sakila.address a ON 
s.address_id = a.address_id 
JOIN sakila.city c ON 
c.city_id = a.city_id 
JOIN sakila.country co ON 
co.country_id = c.country_id ;





select c.name , sum(p.amount) as "Gross_Amount" from  sakila.payment p 
JOIN sakila.rental r ON  
r.rental_id = p.rental_id 
JOIN sakila.inventory i ON 
i.inventory_id = r.inventory_id 
JOIN sakila.film_category fc ON 
fc.film_id = i.film_id 
JOIN sakila.category c ON 
c.category_id =fc.category_id 
GROUP BY  (c.name) ORDER BY Gross_Amount desc limit 5;


#--------------------------------------------------------------------------------------------------------------------------------------

# Question - 8 


use sakila;
create view Top_Five_Genres AS 
select c.name , sum(p.amount) as "Gross_Amount" from  sakila.payment p 
JOIN sakila.rental r ON  
r.rental_id = p.rental_id 
JOIN sakila.inventory i ON 
i.inventory_id = r.inventory_id 
JOIN sakila.film_category fc ON 
fc.film_id = i.film_id 
JOIN sakila.category c ON 
c.category_id =fc.category_id 
GROUP BY  (c.name) ORDER BY Gross_Amount desc limit 5;



select * from Top_Five_Genres;



DROP view Top_Five_Genres;