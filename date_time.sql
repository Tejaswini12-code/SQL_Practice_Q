-- 1. Write a query to display the first day of the month (in datetime format) three months before the current month.

select date_sub(curdate(), interval 3 month);

SELECT date_format(date_sub(curdate(), interval 3 month), '%Y-%m-01') as first_day;

-- 2. Write a query to display the last day of the month (in datetime format) three months before the current month.

select date_format(date_sub(curdate(), interval 3 month), '%Y-%m-30') as last_day;

-- 3. Write a query to get the distinct Mondays from hire_date in employees tables.

select distinct hire_date from employees where dayofweek(hire_date)= 2;


-- 4. Write a query to get the first day of the current year.

select makedate(year(curdate()), 1) as first_day_of_year;


-- 5. Write a query to get the last day of the current year.

select makedate(year(curdate()),365) as last_day_of_year;

-- 6. Write a query to calculate the age in year

select timestampdiff(year, '2001-05-12', curdate()) as age;

-- 7. Write a query to get the current date in the following format.   Sample date : 2014-09-04     Output : September 4, 2014

select date_format(curdate(), '%M %e, %Y') as formatted_date;

-- 8. Write a query to get the current date in the following format. Thursday September 2014

select date_format(curdate(), '%W %M %Y') as formatted_date;


-- 9. Write a query to extract the year from the current date.

select year(curdate()) as current_year;

-- 10. Write a query to get the DATE value from a given day (number in N).  Sample days : 730677  Output : 2000-07-11  Date and Time functions

select date_add('0000-01-01', interval 730677 day) as result_date;


-- 11. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' Sample table : employees

select first_name, hire_date
from employees
where hire_date between '1987-06-01' and '1987-07-30';


-- 12. Write a query to display the current date in the following format Sample output : Thursday 4th September 2014 00:00:00

select date_format(curdate(), '%W %D %M %Y 00:00:00') as formatted_date;


-- 13.Write a query to display the current date in the following format. Sample output : 05/09/2014

select date_format(curdate(),'%d/%m/%Y') as formatted_date;

-- 14.Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014

select date_format(curdate(), '12:00 am %b %e, %Y') as formatted_date;

-- 15. Write a query to get the firstname, lastname who joined in the month of June. Sample table : employees

select first_name,last_name from employees where month(Hire_Date)=6;

-- 16. Write a query to get the years in which more than 10 employees joined. Sample table : employees

select year(hire_date) as joining_year, count(*) as employee_count
from employees
group by year(hire_date)
having count(*) > 10;

-- 17. Write a query to get first name of employees who joined in 1987. Date and Time functions Sample table : employees

select first_name
from employees
where year(hire_date) = 1987;

-- 18. Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years. Sample table : departments

select d.department_name, e.first_name as manager_name, e.salary
from departments d
join employees e on d.manager_id = e.employee_id
where timestampdiff(year, e.hire_date, curdate()) > 5;

-- 19. Write a query to get employee ID, last name, and date of first salary of the employees. Sample table : employees

select employee_id,last_name,hire_date, hire_date + interval 1 month as first_salary_date from employees;

-- 20. Write a query to get first name, hire date and experience of the employees. Sample table : employees

select first_name, hire_date, timestampdiff(year, hire_date, curdate()) as experience_years from employees;

