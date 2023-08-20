use lesson_1;
create table Customers(
id integer primary key auto_increment,
Name varchar(128) not null,
city varchar(128) not null);

drop table Customers;
select * from Customers;
insert into Customers (Name, city)
values("Anna", "Berlin");
insert into Customers (Name, city)
values("Ivan", "New-York");
insert into Customers (Name, city)
values("Maria", "Yerevan");
insert into Customers (Name, city)
values("Peter", "Bremen");
insert into Customers (Name, city)
values("Elena", "Hamburg");

create table Orders(
id integer primary key auto_increment,
Customer_ID int not null,
Amount int not null);

select * from Orders;
drop table Orders;

insert into Orders (Customer_ID, Amount) values(3, 1200);
insert into Orders (Customer_ID, Amount)
values(1, 800);
insert into Orders(Customer_ID, Amount)
values(4, 1500);
insert into Orders (Customer_ID, Amount)
values(2, 600);
insert into Orders (Customer_ID, Amount)
values(5, 2000);
/*1. Вывести список всех заказов вместе с именами покупателей и городами, в которых они проживают.*/
select
  t1.Name,
  t1.city,
  t2.Customer_ID,
  t2.Amount
from Customers t1
inner join Orders t2
on t1.id = t2.Customer_id;

/*2. Получить имена покупателей и ID заказов для заказов суммой более $1000.*/
select
  t2.id,
  t2.Amount,
  t1.Name
from Customers t1
inner join Orders t2
on t1.id = t2.Customer_id
where t2.amount > 1000;
/*3.Вывести список всех заказов и их сумм с указанием города, в котором проживает покупатель.*/
select
  t1.city,
  t2.id,
  t2.Amount
from Customers t1
inner join Orders t2
on t1.id = t2.Customer_id;
/*4. Найти все заказы покупателя с именем "Anna" и вывести информацию о них.*/
select
  t1.Name,
  t2.Customer_id,
  t2.id,
  t2.Amount
from Customers t1
inner join Orders t2
on t1.id = t2.Customer_id
where t1.Name ="Anna";
/*5.Вывести список всех покупателей и сумму, которую они потратили, включая тех, кто не сделал заказов.*/
select
  t1.Name,
  t2.Amount
from Customers t1
inner join Orders t2
on t1.id = t2.Customer_id;
