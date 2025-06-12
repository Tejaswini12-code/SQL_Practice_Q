create table product1
(
   pro_id int ,
   pro_name varchar(20),
   pro_price bigint 
    
);

insert into product1(pro_id , pro_name , pro_price)
values(101,'Bag',1200),
(101,'notebook',1200),
(102,'sony',1300),
(103,'bajaj',500),
(104,'soap',1100),
(105,'shampoo',1300),
(106,'hair',2000),
(107,'phones',1000),
(108,'biscuit',1500),
(109,'fastrack',3000),
(110,'laptop',900);

-- 15 . Use the MIN function to select the record with the smallest value of the Price column.

select * from product1 where pro_price = (select min(pro_price) from product1);

-- 16 . Use an SQL function to select the record with the highest value of the Price column.

select * from product1 where pro_price = (select max(pro_price) from product1);

-- 17 . Use the correct function to return the number of records that have the Price value set to 20

select count(*) from product1 where pro_price = 500;

-- 18 . Use an SQL function to calculate the average price of all products.

select avg(pro_price) as average_price from product1;

-- 19 . Use an SQL function to calculate the sum of all the Price column values in the Products table

select sum(pro_price) as total_price from Product1;

-- 31 . Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20

select * from product1 where pro_price between 500 and 1200 ;

-- 32 . Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.

select * from product1 where pro_price not between 500 and 1300 ;

-- 33 . Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically  between 'Geitost' and 'Pavlova'.

select * from product1 where pro_name between 'fastrack' and 'hair' ;
