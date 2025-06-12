create table customer
(
	cust_id int,
    city varchar(20),
    postal_code int,
    country varchar(20)
);

insert into customer(cust_id,city,postal_code,country)
values(101,'pune',23781,'India'),
(102,'nashik',23281,'USA'),
(103,'delhi',11281,'Austria'),
(104,'mumbai',23241,'Brazil'),
(105,'nashik',23211,'USA'),
(106,'kolkata',23241,'Austria'),
(107,'pune',2081,'USA'),
(108,'jaipur',2300,'Brazil'),
(109,'chennai',23134,'India');

update customer set postal_code = null 
where cust_id =107;

-- 1 . Write a statement that will select the City column from the Customers table

select city from customer;

-- 2. Select all the different values from the Country column in the Customers table.

select distinct country from customer;

-- 3 . Select all records where the City column has the value "London".

select * from customer where city in ('jaipur');

-- 4 . Use the NOT keyword to select all records where City is NOT "Berlin".

select * from customer where NOT city = 'jaipur';

-- 5 .Select all records where the CustomerID column has the value 23.

select * from customer where cust_id =105;

-- 6 . Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.

select * from customer where city='jaipur' and postal_code=2300;

-- 7 . Select all records where the City column has the value 'Berlin' or 'London'.

select * from customer where city = 'jaipur' or city = 'londan';

-- 8. Select all records from the Customers table, sort the result alphabetically by the column City.

select * from Customer order by city;

-- 9. Select all records from the Customers table, sort the result reversed alphabetically by the column City.

select * from Customer order by city desc;

-- 10. Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City

select * from Customer order by country,city;

-- 11 . Select all records from the Customers where the PostalCode column is empty.

select * from customer where postal_code is null;

-- 12 .Select all records from the Customers where the PostalCode column is NOT empty.

select * from customer where postal_code is not null;

-- 13 . Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".

update customer set city = 'Oslo' where country = 'USA' and cust_id =102;

-- 14 . Delete all the records from the Customers table where the Country value is 'Norway'.

delete from customer where country = 'Austria';

-- 20 . Select all records where the value of the City column starts with the letter "a".

select * from customer where city like 'p%';

-- 21 . Select all records where the value of the City column ends with the letter "l".

select * from customer where city like '%r';

-- 22 . Select all records where the value of the City column contains the letter "a".

select * from customer where city like '%a%';

-- 23 . Select all records where the value of the City column starts with letter "a" and ends with the letter "b".

select * from customer where city like 'j%' and city like '%r';

-- 24 . Select all records where the value of the City column does NOT start with the letter "a".

select * from customer where city not like 'p%';

-- 25 . Select all records where the second letter of the City is an "a".

select * from customer where city like '_s%';

-- 26 . Select all records where the first letter of the City is an "a" or a "c" or an "s".

select * from customer where city like 'a%' or city like 'c%' or city like 'j%';

-- 27 . Select all records where the first letter of the City starts with anything from an "a" to an "f".

select * from customer where city between 'a' and 'f';

-- 28 . Select all records where the first letter of the City is NOT an "a" or a "c" or an "f"

select * from customer where city not like 'a%' or city not like 'c%' or city not like 'f%';

-- 29 . Use the IN operator to select all the records where the Country is either "Norway" or "France".

select * from customer where country in("Norway","India");

-- 30 . Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".

select * from customer where country not in("USA","India");

-- 34 .When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.

select cust_id, city, country, postal_code as pno from customer;

-- 35 . When displaying the Customer table, refer to the table as Consumers instead of Customer.

select * from Customer as Consumers;

-- 36 . List the number of customers in each country.

select country, count(*) as num_customer from customer group by Country;

-- 37 . List the number of customers in each country, ordered by the country with the most customers first.

select country, count(*) as num_customer from customer group by country order by num_customer desc;
