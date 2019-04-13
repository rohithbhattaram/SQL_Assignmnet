desc sakila.actor;

select first_name , last_name from sakila.actor;

ALTER table sakila.actor
add column Actor_Name varchar(100);

UPDATE sakila.actor
SET Actor_Name=upper(CONCAT(first_name," ", last_name));


#------------------------------------------------------------------------------------------------------------------

select actor_id, first_name , last_name from sakila.actor where first_name='joe';

select actor_id, first_name , last_name from sakila.actor  where last_name like '%GEN%';

select *  from sakila.actor  where last_name like '%LI%' ORDER BY last_name , first_name ;

# desc sakila.country;

select country_id , country  from sakila.country where country IN ('Afghanistan', 'Bangladesh', 'China');

#-----------------------------------------------------------------------------------------------------------------------

ALTER table sakila.actor
add column description BLOB;


ALTER table sakila.actor
DROP column description ;


# ------------------------------------------------------------------------------------------------------------------------

select last_name , count(last_name) from sakila.actor GROUP BY last_name;

select last_name , count(last_name) from sakila.actor   GROUP BY last_name HAVING count(last_name)>=2;

UPDATE sakila.actor
SET Actor_Name="HARPO WILLIAMS" ,last_name='WILLIAMS',first_name='HARPO'
where Actor_Name="GROUCHO WILLIAMS";

UPDATE sakila.actor
SET first_name='GROUCHO'
where Actor_Name="HARPO WILLIAMS";


#----------------------------------------------------------------------------------------------------------------------

desc  sakila.address;

















