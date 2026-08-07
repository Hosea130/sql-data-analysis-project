create database supermarket;
use supermarket;
create table sales(
sale_id int auto_increment primary key,
product_name varchar(50) not null,
category varchar(30),
customer_name varchar(50),
quantity int,
price decimal(10,2),
sale_date date,
city varchar(30) 
);

INSERT INTO sales VALUES
(1,'Laptop','Electronics','John',1,12000,'2026-01-05','Johannesburg'),
(2,'Mouse','Electronics','Mary',2,250,'2026-01-06','Pretoria'),
(3,'Bread','Groceries','Peter',3,20,'2026-01-06','Johannesburg'),
(4,'Milk','Groceries','Sarah',2,25,'2026-01-07','Cape Town'),
(5,'Phone','Electronics','James',1,8000,'2026-01-08','Durban'),
(6,'Rice','Groceries','Mary',5,150,'2026-01-09','Pretoria'),
(7,'TV','Electronics','John',1,6000,'2026-01-10','Johannesburg'),
(8,'Eggs','Groceries','Sarah',2,45,'2026-01-10','Cape Town');

-- shows all the sales
SELECT * FROM sales;

-- shows the total_revenue
SELECT SUM(quantity * price) AS total_revenue 
FROM sales;

-- revenue by category
SELECT category,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY category;

-- revenue by city
SELECT city,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC;

-- best-selling products
SELECT product_name,
       SUM(quantity) AS total_sold
FROM sales
GROUP BY product_name
ORDER BY total_sold DESC;