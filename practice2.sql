-- 38 . Write the correct SQL statement to create a new database called testDB.

create database testDB;

-- 39 . Write the correct SQL statement to delete a database named testDB

drop database testDB;

-- 40 . Add a column of type DATE called Birthday in Persons table

use testDB;
create table persons
(
	per_name varchar(20)
);

alter table persons add column Birthday date;

-- 41 . Delete the column Birthday from the Persons table

alter table Persons drop column Birthday;

