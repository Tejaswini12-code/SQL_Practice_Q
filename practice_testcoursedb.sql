-- Assignment 1  Using testcoursedb as database.

-- 1. Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.

select first_name,last_name,salary from employees where salary not between 10000 and 15000; 

-- 2. Write a query to display the names (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending alphabetical order by department ID.

select first_name,last_name,department_id from employees where department_id in (30,100) order by department_id asc;

-- 3. Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.

select first_name,last_name,salary from employees where salary not between 10000 and 15000 and department_id in(30,100);

-- 4. Write a query to display the names (first_name, last_name) and hire date for all employees who were hired in 1987.

select first_name,last_name,hire_date from employees where year(hire_date) = 1987;

-- 5. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.

select first_name  from employees where first_name like '%b%' and first_name like '%c%';

-- 6. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.

select last_name,job_id,salary from employees where job_id in ('SH_CLERK','IT_PRO','AC_ACCOUNT') and salary not in (4500,10000,15000);

-- 7. Write a query to display the last names of employees whose names have exactly 6 characters.

select last_name from employees where length(last_name) = 6;

-- 8. Write a query to display the last names of employees having 'e' as the third character.

select last_name from employees where last_name like '__e%';

-- 9. Write a query to display the jobs/designations available in the employees table.

select distinct job_id from employees;

-- 10. Write a query to display the names (first_name, last_name), salary and PF (15% of salary) of all employees

select first_name,last_name,salary,  salary * 0.15 as pf from employees;


# Assignment2:

#1. Find the empid, firstname, lastname and salary of employee

select employee_id,first_name,last_name,salary from employees;

#2. Find the employees in deptid 60

select * from employees where department_id = 60;

#3. Find the employees with salary greater than 1000

select * from employees where (salary >1000); 

#4. Find the employees whose manager id is not given

select * from employees where manager_id is null ;

#5. find the department whose manaer_id is 0

select department_id from departments where manager_id = 0;

#6. Find the employees with salary in range 5000 to 10000

select salary from employees where salary between 5000 and 10000;

#7. Find the employees who works in deparment 10,20 or50

select * from employees where department_id in (10,20,50);

# 8.Find the employees who work in department 80 and 60  and has salary above 15000

select * from employees where department_id in (80,90) and salary > 15000;



# Like Clause

# show the employee names starting with vowels

select * from employees where first_name like 'a%' or first_name like 'e%' or first_name like 'i%' or first_name like 'o%' or first_name  like'u%';

# show the employee names ending with vowels

select * from employees where first_name like '%a' or first_name like '%e' or first_name like '%i' or first_name like '%o' or first_name  like'%u';

# show the department names having exactly 5 characters  -------- used departemnt table

select * from departments where length (department_name)=5; 

# show the employee names starting with a and having min 2 characters

select * from employees where first_name like 't%'and length (first_name)=2;  

# show the employees names that start with a and end with r
select * from employees where first_name like 'l%' and first_name like '%x';



# Update and Delete

# 1. Increase the salary of all employees by 10%

update employees set salary = salary * 1.10;

# 2. Increase the salary of employees by 1000 who works in department 60

update employees set salary = salary + 1000 where department_id = 60;

# 3. Delete the employees working in 60 department -- Ensure to rollback this

delete from employees where department_id = 60;



# Aggregate:

#  Find the total department in employee table

select count(distinct DEPARTMENT_ID) as total_count from employees;

# find the max salary

select max(SALARY) as max_salary from employees;

# find the min salary 

select min(SALARY) as min_salary from employees;

#  find the total salary 

select sum(SALARY) as total_salary from employees;

# find the avg salary 

select avg(SALARY) as avg_salary from employees;



use testcoursedb;

 # 1. Find the total employees in each department
 
 select department_id , count(*) as total_employees from employees group by department_id;
 
 # 2. Find the total department in each location  ----------- using departments table
 
 select location_id , count(distinct department_id) as total_department from departments group by location_id;
 
  # 3. Find the average salary according to department
  
  select department_id , avg(salary) as avg_salary from employees group by department_id;
  
  # 4. Find the max salary for each job id
  
  select job_id , max(salary) as max_salary from employees group by job_id;
  
 # 5. Find the total salary dispursed in each department
 
 select department_id , sum(salary) as total_salary from employees group by department_id;
 
 # 6. Find the total employees in each department where employees are greater than 5
 
 select department_id , count(employee_id) as emp_count from employees group by department_id having count(employee_id) >5 order by emp_count desc;
 
 # 7. Find the total no of employees working in each job
 
 select job_id , count(employee_id) as emp_count from employees group by job_id;
 
 # 8. Find the total department in each job and it should be greater than 2
 
 select job_id , count(department_id) as dept_count from employees group by job_id having count(department_id) > 2 ;
  
 # 9. Find the max salary for each job id and department should be 60,90,100,110
 
 select job_id , max(salary) as max_salary from employees where department_id in (60,90,100,110) group by job_id;