create database hw;
use hw;

CREATE TABLE IF NOT EXISTS employees (
    employeeid INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (firstname, lastname, department, salary)
VALUES
    ('Иван', 'Иванов', 'IT', 60000.00),
    ('Петр', 'Петров', 'IT', 55000.00),
    ('Мария', 'Сидорова', 'HR', 45000.00),
    ('Елена', 'Козлова', 'HR', 48000.00),
    ('Анна', 'Смирнова', 'Finance', 55000.00),
    ('Алексей', 'Попов', 'Finance', 60000.00);
    
select * from employees;

/*Найти среднюю зарплату по всем сотрудникам.*/

select
avg(salary) as average_salary
from employees;

/*Подсчитать общее количество сотрудников в каждом департаменте.*/
select 
department,
count(*)
from employees
group by department;

/*Найти максимальную и минимальную зарплату в департаменте IT.*/
select 
department,
max(salary),
min(salary) 
from employees
where department = 'IT'
group by department;

/*Подсчитать суммарную зарплату для каждого отдела и вывести только те отделы, где суммарная зарплата больше 55000.*/
select
*
from
(select
department,
sum(salary) as sum_salary 
from employees
group by department) t1
where t1.sum_salary >55000;

/*Найти среднюю зарплату по отделам, исключая отдел HR.*/
select
*
from
(select
department,
avg(salary) as average_salary
from employees
group by department) t1
where t1.department !="IT";  