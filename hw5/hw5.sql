use hw;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    age INT
);
CREATE TABLE disciplines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(255)
);

CREATE TABLE marks (
    studentid INT,
    disciplineid INT,
    mark INT
);

INSERT INTO students (firstname, last_name, age)
VALUES
    ('Иван', 'Иванов', 20),
    ('Мария', 'Петрова', 22),
    ('Алексей', 'Сидоров', 21);
    
INSERT INTO disciplines (title, category)
VALUES
    ('Математика', 'Обязательная'),
    ('История', 'Обязательная'),
    ('Иностранный язык', 'Выборная');
    
INSERT INTO marks (studentid, disciplineid, mark)
VALUES
    (1, 1, 85),
    (1, 2, 78),
    (2, 1, 92),
    (2, 3, 88),
    (3, 2, 75);

select * from students;
select * from disciplines;

/*Найти средний возраст студентов в каждой дисциплине.*/

select
t2.disciplineid,
t3.title,
avg(t1.age)
from students t1
left join marks t2
on t1.id=t2.studentid
left join disciplines t3
on t3.id = t2.disciplineid
group by t2.disciplineid;

/*Вывести список всех студентов и количество оценок, которые каждый из них получил.*/

select * from students;

select
t1.id,
t1.firstname,
t1.last_name,
count(t2.mark)
from 
students t1
left join marks t2
on t1.id = t2.studentid
group by t1.id;

/*Вывести список всех дисциплин и средний балл по каждой из них. Если нет оценок по дисциплине, вывести 0.*/
select * from disciplines;
select * from marks;

select
t1.id,
t1.title,
coalesce(avg(t2.mark),0) 
from disciplines t1
left join marks t2
on t1.id = t2.disciplineid
group by t1.id;

/*Найти студентов, получивших наивысший балл по каждой дисциплине.*/
select
t4.disciplineid,
max(t4.mark) as maxDisciplinMark
from(select
t1.studentid,
t2.firstname,
t2.last_name,
t1.disciplineid,
t3.title,
t1.mark
from marks t1
inner join students t2
on t1.studentid = t2.id
inner join disciplines t3
on t1.disciplineid = t3.id) t4
group by t4.disciplineid;


/*Найти средний балл студентов, получивших более 80 баллов в дисциплине "Математика".*/

select 
avg(t4.mark) as avgMark
from(select
t1.firstname,
t1.last_name,
t2.mark,
t3.title
from students t1
left join marks t2
on t1.id = t2.disciplineid
left join disciplines t3
on t2.disciplineid = t3.id
where t3.title = 'Математика'
having t2.mark > 80) t4;

/*Найти студентов, чьи имена начинаются с буквы "А", и вывести средний их возраст.*/
select
avg(t1.age) as avgAge
from(select
*
from students
where firstname like 'А%') t1;
