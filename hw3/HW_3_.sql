use lesson_1;
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO Clients (ClientID, Name, Email)
VALUES
    (1, 'Иван Иванов', 'ivan@example.com'),
    (2, 'Мария Петрова', 'maria@example.com'),
    (3, 'Алексей Смирнов', 'alex@example.com'),
    (4, 'Екатерина Козлова', 'ekaterina@example.com');
    INSERT INTO Clients (ClientID, Name, Email)
VALUES
     (5, 'Dima Lukyanenko', 'd.i.Lukyanenko@gmail.com');

CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    ClientID INT,
    OrderDate DATE,
    ProductID int
);

drop table orders1;

INSERT INTO Orders1 (OrderID, ClientID, ProductID, OrderDate)
VALUES
    (101, 1, 201, '2023-01-15'),
    (102, 2, 202, '2023-02-20'),
    (103, 1, 203, '2023-03-10'),
    (104, 3, 204, '2023-04-05'),
    (105, 4, 205, '2023-05-12');
    
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2)
);
    
INSERT INTO Products (ProductID, Name, Price)
VALUES
    (201, 'Ноутбук', 800.00),
    (202, 'Смартфон', 400.00),
    (203, 'Планшет', 300.00),
    (204, 'Наушники', 50.00),
    (205, 'Мышь', 20.00);

select * from Clients;
select * from Orders1;
select * from Products;
/*Напишите SQL-запрос, который выведет список клиентов и их заказов.*/


 select
 t1.Name,
 t2.OrderID
 from Clients t1
 inner join Orders1 t2
 on t1.ClientID = t2.ClientID;
 
/*Напишите SQL-запрос, который выведет список всех клиентов и их заказов, включая клиентов без заказов. Если у клиента нет заказов в поле OrderID должно быть значение -1.*/

 select
 t1.Name,
 coalesce(t2.OrderID, '-1') as Orders
 from Clients t1
 left join Orders1 t2
 on t1.ClientID = t2.ClientID;
/*Напишите SQL-запрос, который выведет список продуктов, имеющихся в заказах, и соответствующие им заказы и клиентов. Если продукт в заказах не встречается, выводить его не нужно.*/

select * from Products;
select * from orders1;
select * from Clients;


select
 t1.Name as Product_name,
 t2.OrderID as Orders,
 t3.Name
 from products t1
 inner join Orders1 t2
 on t1.ProductId = t2.ProductID
 inner join Clients t3
 on t2.ClientID = t3.ClientID;
 
 use lesson_1;
 select * from orders1;
 
/*Напишите SQL-запрос, который выведет список всех заказов и их клиентов, а также список продуктов в каждом заказе, используя INNER JOIN между всеми тремя таблицами.```*/

select
 t1.Name as Product_name,
 t2.OrderID as Orders,
 t3.Name
 from products t1
 inner join Orders1 t2
 on t1.ProductId = t2.ProductID
 inner join Clients t3
 on t2.ClientID = t3.ClientID;

/*Напишите SQL-запрос, который выведет список клиентов, у которых нет заказов.*/

 select
 t1.Name,
 coalesce(t2.OrderID, 'Do not have orders') as Orders
 from Clients t1
 left join Orders1 t2
 on t1.ClientID = t2.ClientID
 where t2.OrderID is null;
